-----------------------------------------------------
-- title       : divisao de instrucao
-- project     : division_instruction 
-- file        : division_instruction.vhd
-- author      : Matheus Naranjo
-----------------------------------------------------
-- description : divisor de isntrucoes para as trilhas

library ieee;
use ieee.std_logic_1164.ALL;

entity division_instruction is
    port(
        in_port: in std_logic_vector(7 downto 0);
        out_op_code: out std_logic_vector(3 downto 0);
        out_rs: out std_logic_vector(1 downto 0);
        out_rt: out std_logic_vector(1 downto 0);
        out_jump: out std_logic_vector(3 downto 0)
    );
end division_instruction;

architecture behavior of  division_instruction is

    begin
        out_op_code <= in_port(7 downto 4); -- 4
        out_rs <= in_port(3 downto 2); -- 2
        out_rt <= in_port(1 downto 0); -- 2
        out_jump <= in_port(3 downto 0); --3
    end behavior;