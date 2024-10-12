library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Mod9_counter is port(
	CE         : in boolean;
	clk, clear : in std_logic;
	count      : inout std_logic_vector (3 downto 0);
	ld         : inout std_logic
	);
	end Mod9_counter;
architecture behavioral of Mod9_counter is 
	begin
		process (clk, ld)
			begin
				if CE then
					if (clear = '1')then
						count <= "0001";
					end if;
					if (ld = '1')then
						count <= "0001";
					elsif(rising_edge(clk))then
						count <= count+1;
					end if;
					if (count = "1001")then 
						ld<='1';
					end if;
				end if;
			end process;
end;