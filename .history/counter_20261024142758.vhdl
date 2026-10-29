LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY counter IS
    PORT (
        clk : IN STD_LOGIC;
        reset_n : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        set : IN STD_LOGIC;
        din : IN unsigned(7 DOWNTO 0);
        counter : OUT unsigned(7 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE rtl OF counter IS
    SIGNAL int_counter : unsigned(7 DOWNTO 0);
BEGIN


    counter <= int_counter;
    PROCESS (reset_n, clk)
    BEGIN
        IF (reset_n = '0') THEN
            int_counter <= (OTHERS => '0');
        ELSIF (rising_edge(clk)) THEN
            IF (set = '1') THEN
                int_counter <= din;
            ELSIF (enable = '1') THEN
                int_counter <= int_counter + 1;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;