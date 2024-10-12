
library ieee;
use ieee.std_logic_1164.all;

entity Multiplexer_tb is 
end Multiplexer_tb;

Architecture tb of Multiplexer_tb is
component Multiplexer
port(a, b, c, d: in std_logic;
     sel: in std_logic_vector(1 downto 0);
     z: out std_logic);
end component;

signal a, b, c, d, z: std_logic; signal sel: std_logic_vector(1 downto 0);

begin
b1 : 
    Multiplexer port map(a, b, c, d, sel, z);
    --- this test bench tests the multiplexer module functionality
    sel <= "00", "01" after 10 ns, "10" after 20 ns, "11" after 30 ns;
    a <= '1';
    b <= '1';
    c <= '0';
    d <= '1';
end tb;