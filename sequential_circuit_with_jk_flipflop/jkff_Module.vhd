library ieee;
use ieee . std_logic_1164 .   all;
use ieee . std_logic_arith.   all;
use ieee . std_logic_unsigned.all;

entity JK_FF is port(
    clk, reset, J, K : in  std_logic;
    Q, NQ            : out std_logic
);
end JK_FF;

architecture behavioral of JK_FF is
    -- o means out
    signal o1, o2, o3, o4 : std_logic;
    begin
        process(clk)
        begin
            if (clk'event and clk = '1') then
                if reset = '1' then
                    o3 <= '0';
                    o4 <= '1';
                else    
                    o1     <= (J and o4 and clk);
                    o2     <= (k and o3 and clk);
                    o3     <=  o1 NOR o4;
                    o4     <=  o2 NOR o3;
                end if;
                Q      <=     o3;
                NQ     <= not o3;
            end if;
        end process;
    end behavioral;