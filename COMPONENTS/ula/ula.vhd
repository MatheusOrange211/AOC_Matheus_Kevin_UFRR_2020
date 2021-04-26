library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity ula is 
	port(
	
	inA, inB  : in std_logic_vector(7 downto 0);
	outS      : out std_logic_vector(7 downto 0);
	selec     : in std_logic_vector(3 downto 0)	
	
	);
	
end ula;

architecture main of ula is
	
	component zero is
		port(
			in_port : in std_logic;
			out_port : out std_logic
		);
	end component;
	
	 -- Para usar na instrução (1010) if para o beq e bne
    SIGNAL in_temp_zero : std_logic;
    SIGNAL out_temp_zero : std_logic;
	
	 SIGNAL multi : std_logic_vector(15 DOWNTO 0);

BEGIN
		
		port_map_temp_zero : zero PORT MAP(in_temp_zero, out_temp_zero);
	
		process(inA,inB,selec)
		begin
			case selec is  
			when "0000" => outS <= inA + inB; --add
			when "0001" => outS <= inA + inB; --addi
			when "0010" => outS <= inA - inB; --subb
			when "0011" => outS <= inA - inB; --subbi
			when "0100" =>  --mult
				multi <= inA * inB;
				outS <= multi(7 downto 0);
			when "0101" => outS <= inA; --lw	
			when "0110" => outS <= inA; --sw
			when "0111" => outS <= inB; --move
			when "1000" => outS <= inB; --li
			when "1001" => outS <= inA and inB;--beq
			when "1010" => outS <= inA or inB;--bne
			when "1011" => -- If beq e bne
				if inA = inB then
					in_temp_zero <= '1';
				else
					in_temp_zero <= '0';
				end if;
				outS <= "00000000";
			when others => outS <= "ZZZZZZZZ";
		end case;
	end process;
end main;	
		