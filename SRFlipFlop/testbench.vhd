--def TestBench of Structural SRLatch(without clock) => TBSSRL
library ieee;
use ieee.std_logic_1164.all;
entity TBSSRL is
end TBSSRL;
architecture testbench of TBSSRL is
	signal clk, reset, SN, RN, Q, QN : std_logic;
	component SRlatch port(
		clk, reset, SN, RN : IN  std_logic;
		Q , QN : OUT std_logic
		);
		end component;
		begin
			c1 : SRlatch port map(clk,reset, SN, RN, Q, QN);
			clk   <= '0', '1' after 5  ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0'  after 30 ns, '1' after 35  ns,'0' after 40 ns; 
			reset <= '0', '1' after 5  ns, '0' after 10 ns;
			SN    <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns;
			RN    <= '0', '1' after 5  ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0' after 30 ns, '1'  after 35 ns, '0' after 40 ns;  
end testbench;