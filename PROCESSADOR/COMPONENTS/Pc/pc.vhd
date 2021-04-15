-----------------------------------------------------
-- title       : Program Counter - contador de programas
-- project     : PC
-- file        : pc.vhd
-- author      : Kevin Willyn
-----------------------------------------------------
-- description :  registrador e endereco da funcao - contem o endereco de uma instrucao a ser lida

library ieee;
use ieee.std_logic_1164.ALL;

entity pc is 
	port (
		clock : in std_logic;
		inPort : in std_logic_vector (7 downto 0);
		outPort : out std_logic_vector (7 downto 0)
	);
end pc;

architecture main of pc is
begin 
	process(clock)
	begin 
		if rising_edge(clock) then
			outPort <= inPort;
		end if;
	end process;
end main; 