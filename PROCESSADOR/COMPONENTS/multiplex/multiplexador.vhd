-----------------------------------------------------
-- title       : multiplexador  2X1
-- project     : multiplexador  2X1
-- file        : multiplexador.vhd
-- author      : Kevin Willyn
-----------------------------------------------------
-- description :  Multiplexador modelo 2x1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY multiplexador IS
    PORT (
        inPort : IN std_logic;
        inA : IN std_logic_vector(7 downto 0);
        inB : IN std_logic_vector(7 downto 0);
        out_Port : OUT std_logic_vector(7 downto 0)
    );
END multiplexador ;

ARCHITECTURE main OF multiplexador IS
BEGIN
    PROCESS (inPort, inA, inB)
    BEGIN
        CASE inPort IS
            WHEN '0' => out_Port <= inA;
            WHEN '1' => out_Port <= inB;
        END CASE;
    END PROCESS;
END main;