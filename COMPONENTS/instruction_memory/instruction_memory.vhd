library ieee;
use ieee.std_logic_1164.ALL;

entity instruction_memory is
    port(
        in_port: in std_logic_vector(7 downto 0);
        out_op_code: out std_logic_vector(3 downto 0);
        out_rs: out std_logic_vector(1 downto 0);
        out_rt: out std_logic_vector(1 downto 0);
        out_jump: out std_logic_vector(3 downto 0)
    );
end instruction_memory;


architecture behavior of  instruction_memory is

    begin
        out_op_code <= in_port(7 downto 4);
        out_rs <= in_port(3 downto 2);
        out_rt <= in_port(1 downto 0);
        out_jump <= in_port(3 downto 0);
    end behavior;