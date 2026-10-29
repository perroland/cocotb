LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY counter IS
    PORT (
        clk : IN STD_LOGIC;
        reset_n : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        set : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        count : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    );

    ARCHITECTURE rtl OF counter IS
    BEGIN
        PROCESS (reset_n, clk)
        BEGIN
            IF reset_n = '0' THEN
                count <= (OTHERS => "0");
            ELSIF (rising_edge(clk)) THEN
                IF (set = '1') THEN
                    count <= din;
                ELSIF (enable) BEGIN
                    count <= count + 1;
                END IF;
            END IF;
        END PROCESS;
    END ARCHITECTURE;