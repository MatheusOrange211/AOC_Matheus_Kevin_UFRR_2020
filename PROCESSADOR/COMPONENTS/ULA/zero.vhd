library ieee;
use ieee.std_logic_1164.all;

entity zero is
	port (
		in_port : in std_logic;
		out_port : out std_logic
	);
end zero;

architecture main of zero is
begin
		out_port <= in_port;
end main;