-----------------------------------------------------
-- title       : porta not
-- project     : porta not
-- file        : p_not.vhd
-- author      : Matheus Naranjo
-----------------------------------------------------
-- description :  criacao da porta logica not que inverte os bits de entrada (entra 0, vira 1)

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;


ENTITY p_not IS 
    PORT(
        in_port_A: IN std_logic;
        out_port: OUT std_logic
    );
END p_not;

ARCHITECTURE behavior OF p_not IS 
BEGIN 
    out_port <= NOT(in_port_A);
END behavior;
