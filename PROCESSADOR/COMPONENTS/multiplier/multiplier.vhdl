-----------------------------------------------------
-- title       : multiplicador de 8 bits
-- project     : multiplicador
-- file        : multiplier.vhdl
-- author      : Kevin Willyn
-----------------------------------------------------
-- description :  multiplicador com entradas de 8 bits

library ieee;

entity multiplier is
	generic(
		n : integer := 8
	);
	
	port(
		A , B   : in integer range 0 to 2**n-1;
		mult    : out integer range 0 to 4**n-1
	);
	
end multiplier;

architecture main of multiplier is
begin

	mult <= A * B;
	
end main;