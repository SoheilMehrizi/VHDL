--this code would test the functionality of D_FlipFlop module

library ieee;
use ieee.std_logic_1164.all;

entity DFF_testbench is 
end DFF_testbench;

Architecture testbench of DFF_testbench is
component D_FF 
port (D, clk, rst:in std_logic;
      Q:out std_logic);
end component;

signal D, clk, rst, Q : std_logic;

begin 
b1: D_FF port map(D, clk, rst, Q);

    process 
        begin 
            D <= '0';
            clk <= '0';
            rst <= '0';
            wait for 10 ns;
            clk <= '1';

            wait for 10 ns;
            clk <= '1';
            wait for 10 ns;
            rst <= '0';
            D <= '0';
            wait for 40 ns;
            D <= '1';
            wait for 40 ns;
            
        end process;
end testbench;