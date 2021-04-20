-----------------------------------------------------
-- title       : Banco de registradores
-- project     : Banco de registradores
-- file        : banco_registrador.vhd
-- author      : Matheus Naranjo
-----------------------------------------------------
-- description :  variaveis que serao usadas para armazenar dados e realizar operacoes

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity banco_registrador is
    port(
        clk: in std_logic;
        reg_write: in std_logic;
        address_a : in std_logic_vector(1 downto 0);
        address_b : in std_logic_vector(1 downto 0);
        write_data: in std_logic_vector(7 downto 0);
        reg_out_a: out std_logic_vector(7 downto 0);
        reg_out_b: out std_logic_vector(7 downto 0)
    );
end banco_registrador;


architecture behavior of banco_registrador is
    type banco_registrador is array(0 to 3) of std_logic_vector(7 downto 0);
    signal reg : banco_registrador;

begin
        process(clk)
        begin
            if rising_edge(clk) then
                if(reg_write = '1') then
                    reg(to_integer(unsigned(address_a))) <= write_data;
                end if;
            end if;
            reg_out_a <= reg(to_integer(unsigned(address_a)));
            reg_out_b <= reg(to_integer(unsigned(address_b)));
        end process;
end behavior;