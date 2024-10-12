--This is a VHDL Code to Structure a Multiplexer


library ieee;
use ieee.std_logic_1164.all;
entity Multiplexer is
port (a, b, c, d: in std_logic; 
      sel: in std_logic_vector(1 downto 0);
      z: out std_logic);
end Multiplexer;

Architecture structure of Multiplexer is 
begin 
--- this architecture is going to determine the behavior of 2_1 Multiplexer
  with sel select
    z <= a when "00",
     b when "01",
     c when "10",
     d  when others; 
end structure;
