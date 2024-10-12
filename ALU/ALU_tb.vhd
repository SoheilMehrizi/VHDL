library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity ALU_tb is
end ALU_tb;
architecture test_bench of ALU_tb is
Component ALU
    port (
      s : in std_logic_vector(3 downto 0);
      A : in std_logic_vector(15 downto 0);
      B : in std_logic_vector(15 downto 0);
      out_put : out std_logic_vector(15 downto 0);
      carry_out : out std_logic
    );
end Component;

signal selector_signal : std_logic_vector(3 downto 0) := "0000";
signal A_input_signal : std_logic_vector(15 downto 0) := (others => '0');
signal B_input_signal : std_logic_vector(15 downto 0) := (others => '0');
signal out_put_signal : std_logic_vector(15 downto 0) := (others => '0');
signal carry_out_signal: std_logic := '0';

begin
p1: ALU port map (
    selector_signal, A_input_signal, B_input_signal, out_put_signal, carry_out_signal
);
process
begin
-- initializing input signals 
A_input_signal <= "0001001000110100";
B_input_signal <= "0101011001111000";
-- slector changing states 
selector_signal <= "0000";-- Sum(A, B)
wait for 10 ns;
selector_signal <= "0001";-- Sum(Sum(A, B), '1')
wait for 10 ns;
selector_signal <= "0010";-- Subtract(A, B)
wait for 10 ns;
selector_signal <= "0011";-- Passing the A itself
wait for 10 ns;
selector_signal <= "0100";-- Sum(Sum(A, B), '1')
wait for 10 ns;
selector_signal <= "0101";-- Sum(A, '1')
wait for 10 ns;
selector_signal <= "0110";-- Subtract(A, '1')
wait for 10 ns;
selector_signal <= "0111";-- Passing the A itself
wait for 10 ns;
selector_signal <= "1000";-- and(A, B)
wait for 10 ns;
selector_signal <= "1001";-- or(A, B)
wait for 10 ns;
selector_signal <= "1010";-- xor(A, B)
wait for 10 ns;
selector_signal <= "1011";-- not(A)

end process;

end test_bench;