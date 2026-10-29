LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

ENTITY counter IS
    PORT (
        clk : IN STD_LOGIC;
        reset_n : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        set : IN STD_LOGIC;
        din : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        counter : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE rtl OF counter IS
BEGIN
    PROCESS (reset_n, clk)
    BEGIN
        IF reset_n = '0' THEN
            counter <= (OTHERS => "0");
        ELSIF (rising_edge(clk)) THEN
            IF (set = '1') THEN
                counter <= din;
            ELSIF (enable = '1') THEN
                counter <= count + 1;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;