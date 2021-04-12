library ieee;
USE ieee.std_logic_1164.ALL;

entity sign_extension_2_8 is
    port(
        in_port : IN std_logic_vector(1 DOWNTO 0);
        out_port: OUT std_logic_vector(1 DOWNTO 0)
    );
end sign_extension_2_8;

architecture behavior of sign_extension_2_8 is
    begin
        process(in_port)
        begin
            out_port <= ("000000") & in_port;
        end process;
    end behavior;