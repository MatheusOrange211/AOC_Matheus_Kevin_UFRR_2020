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
        0 => "01111111", -- li S3 3
        1 => "10111111", -- mul S3 S3 == 9
        2 => "00011111", -- addi S3 1  == 12
        3 => "00011110", -- addi S3 2  == 14
        4 => "00011110", -- addi S3 2  == 16
        5 => "01111000", -- li S2 0
        6 => "01110000", -- li S0 0 
        7 => "01010000", -- sw S0 ram(00)  ==  a = 0
        8 => "01110001", -- li S0 1
        9 => "01010001", -- sw S0 ram(01) == b = 1
        
        10 => "01000000", -- lw S0 ram(00)
        11 => "00000100", -- add S1 S0
        12 => "01000001", -- lw S0 ram(01)
        13 => "00000100", -- add S1 S0
        14 => "01010000", -- sw S0 ram(00)  ==  a = b
        15 => "01010101", -- sw s1 ram(01) == b = aux
        
        16 => "00011001", -- addi s2 1
        17 => "10101011", -- if S2 == S3
        18 => "10011010", -- bne S2 != S3 jump 1010
        19 => "01110000", -- li S0 0
        20 => "01110100", -- li S1 0
        21 => "01111000", -- li S2 0
        22 => "01111100", -- li S3 0
        OTHERS => "00000000"
    );
begin
    main : process(address)
    begin
        dout <= mem(to_integer(unsigned(address)));
    end process main;
end behavior;
