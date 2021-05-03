-----------------------------------------------------
-- title       : Memoria Rom
-- project     : Memory rom
-- file        : memory_rom.vhd
-- author      : Matheus Naranjo
-----------------------------------------------------
-- description :  construcao da memoria ROM (READ ON)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity single_port_rom is
    port(
        address: in std_logic_vector(7 downto 0);
        dout   : out std_logic_vector(7 downto 0)
    );
end single_port_rom;

architecture behavior of single_port_rom is
    type memory is array (0 to 255 ) of std_logic_vector(7 downto 0);
    constant mem : memory := (
        0 => "01111111",
        OTHERS => "00000000"
    );
begin
    main : process(address)
    begin
        dout <= mem(to_integer(unsigned(address)));
    end process main;
end behavior;
