--def the structural operation of the sr latch (without clock)
library ieee;
use ieee.std_logic_1164.all;

entity SRlatch is port(
	clk, reset, SN, RN : IN  std_logic;
	Q , QN : OUT std_logic
	);
	end SRlatch;

architecture Structural_SRlatch of SRlatch is
	signal o1, o2 : std_logic;
	begin
		process(clk)
		begin
			if (clk'event and clk = '1') then
			if reset = '1' then
				o1 <= '0';
				o2 <= '1';
			else
				o1 <= SN nand o2;
				o2 <= RN nand o1;
				
			Q  <= o1;
			QN <= not o1;
			end if;
			end if;
		end process;
	end Structural_SRlatch;