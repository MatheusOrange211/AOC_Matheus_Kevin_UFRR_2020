-----------------------------------------------------
-- title       : subtrador de 8 bits
-- project     : subtrador
-- file        : subtrador.vhdl
-- author      : Kevin Willyn
-----------------------------------------------------
-- description :  subtrador com entradas de 8 bits

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity subtrador is
	
	port(
		A    : in unsigned (7 downto 0);
		B    : in unsigned (7 downto 0);
		Sub  : out unsigned (7 downto 0) 
	);
	
end entity;

architecture main of subtrador is
begin

	Sub <= A - B;
	
end main;
