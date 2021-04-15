-----------------------------------------------------
-- title       : multiplexador  2X1
-- project     : multiplexador  2X1
-- file        : multiplexador.vhd
-- author      : Kevin Willyn
-----------------------------------------------------
-- description :  Multiplexador modelo 2x1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY multplexador IS
    PORT (
        inPort : IN std_logic;
        inA : IN std_logic;
        inB : IN std_logic;
        outPort : OUT std_logic
    );
END multplexador ;

ARCHITECTURE main OF multplexador IS
BEGIN
    PROCESS (inPort, inA, inB)
    BEGIN
        CASE inPort IS
            WHEN '0' => outPort <= in_A;
            WHEN '1' => outPort <= in_B;
        END CASE;
    END PROCESS;
END main;