library ieee;
use ieee.std_logic_1164.all;
entity SHRTB is
    end SHRTB;
architecture testbench of SHRTB is
    signal clk, load : std_logic;
    signal pin, pout : std_logic_vector(15 downto 0);
    component shift_register port(
        clk , load : in  std_logic;
        pin        : in  std_logic_vector(15 downto 0);
        pout       : out std_logic_vector(15 downto 0)
    );
    end component;
    begin
        c1 : shift_register port map(clk, load, pin, pout);
        clk  <= '0', '1' after 5  ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0' after 30 ns, '1' after 35 ns, '0' after 40 ns;
        load <= '0', '1' after 5 ns, '0' after 15 ns , '1' after 25 ns, '0' after 30 ns, '1' after 40 ns;
        pin  <= "0100110010001010", "1011001101110101" after 35 ns;
    
    end testbench;