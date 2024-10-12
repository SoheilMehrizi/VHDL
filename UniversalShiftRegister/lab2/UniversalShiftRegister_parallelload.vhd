library ieee;
use ieee.std_logic_1164.all;

entity UniversalShiftRegister_ParallelLoad is 
end UniversalShiftRegister_ParallelLoad;

Architecture testbench of UniversalShiftRegister_ParallelLoad is

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
    -- parallel load
    tb1_Paralel_load: UniversalShiftRegister port map(
        input_left, input_right, clock, reset,
        in_put, out_put, selector
    );
        process
            begin
                -- ports initial assignment
                clock <= '0';
                reset <= '1';
                input_right <= '1';
                input_left <= '0';
                selector(1) <= '0';
                selector(0) <= '0';
                wait for 10 ns;
                -- first clock's negetive edge
                clock <= '0';
                reset <= '0';
                wait for 10 ns;
                clock <= '1';
                -- at posedge clock rise , input('0110') will load on element
                in_put(3) <= '0';
                in_put(2) <= '1';
                in_put(1) <= '1';
                in_put(0) <= '0';
                wait for 10 ns;
                -- after 10 ns the negetive edge of clock will rise. 
                clock <= '0';
                wait for 10 ns;
                clock <= '1';
                -- when clock's pos edge arrives , the input ('1000') will load on element.
                in_put(3) <= '1';
                in_put(2) <= '0';
                in_put(1) <= '0';
                in_put(0) <= '0';
                wait for 10 ns;
                -- after 10 ns the negetive edge of clock will rise.
                clock <= '0';
                wait for 10 ns ;
                -- when clock's pos edge arrives , the input ('1001') loads on element.
                clock <= '1';
                in_put(3) <= '1';
                in_put(2) <= '0';
                in_put(1) <= '0';
                in_put(0) <= '1';
                wait for 10 ns;
                --  after 10 ns the negetive edge of clock will rise.
                clock <= '0';
                wait for 10 ns;
                clock <= '1';
                -- when clock's pos edge arrives , the input ('1111') loads on element.
                in_put(3) <= '1';
                in_put(2) <= '1';
                in_put(1) <= '1';
                in_put(0) <= '1';
            end process;
end testbench;
