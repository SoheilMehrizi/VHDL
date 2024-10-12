--test bench of BCD(1-9) counter
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity TBC is
end TBC;

architecture testbench of TBC is
	signal CE                : boolean;
	signal clk, clear, ld : std_logic;
	signal count : std_logic_vector(3 downto 0);
	component Mod9_counter port(
		CE         : in boolean;
		clk, clear : in std_logic;
		count      : inout std_logic_vector (3 downto 0);
		ld         : inout std_logic
		);
	end component;
	
	begin
		
		C1 : Mod9_counter port map (CE, clk, clear, count, ld);
			CE    <= true;
			clear <= '1', '0' after 10 ns;
			clk   <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns,'0' after 60 ns, '1' after 70 ns, '0' after 80 ns, '1' after 90 ns,'0' after 100 ns,
							    '1' after 110 ns, '0' after 120 ns, '1' after 130 ns, '0' after 140 ns, '1' after 150 ns, '0' after 160 ns, '1' after 170 ns, '0' after 180 ns;			
	end testbench;
		