library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity add is 
	port(
		clock : in std_logic;
		inPort : in std_logic_vector(7 downto 0);
		outPort : out std_logic_vector(7 downto 0)
	);
end add;
architecture main of add is
	begin
	process(clock)
	begin
		outPort <= inPort + "00000001";
	end process;
end main;