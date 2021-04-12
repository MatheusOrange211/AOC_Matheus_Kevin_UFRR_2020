LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY p_xor IS
    PORT (
        in_port_A : IN STD_LOGIC;
        in_port_B : IN STD_LOGIC;
        out_port : OUT STD_LOGIC
    );
END p_xor;

ARCHITECTURE behavior OF p_xor IS
    
    COMPONENT p_and IS 
        PORT(
            in_port_A : IN STD_LOGIC;
            in_port_B : IN STD_LOGIC;
            out_port : OUT STD_LOGIC
        );
    END COMPONENT;

    COMPONENT p_or IS 
    PORT(
        in_port_A : IN STD_LOGIC;
        in_port_B : IN STD_LOGIC;
        out_port : OUT STD_LOGIC
    );
    END COMPONENT;

    COMPONENT p_not IS 
    PORT(
        in_port_A : IN STD_LOGIC;
        out_port : OUT STD_LOGIC
    );
    END COMPONENT;

    SIGNAL not_A ,not_B, out_and_1, out_and_2, out_or : std_logic;
    
BEGIN
    n_a : p_not PORT MAP (in_port_A, not_A);
    n_b : p_not PORT MAP (in_port_B, not_B);

    p_an : p_and PORT MAP (not_A, in_port_B,out_and_1);
    p_bn : p_and PORT MAP (in_port_A, not_B,out_and_2);

    p_o : p_or PORT MAP(out_and_1, out_and_2, out_or);

    out_port <= out_or;
END behavior;
