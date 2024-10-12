library ieee;
use ieee.std_logic_1164.all;

entity shift_register is port(
    clk , load : in  std_logic;
    pin        : in  std_logic_vector(15 downto 0);
    pout       : out std_logic_vector(15 downto 0)
);
end shift_register;

architecture behave of shift_register is
    signal tmp  : std_logic_vector(15 downto 0);
    begin
        process(clk)
        begin
            if (clk'event and clk = '1')then
                if load = '1' then
                    tmp <= pin;
                else
                    tmp <= '0' & tmp(15 downto 1);
                end if;
            end if;
        end process;
        pout <= tmp;
    end behave;
