-----------------------------------------------------
-- title       : sign extension 4 to 8 bits
-- project     : sign extension
-- file        : sign_extension_4_8.vhd
-- author      : Matheus Naranjo
-----------------------------------------------------
-- description :  extensor de 4 bits de entrada para 8 bits de saida


library ieee;
USE ieee.std_logic_1164.ALL;

entity sign_extension_4_8 is
    port(
        in_port : IN std_logic_vector(3 DOWNTO 0);
        out_port: OUT std_logic_vector(7 DOWNTO 0)
    );
end sign_extension_4_8;

architecture behavior of sign_extension_4_8 is
    begin
        process(in_port)
        begin
            out_port <= ("0000") & in_port;
        end process;
    end behavior;

    