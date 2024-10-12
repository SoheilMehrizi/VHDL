library ieee;
use ieee.std_logic_1164.all;
-- use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

entity memory is
    port(
        read_port : in std_logic;
        write_port : in std_logic;
        Address : in std_logic_vector(11 downto 0);
        in_put : in  std_logic_vector(15 downto 0);
        out_put: out std_logic_vector(15 downto 0)
    );

end memory;
    
architecture Behavioral of memory is
type memory is array (4095 downto 0) of std_logic_vector(15 downto 0);
signal ram: memory;

begin
process(write_port, read_port)
begin
    if write_port = '1' then
        out_put <= ram(conv_integer(Address));
    elsif read_port = '1' then
        ram(conv_integer(Address)) <= in_put;       
        
    end if;
end process;
end Behavioral;