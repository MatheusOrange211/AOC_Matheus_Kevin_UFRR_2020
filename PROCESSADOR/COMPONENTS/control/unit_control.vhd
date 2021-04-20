-----------------------------------------------------
-- title       : Unidade de Controle
-- project     : Unidade de Conrole
-- file        : unit_control.vhd
-- author      : Matheus Naranjo
-----------------------------------------------------
-- description :  responsavel por comunicar quais flags sao ativadas durante o processo de operacoes passadas

library ieee;
use ieee.std_logic_1164.all;

entity unit_control is
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
end unit_control;

architecture behavior of unit_control is
begin
    process(clk)
    begin
        case op_code is
            when "0000" => -- add operacao de adicao
                j <= '0';
                branch <= '0';
                mem_read <= '0';
                mento_reg <= '0';
                ulaop <= "0000";
                mem_write <= '0';
                ula_src <= '0';
                reg_write <= '1';

            when "0001" is --addi adicao imediata
                j <= '0';
                branch <= '0';
                mem_read <= '0';
                mento_reg <= '0';
                ulaop <= "0001";
                mem_write <= '0';
                ula_src <= '1';
                reg_write <= '1';

            when "0010" is --sub operacao de subtracao
                j <= '0';
                branch <= '0';
                mem_read <= '0';
                mento_reg <= '0';
                ulaop <= "0010";
                mem_write <= '0';
                ula_src <= '0';
                reg_write <= '1';
            
            when "0011" is  --subi subtracao imediata
                j <= '0';
                branch <= '0';
                mem_read <= '0';
                mento_reg <= '0';
                ulaop <= "0011";
                mem_write <= '0';
                ula_src <= '1';
                reg_write <= '1';
            
            when "0100" is --mul operacao de multiplicacao
                j <= '0';
                branch <= '0';
                mem_read <= '0';
                mento_reg <= '0';
                ulaop <= "0100";
                mem_write <= '0';
                ula_src <= '0';
                reg_write <= '1';
            
            when "0101" is --lw load word
                j <= '0';
                branch <= '0';
                mem_read <= '1';
                mento_reg <= '1';
                ulaop <= "0101";
                mem_write <= '0';
                ula_src <= '0';
                reg_write <= '1';
            
            when "0110" is --sw store word
                j <= '0';
                branch <= '0';
                mem_read <= '0';
                mento_reg <= '0';
                ulaop <= "0110";
                mem_write <= '1';
                ula_src <= '0';
                reg_write <= '0';
            
            when "0111" is --move
                j <= '0';
                branch <= '0';
                mem_read <= '0';
                mento_reg <= '0';
                ulaop <= "0111";
                mem_write <= '0';
                ula_src <= '0';
                reg_write <= '1';
            
            when "1000" is --li load imediate
                j <= '0';
                branch <= '0';
                mem_read <= '0';
                mento_reg <= '0';
                ulaop <= "1000";
                mem_write <= '0';
                ula_src <= '1';
                reg_write <= '1';
            
            when "1001" is --beq
                j <= '0';
                branch <= '1';
                mem_read <= '0';
                mento_reg <= '0';
                ulaop <= "1001";
                mem_write <= '0';
                ula_src <= '0';
                reg_write <= '0';

            when "1010" is --bne
                j <= '0';
                branch <= '1';
                mem_read <= '0';
                mento_reg <= '0';
                ulaop <= "1010";
                mem_write <= '0';
                ula_src <= '0';
                reg_write <= '0';
            
            when "1011" is  --if beq e bne
                j <= '0';
                branch <= '0';
                mem_read <= '0';
                mento_reg <= '0';
                ulaop <= "1011";
                mem_write <= '0';
                ula_src <= '0';
                reg_write <= '0';
            
            when "1111" is --jump
                j <= '1';
                branch <= '0';
                mem_read <= '0';
                mento_reg <= '0';
                ulaop <= "1111";
                mem_write <= '0';
                ula_src <= '0';
                reg_write <= '0';
                
        end case;
    end process;
end behavior;