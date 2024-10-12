library ieee;
use ieee.std_logic_1164.all;
--state machine Module
entity StateMachine is port(
	X, clk    : in    std_logic;
	reset	  : in    std_logic;
	output   : OUT  STD_LOGIC_VECTOR(1 downto 0)
);
end StateMachine;
--behavioral of state machine

architecture behavioral of StateMachine is
	 Type STATE_TYPE is (s0, s1, s2, s3);
	 signal state: STATE_TYPE;
	 begin
		process(clk, reset)
		begin
			if reset = '1' then
				state <= s0;
			elsif (clk'event and clk = '1') then
				CASE state is
					when s0=>
						if X = '1' then
							state <= s3;
						else
							state <= s1;
						END if;
					when s1=>
					if X = '1' then
						state <= s0;
					else
						state <= s2;
					END if;
					when s2=>
					if X = '1' then
						state <= s1;
					else
						state <= s3;
					END if;
					when s3=>
					if X = '1' then
						state <= s2;
					else
						state <= s0;
					END if;	
				END CASE;
			END if;
		end process;

		PROCESS (state)
		BEGIN
		   CASE state IS
			    WHEN s0 =>
					output <= "00";
			    WHEN s1 =>
					output <= "10";
			    WHEN s2 =>
					output <= "10";
				WHEN s3 =>
					output <= "10";
		   END CASE;
		END PROCESS;
END behavioral;

