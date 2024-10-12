
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity datapath is 
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

end datapath;


architecture Behavioral of datapath is
    signal datapath_bus : unsigned(15 downto 0) := (others => '0');
begin 
process(selector)
-- this is the bus datapath , acourding to the selector , the desired result will provide .
begin
with selector select 
        datapath_bus <= unsigned(Data_Register_in) when "000",
        datapath_bus(15 downto 4) <= unsigned(Address_register) when "001",
        unsigned(Accomulator) when "010",
        unsigned(IR) when "011",
        unsigned(Program_Counter) when "100",
        unsigned(Temp_register) when "101",
        unsigned(INPR) when "110",
        unsigned(OUTR) when others;
    out_data <= std_logic_vector(datapath_bus);
end process;
end Behavioral;

