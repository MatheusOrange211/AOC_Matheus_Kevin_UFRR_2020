-----------------------------------------------------
-- title       : Memoria RAM
-- project     : Memoria RAM
-- file        : ram.vhd
-- author      : Kevin Willyn
-----------------------------------------------------
-- description :  Desenvolvimento da memoria Ram


library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ram is
	port
	(	
		clock		: in std_logic;
		mem_write: IN std_logic;
      mem_read : IN std_logic;
		inA	   : in std_logic_vector(7 downto 0);
		addr     : in std_logic_vector(7 downto 0);
		outS		: out std_logic_vector(7 downto 0)
	);
	
end entity;

architecture main of ram is

	subtype word_t is std_logic_vector(7 downto 0);
	type memoria_temp is array(7 downto 0) of word_t;
	
	signal memoria_ram : memoria_temp;
begin
	process(clock)
	begin
		if(rising_edge(clock)) then
			if(mem_write = '1') then
				memoria_ram(to_integer(unsigned(addr))) <= inA;
			end if;
			if(mem_read = '1') then
				outS <= memoria_ram(to_integer(unsigned(addr)));
			end if;
		end if;
	end process;	
end main;