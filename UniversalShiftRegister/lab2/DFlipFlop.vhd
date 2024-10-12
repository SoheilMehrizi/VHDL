--this vhdl code represents the D FlipFlop Behavioral Architecture."
 --wer're gonna use this module for structuring the Universal Shift Register"


library ieee;
use ieee.std_logic_1164.all;
entity D_FF is
port (D, clk, rst: in std_logic;
      Q: out std_logic);
end D_FF;

Architecture behavioral of D_FF is 
begin 
    process(D, clk, rst)
    begin 
        if (rst ='1') then 
            Q <= '0';
        elsif(rising_edge(clk))then 
        Q <= D;
        end if;
    end process;
end behavioral;