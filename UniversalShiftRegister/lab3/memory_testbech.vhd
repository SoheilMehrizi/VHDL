library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Memory_tb is
end Memory_tb;

architecture testbench of Memory_tb is

-- Component Declaration for unit under test

component memory
    port(
        read_port : in std_logic;
        write_port : in std_logic;
        Address : in std_logic_vector(11 downto 0);
        in_put : in  std_logic_vector(15 downto 0);
        out_put: out std_logic_vector(15 downto 0)
    );

end component;

-- signal declaration 

signal read_port : std_logic;
signal write_port: std_logic;
signal Address: std_logic_vector(11 downto 0);
signal in_put: std_logic_vector(15 downto 0);
signal out_put: std_logic_vector(15 downto 0);