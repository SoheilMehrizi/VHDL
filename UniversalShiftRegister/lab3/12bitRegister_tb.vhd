library ieee;
use ieee.std_logic_1164.all;

entity twelve_bit_register_tb is
end twelve_bit_register_tb;

architecture Behavioral of twelve_bit_register_tb is

    -- Component declaration for the unit under test (UUT)
    component twelve_bit_register
    port(
        clk : in std_logic;
        data_in : in std_logic_vector(11 downto 0);
        increment : in std_logic;
        Load : in std_logic;
        out_data : out std_logic_vector(11 downto 0);
        carry_out : out std_logic
        );
    end component;

    -- Clock period definitions
    -- constant clk_period : time := 10 ns;

    -- Signal declarations
    signal clk : std_logic := '0';
    signal data_in : std_logic_vector(11 downto 0) := (others => '0');
    signal increment : std_logic := '0';
    signal Load : std_logic := '0';
    signal out_data : std_logic_vector(11 downto 0);
    signal carry_out : std_logic;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: twelve_bit_register port map (
        clk => clk,
        data_in => data_in,
        increment => increment,
        Load => Load,
        out_data => out_data,
        carry_out => carry_out
    );

    -- Clock process definitions
    -- clk_process :process
    -- begin
    --     clk <= '0';
    --     wait for 5 ns;
    --     clk <= '1';
    --     wait for 5 ns;
    -- end process;

    -- Stimulus process
    stim_proc :process
    begin
        clk <= '1';
        wait for 10 ns;
        clk <= '0';
        -- Load data into the register
        data_in <= "110011001100";
        increment <= '0';
        Load <= '0';
        wait for 10 ns;
        
        -- Increment the value in the register
        clk <= '1';
        
        wait for 10 ns;
        clk <= '0';
        -- Load new data into the register
        -- data_in <= "101010101010";
        Load <= '0';
        wait for 10 ns;
        clk <= '1';
        Load <= '1';
        
        wait for 10 ns;
        clk <= '0';
        increment <= '1';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
        clk <= '0';
        wait for 10 ns;
        clk <= '1';
        wait for 10 ns;
        clk <= '1';
    end process;

end Behavioral;