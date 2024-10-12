library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use ieee.numeric_std.all;

  entity ALU is
    port (
      s : in std_logic_vector(3 downto 0);
      A : in std_logic_vector(15 downto 0);
      B : in std_logic_vector(15 downto 0);
      out_put : out std_logic_vector(15 downto 0);
      carry_out : out std_logic
    );
  end ALU;
  
architecture Behavioral of ALU is
  signal ALU_result : std_logic_vector(15 downto 0);
  signal temp: std_logic_vector(16 downto 0);

  begin
  with s select
      -- Arithmatic Unit
      ALU_result <= A + B when "0000",
      A + B + '1' when "0001",
      A - B when "0010",
      A+ B + '1' when "0011",
      A when "0100",
      A + '1' when "0101",
      A - '1' when "0110",
      A when "0111",
      -- Logic Unit
      A and B when "1000",
      A or B when "1001",
      A xor B when "1010",
      not A when others;

  out_put <= ALU_result;
  temp <= ('0' & A) + ('0' & B);
  carry_out <= temp(16);

end Behavioral;