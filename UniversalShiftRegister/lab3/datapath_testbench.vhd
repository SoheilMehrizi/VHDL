library ieee;
use ieee.std_logic_1164.all;

entity DataPath_tb is
end DataPath_tb;


architecture testbench of DataPath_tb is

-- Component declaration for unit under test 

component datapath
port(
        selector : in std_logic_vector(2 downto 0);
        Data_Register_in : in std_logic_vector(15 downto 0);
        Address_register: in std_logic_vector(11 downto 0);
        Accomulator : in std_logic_vector(15 downto 0);
        IR: in std_logic_vector(15 downto 0);
        Program_Counter: in std_logic_vector(11 downto 0);
        Temp_register: in std_logic_vector(15 downto 0);
        INPR : in std_logic_vector(15 downto 0);
        OUTR : in std_logic_vector(15 downto 0);
        out_data : out std_logic_vector(15 downto 0) 
);
end component;

-- signal declaration

signal sel: std_logic_vector(2 downto 0);
signal DR_in : std_logic_vector(15 downto 0);
signal AR_in: std_logic_vector(11 downto 0);
signal AC : std_logic_vector(15 downto 0);
signal IR: std_logic_vector(15 downto 0);
signal PC: std_logic_vector(11 downto 0);
signal TR: std_logic_vector(15 downto 0);
signal INPR : std_logic_vector(15 downto 0);
signal OUTR : std_logic_vector(15 downto 0);
signal out_bus : std_logic_vector(15 downto 0);

begin

-- Instantiate the Unit Under Test

A : datapath port map(
    sel, DR_in, AR_in, AC, IR, PC, TR, INPR, OUTR, out_bus
);
-- stimulus process
    process

        begin 
        -- Initialization
        DR_in <= "0000000101000101";
        AR_in <= "000100100011";
        AC <= "0010011101011000";
        IR <= "1010000100100011";
        PC <= "000100000000";
        TR <= "1001101110100101";
        INPR <= "0000101011011100";
        OUTR <= "1000100110100101";
        -- test all selections
        sel <= "001";
        wait for 10 ns;
        sel <= "000";

        

    end process;
end testbench;