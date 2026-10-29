LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY counter IS
    PORT (
        clk : IN STD_LOGIC;
        rst : IN STD_LOGIC;
        ena : IN STD_LOGIC;
        set : IN STD_LOGIC;
        din : IN unsigned(7 DOWNTO 0);
        count : OUT unsigned(7 DOWNTO 0)
    );
END ENTITY;

ARCHITECTURE rtl OF counter IS
    SIGNAL int_count : unsigned(7 DOWNTO 0);
BEGIN
    count <= int_count;
    PROCESS (rst, clk)
    BEGIN
        IF (rst = '1') THEN
            int_count <= (OTHERS => '0');
        ELSIF (rising_edge(clk)) THEN
            IF (set = '1') THEN
                int_count <= din;
            ELSIF (ena = '1') THEN
                int_count <= int_count + 1;
            END IF;
        END IF;
    END PROCESS;
END ARCHITECTURE;
