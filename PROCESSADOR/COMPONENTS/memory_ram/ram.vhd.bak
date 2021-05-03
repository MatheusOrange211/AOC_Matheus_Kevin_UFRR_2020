-----------------------------------------------------
-- title       : Memoria RAM
-- project     : Memoria RAM
-- file        : ram.vhd
-- author      : Kevin Willyn
-----------------------------------------------------
-- description :  Desenvolvimento da memoria Ram


library ieee;
use ieee.std_logic_1164.all;

entity ram is
	port
	(
		inA	   : in std_logic_vector(7 downto 0);
		addr	   : in natural range 0 to 7;
		we		   : in std_logic := '1';
		clock		: in std_logic;
		outS		: out std_logic_vector(7 downto 0)
	);
	
end entity;

architecture main of ram is

	subtype word_t is std_logic_vector(7 downto 0);
	type memory_t is array(7 downto 0) of word_t;
	
	signal s_ram : memory_t;
	
	signal addr_reg : natural range 0 to 7;

begin

	process(clock)
	begin
		if(rising_edge(clock)) then
			if(we = '1') then
				s_ram(addr) <= inA;
			end if;
			addr_reg <= addr;
		end if;
	end process;
	outS <= s_ram(addr_reg);
	
end main;