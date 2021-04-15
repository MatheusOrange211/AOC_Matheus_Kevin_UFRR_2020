-----------------------------------------------------
-- title       : somador  de 8 bits
-- project     : somador
-- file        : adder_8bits.vhd
-- author      : Matheus Naranjo
-----------------------------------------------------
-- description :  Somador capaz de operar com entradas de 8 bits

library ieee;
use ieee.std_logic_1164.ALL;

entity adder_8bits is
    port(
        in_port_A: in std_logic_vector(7 downto 0);
        in_port_B: in std_logic_vector(7 downto 0);
        cin      : in std_logic;
        cout     : out std_logic;
        out_port : out std_logic_vector(7 downto 0)
    );
end adder_8bits;

architecture behavior of adder_8bits is
begin
    process(in_port_A, in_port_B, cin)
    variable temp: std_logic_vector(7 downto 0);
    variable c: std_logic;
    begin
    c := cin;

    temp(0):= in_port_A(0) xor in_port_B(0) xor c;  --bit 0 
    c := (in_port_A(0) and in_port_B(0)) or ((in_port_A(0) xor in_port_B(0))  and c);

    temp(1):= in_port_A(1) xor in_port_B(1) xor c; --bit 1
    c := (in_port_A(1) and in_port_B(1)) or ((in_port_A(1) xor in_port_B(1))  and c);
    
    temp(2):= in_port_A(2) xor in_port_B(2) xor c; --bit 2
    c := (in_port_A(2) and in_port_B(2)) or ((in_port_A(2) xor in_port_B(2))  and c);

    temp(3):= in_port_A(3) xor in_port_B(3) xor c; --bit 3
    c := (in_port_A(3) and in_port_B(3)) or ((in_port_A(3) xor in_port_B(3))  and c);

    temp(4):= in_port_A(4) xor in_port_B(4) xor c; --bit 4
    c := (in_port_A(4) and in_port_B(4)) or ((in_port_A(4) xor in_port_B(4))  and c);

    temp(5):= in_port_A(5) xor in_port_B(5) xor c; --bit 5
    c := (in_port_A(5) and in_port_B(5)) or ((in_port_A(5) xor in_port_B(5))  and c);

    temp(6):= in_port_A(6) xor in_port_B(6) xor c; --bit 6
    c := (in_port_A(6) and in_port_B(6)) or ((in_port_A(6) xor in_port_B(6))  and c);

    temp(7):= in_port_A(7) xor in_port_B(7) xor c; --bit 7
    c := (in_port_A(7) and in_port_B(7)) or ((in_port_A(7) xor in_port_B(7))  and c); 

    cout <= c;
    out_port <= temp; --atribuindo resultado final a saida
    end process;
    
end behavior;