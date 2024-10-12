library ieee;
use ieee . std_logic_1164.    all;
use ieee . std_logic_arith.   all;
use ieee . std_logic_unsigned.all;
--SQCTB means : sequential circuit test bench
entity SQCTB is 
end SQCTB;



architecture testbench of SQCTB is
    signal clk, reset ,Ja, Jb, Ka, Qa, Qb, NQa, NQb : std_logic;
    component JK_FF port(
        clk, reset, J, K : in  std_logic;
        Q, NQ             : out std_logic  
    );
    end component;
begin
    -- wiring the circute in A and B
    A: JK_FF port map(clk, reset, Ja, Ka,  Qa, NQa);
    B: JK_FF port map(clk, reset, Jb, NQa, Qb, NQb);

    clk   <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0' after 30 ns, '1' after 35 ns, '0' after 40 ns;
    reset <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 35 ns;
    Ja    <= '0';
    Ka    <= '1';
    Jb    <= '1';
    end testbench;