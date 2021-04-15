-----------------------------------------------------
-- title       : porta or
-- project     : porta or
-- file        : p_or.vhd
-- author      : Matheus Naranjo
-----------------------------------------------------
-- description :  criacao da porta logica or que recebe duas entradas e gera uma saida

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY p_or IS
    PORT (
        in_port_A : IN STD_LOGIC;
        in_port_B : IN STD_LOGIC;
        out_port : OUT STD_LOGIC
    );
END p_or;

ARCHITECTURE behavior OF p_or IS
BEGIN
    out_port <= in_port_A OR in_port_B;
END behavior;
