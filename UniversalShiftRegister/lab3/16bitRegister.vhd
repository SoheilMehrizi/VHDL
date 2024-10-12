
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity twelve_bit_register is
    port(
        clk : in STD_LOGIC;
        data_in : in STD_LOGIC_VECTOR (15 downto 0);
        increment : in STD_LOGIC;
        Load : in STD_LOGIC;
        out_data : out STD_LOGIC_VECTOR (15 downto 0);
        carry_out : out STD_LOGIC
    );
end twelve_bit_register;

architecture Behavioral of twelve_bit_register is
    signal reg : unsigned(15 downto 0) := (others => '0');
    signal carry : STD_LOGIC;

begin
    process (clk)
    begin
        if rising_edge(clk) and Load = '1' then
            -- with the rising edge of the clock and Load == 1, then the content of the register will update
            reg <= unsigned(data_in);

            -- increment the current value of register , if increment was equal to '1';
            if increment = '1' then 
                reg <= reg + 1;
            end if;
        end if;

        -- check for carry
        if reg = "1111111111111111" then
            carry <= '1';
        else
            carry <= '0';
        end if;
    end process;

    out_data <= std_logic_vector(reg);
    carry_out <= carry;

end Behavioral;