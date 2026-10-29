LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

entity counter is 
    port(
        clk     : in std_logic;
        reset_n : in std_logic;
        enable : in std_logic;
        set : in std_logic;
        din : in std_logic_vector(7 downto 0);
        count : out std_logic_vector(7 downto 0);
    );
    
architecture rtl of counter is 
begin
    if ()