--test bench of State Machine 
library ieee;
use ieee.std_logic_1164.all;

entity TBSM is
end TBSM;

architecture testbench of TBSM is
	signal reset,clk, X: std_logic;
	signal output: STD_LOGIC_VECTOR(1 downto 0);
	component StateMachine port(
		X, clk  : in    std_logic;
		reset   : in    std_logic;
		output  : OUT   std_logic_vector(1 downto 0)
	);
	end component;
	begin
		C1 : StateMAchine port map(X, clk, reset, output);

		reset <= '1' , '0'  after 5  ns,  '1' after 50 ns;
		clk   <= '0' , '1'  after 5  ns,  '0'  after 10 ns, '1'  after 15 ns, '0' after 20 ns, '1' after 25 ns, '0' after 30 ns, '1' after 35 ns;
		X     <= '0' , '1'  after 5  ns,  '0'  after 10 ns, '1'  after 15 ns, '0' after 20 ns, '1' after 25 ns, '0' after 30 ns, '1' after 35 ns;
		
	end testbench;