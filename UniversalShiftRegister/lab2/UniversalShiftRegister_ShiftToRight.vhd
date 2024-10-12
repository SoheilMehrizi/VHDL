library ieee;
use ieee.std_logic_1164.all;

entity UniversalShiftRegister_ShiftToRight is 
end UniversalShiftRegister_ShiftToRight;

Architecture testbench of UniversalShiftRegister_ShiftToRight is

component UniversalShiftRegister 
port(
    IL, IR, clock, rst: in std_logic;
    i : in std_logic_vector(3 downto 0);
    o : inout std_logic_vector(3 downto 0);
    s : in std_logic_vector(1 downto 0)
);
end component;

signal input_left, input_right, clock, reset : std_logic;

signal in_put , out_put: std_logic_vector(3 downto 0);
signal selector: std_logic_vector(1 downto 0);

begin
    -- shift to right
    tb2_shift_to_right: UniversalShiftRegister port map(
        input_left, input_right, clock, reset,
        in_put, out_put, selector
    );
        process
            begin
                -- ports initial assignment

                clock <= '0';
                reset <= '1';
                -- in  right shift register , at each shift the value at input_right (instance) will replace with Most Valuable bit of sequence. 
                input_right <= '1';
                -- in  left shift register , at each shift the value at input_left (instance) will replace with least Valuable bit of sequence.
                input_left <= '0';
                -- the initially values for 4 bit input.
                in_put(3) <= '0';
                in_put(2) <= '1';
                in_put(1) <= '1';
                in_put(0) <= '0';
                -- selectors on '11' for initial assignment, it would be a parallel load .
                selector(1) <= '0';
                selector(0) <= '0';
                wait for 10 ns;
                -- first clock's negetive edge, RESET PORT TURNS LOW .
                clock <= '0';
                reset <= '0';

                wait for 10 ns;
                clock <= '1';
                -- since this setting , each time at posetive rise edge of clock , the output shifts to right for 1 bit.
                wait for 10 ns;
                -- after 10 ns the negetive edge of clock will rise. 
                clock <= '0';
                -- changing the universal shift register by changing in selectors value to '10' Shift to right .
                selector(1) <= '1';
                selector(0) <= '0';

                wait for 10 ns;
                clock <= '1';
                -- when clock's pos edge arrives , 1 bit shift to right .
                wait for 10 ns;
                -- after 10 ns the negetive edge of clock will rise.
                clock <= '0';
                wait for 10 ns ;
                -- when clock's pos edge arrives , 1 bit shift to right .
                clock <= '1';
                wait for 10 ns;
                --  after 10 ns the negetive edge of clock will rise.
                clock <= '0';
                wait for 10 ns;
                clock <= '1';
                wait for 10 ns;
                clock <= '0';
            end process;
end testbench;
