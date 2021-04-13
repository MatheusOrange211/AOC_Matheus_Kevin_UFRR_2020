library ieee;
use ieee.std_logic_1164.ALL;

entity Pc is 
	port (
		clock : in std_logic;
		inPort : in std_logic_vector (7 downto 0);
		outPort : out std_logic_vector (7 downto 0)
	);
end Pc;

architecture main of Pc is
begin 
	process(clock)
	begin 
		if rising_edge(clock) then
			outPort <= inPort;
		end if;
	end process;
end main; 