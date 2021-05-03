library ieee;
use ieee.std_logic_1164.all;

entity processador_MK10 is
	port(
		-- clock 
		clock : in std_logic;
		-- Trilha do PC
		outPc : out std_logic_vector(7 downto 0);
		-- ram
		outRam : out std_logic_vector(7 downto 0);
		-- rom
		outRom : out std_logic_vector(7 downto 0);
		-- ula
		outUla : out std_logic_vector(7 downto 0);
		-- banco de registradores
		out_br_regA : out std_logic_vector(7 downto 0);
		out_br_regB : out std_logic_vector(7 downto 0);
		-- divisão de instrução
		out_opcode : out std_logic_vector(3 downto 0);
		out_rs : out std_logic_vector(1 downto 0);
		out_rt : out std_logic_vector(1 downto 0);
		out_endereco : out std_logic_vector(3 downto 0);
		
		out_out_mult4_2X1_ram_ula : out std_logic_vector(7 downto 0)
	);
end processador_MK10;

architecture main of processador_MK10 is
	
	component pc is 
		port (
			clock : in std_logic;
			inPort : in std_logic_vector (7 downto 0);
			outPort : out std_logic_vector (7 downto 0)
		);
	end component;
	
	component add is 
		port(
			clock : in std_logic;
			inPort : in std_logic_vector(7 downto 0);
			outPort : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component division_instruction is
		port(
         in_port: in std_logic_vector(7 downto 0);
         out_op_code: out std_logic_vector(3 downto 0);
         out_rs: out std_logic_vector(1 downto 0);
         out_rt: out std_logic_vector(1 downto 0);
			out_jump: out std_logic_vector(3 downto 0)
		);
	end component;
	
	component sign_extension_4_8 is
		port(
			in_port : IN std_logic_vector(3 DOWNTO 0);
			out_port: OUT std_logic_vector(7 DOWNTO 0)
		);
	end component;
	
	component unit_control is
		port(
			clk: in std_logic;
			op_code: in std_logic_vector(3 downto 0);
			j : out std_logic;
			branch: out std_logic;
			mem_read: out std_logic;
			memto_reg: out std_logic;
			ulaop: out std_logic_vector(3 downto 0);
			mem_write : out std_logic;
			ula_src : OUT std_logic;
			reg_write: out std_logic
		);
	end component;
	
	component single_port_rom is
		port(
			address: in std_logic_vector(7 downto 0);
			dout   : out std_logic_vector(7 downto 0)
		);
	end component;
	
	component sign_extension_2_8 is
		port(
			in_port : IN std_logic_vector(1 DOWNTO 0);
			out_port: OUT std_logic_vector(7 DOWNTO 0)
		);
	end component;
	
	component multiplexador IS
    PORT (
        inPort : IN std_logic;
        inA : IN std_logic_vector(7 downto 0);
        inB : IN std_logic_vector(7 downto 0);
        out_Port : OUT std_logic_vector(7 downto 0)
    );
	end component;
	
	component ula is 
		port(
			selec : in std_logic_vector(3 downto 0);
			inA 	: in  std_logic_vector(7 downto 0);
			inB  	: in  std_logic_vector(7 downto 0);
			outS  : out std_logic_vector(7 downto 0);
			s_zero: out std_logic	
		);
	end component;
	
	component p_and IS
		PORT (
			in_port_A : IN STD_LOGIC;
			in_port_B : IN STD_LOGIC;
			out_port : OUT STD_LOGIC
		);
	end component;
	
	component ram is
	port
		(
			clock		: in std_logic;
			mem_write: IN std_logic;
			mem_read : IN std_logic;
			inA	   : in std_logic_vector(7 downto 0);
			addr     : in std_logic_vector(7 downto 0);
			outS		: out std_logic_vector(7 downto 0)
		);
	end component;
	
	component banco_registrador is
    port(
        clock: in std_logic;
        reg_write: in std_logic;
        address_a : in std_logic_vector(1 downto 0);
        address_b : in std_logic_vector(1 downto 0);
        write_data: in std_logic_vector(7 downto 0);
        reg_out_a: out std_logic_vector(7 downto 0);
        reg_out_b: out std_logic_vector(7 downto 0)
    );
	end component;
	
	--Pc
	signal out_pc : std_logic_vector(7 downto 0);
	
	--Add
	signal out_addr: std_logic_vector(7 downto 0);
	
	--Extensor de sinal 2 para 8 bits
	signal out_ES_2_8: std_logic_vector(7 downto 0);
	
	--Extensor de sinal 4 para 8 bits
	signal out_ES_4_8: std_logic_vector(7 downto 0);
	
	--Porta AND
	signal out_port_and: std_logic;
	
	--ULa
	signal out_ula_result: std_logic_vector(7 downto 0);
	signal out_ula_zero: std_logic;
	
	--ram
	signal out_ram: std_logic_vector(7 downto 0);
	
	--rom
	signal out_rom: std_logic_vector(7 downto 0);
	
	--instruction division
	signal out_di_7_4: std_logic_vector(7 downto 4);
	signal out_di_3_2: std_logic_vector(1 downto 0);
	signal out_di_1_0: std_logic_vector(1 downto 0);
	signal out_di_3_0: std_logic_vector(3 downto 0);
	
	--banco de registradores
	signal out_br_reg_A: std_logic_vector(7 downto 0);
	signal out_br_reg_B: std_logic_vector(7 downto 0);
	
	--multiplexador 2x1(mux1), que fica entre o Banco de registradores e a ula
	signal out_mult1_2x1_br_ula : std_logic_vector(7 downto 0);
	
	--multiplexador 2x1(mux2), que recebe o extensor de sinal 4/8 e o add
	signal out_mult2_2x1_add_es :  std_logic_vector(7 downto 0);
	
	--multiplexador 2x1(mux3), que recebe do muliplexador anterior(mux2) do extensor de sinal e o jump
	signal out_port_map_mult3_2X1_jump : std_logic_vector (7 DOWNTO 0);
	
	--multiplexador 2x1(mux4), que recebe da ula e da memoria ram
	signal out_mult4_2x1_ram_ula: std_logic_vector(7 downto 0);
	
	-- unidade de controle
	signal out_uc_j: std_logic;
	signal out_uc_branch: std_logic;
	signal out_uc_mem_read: std_logic;
	signal out_uc_memto_reg: std_logic;
	signal out_uc_ula_op: std_logic_vector(3 downto 0);
	signal out_uc_mem_write: std_logic;
	signal out_uc_ula_src: std_logic;
	signal out_uc_reg_write: std_logic;

begin
	--Port Maps
	
	port_map_addr : add port map (clock,out_pc,out_addr);
	port_map_pc: pc port map (clock,out_port_map_mult3_2X1_jump,out_pc);
	port_map_rom: single_port_rom port map (out_pc,out_rom);
	port_map_divisao_intrucao : division_instruction port map (out_rom,out_di_7_4,out_di_3_2,out_di_1_0,out_di_3_0);
	port_map_unidade_de_controle: unit_control port map(clock,out_di_7_4,out_uc_j,out_uc_branch,out_uc_mem_read,out_uc_memto_reg,out_uc_ula_op,out_uc_mem_write,out_uc_ula_src,out_uc_reg_write);
	port_map_banco_de_registradores: banco_registrador port map(clock,out_uc_reg_write,out_di_3_2,out_di_1_0,out_mult4_2x1_ram_ula,out_br_reg_A,out_br_reg_B);
	port_map_extensor_sinal_2_8: sign_extension_2_8 port map (out_di_1_0,out_ES_2_8);
	port_map_mult1_2x1_br_ula: multiplexador port map (out_uc_ula_src,out_br_reg_B,out_ES_2_8,out_mult1_2x1_br_ula);
	port_map_ula: ula port map (out_uc_ula_op,out_br_reg_A,out_mult1_2x1_br_ula,out_ula_result,out_ula_zero);
	port_map_ram: ram port map (clock,out_uc_mem_write,out_uc_mem_read,out_ula_result,out_ES_2_8,out_ram);
	port_map_mult4_2x1_ram_ula: multiplexador port map (out_uc_memto_reg,out_ula_result,out_ram,out_mult4_2x1_ram_ula);
	port_map_extensor_sinal_4_8: sign_extension_4_8 port map (out_di_3_0,out_ES_4_8);
	port_map_porta_and: p_and port map (out_uc_branch,out_ula_zero,out_port_and);
	port_map_mult2_2x1_add_es : multiplexador port map (out_port_and,out_addr,out_ES_4_8,out_mult2_2x1_add_es);
	port_map_mult3_2X1_jump: multiplexador port map (out_uc_j,out_mult2_2x1_add_es,out_ES_4_8,out_port_map_mult3_2X1_jump);
	
	-- Resultados das Saidas
	outPc <= out_pc;
	outRom <= out_rom;
	out_opcode <= out_di_7_4;
	out_rs <= out_di_3_2;
	out_rt <= out_di_1_0;
	out_endereco <= out_di_3_0;
	out_br_regA <= out_br_reg_A;
	out_br_regB <= out_br_reg_B;
	outUla <= out_ula_result;
	outRam <= out_ram;
	out_out_mult4_2X1_ram_ula <= out_mult4_2x1_ram_ula;
	
end main;