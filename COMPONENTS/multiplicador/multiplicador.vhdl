-----------------------------------------------------
-- title       : multiplicador de 8 bits
-- project     : multiplicador
-- file        : multiplicador.vhdl
-- author      : Kevin Willyn
-----------------------------------------------------
-- description :  multiplicador com entradas de 8 bits

library ieee;

entity multiplicador is
	generic(
		n : integer := 8
	);
	
	port(
		A , B   : in integer range 0 to 2**n-1;
		mult    : out integer range 0 to 4**n-1
	);
	
end entity;

architecture main of multiplicador is
begin

	mult <= A * B;
	
end main;