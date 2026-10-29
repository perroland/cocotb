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
        IF reset_n = '0' then
            count <= (others => "0");
        elsif(rising_edge(clk)) then
            if (set='1') then 
                count <= din;
            elsif (enable)