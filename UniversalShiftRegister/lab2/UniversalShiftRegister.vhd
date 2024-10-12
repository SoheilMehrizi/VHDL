library ieee;
use ieee.std_logic_1164.all;

entity UniversalShiftRegister is 
    port (
            IL, IR, clock, rst: in std_logic;
            i : in std_logic_vector(3 downto 0);
            o : inout std_logic_vector(3 downto 0);
            s : in std_logic_vector(1 downto 0)
        );
end UniversalShiftRegister;
architecture structure of UniversalShiftRegister is 

    component D_FF
        Port(D, clk, rst: in std_logic;
             Q: out std_logic);
    end component;

    component Multiplexer
        Port(a, b, c, d: in std_logic;
             sel: in std_logic_vector(1 downto 0);
             z: out std_logic);
    end component;

    signal out_put: std_logic_vector(3 downto 0);
    signal in_put: std_logic_vector(3 downto 0);
    signal D : std_logic_vector(3 downto 0);
    signal Ileft, Iright : std_logic;
    signal clk, reset : std_logic;
    signal sel: std_logic_vector(1 downto 0);
begin 

   stage3_block: -- Label for the block statement
    block
    begin
        U3: Multiplexer
            port map(in_put(3), out_put(2), Iright, out_put(3), sel, D(3));
        U4: D_FF
            port map(D(3), clk, reset, out_put(3));
    end block;

    stage2_block: -- Label for the block statement
    block
    begin
        U1: Multiplexer
            port map(in_put(2), out_put(1), out_put(3), out_put(2), sel, D(2));
        U2: D_FF
            port map(D(2), clk, reset, out_put(2));
    end block;

    stage1_block: -- Label for the block statement
    block
    begin
        U5: Multiplexer
            port map(in_put(1), out_put(0), out_put(2) , out_put(1) , sel, D(1));
        U6: D_FF
            port map(D(1), clk, reset, out_put(1));
    end block;

    stage0_block: -- Label for the block statement
    block
    begin
        U7: Multiplexer
            port map(in_put(0), Ileft , out_put(1) , out_put(0) , sel, D(0));
        U8: D_FF
            port map(D(0), clk, reset, out_put(0));
    end block;


      

    in_put(3) <= i(3);
    in_put(2)<=i(2);
    in_put(1)<=i(1);
    in_put(0)<=i(0);

    o(3) <= out_put(3);
    o(2) <= out_put(2);
    o(1) <= out_put(1);
    o(0) <= out_put(0);
    
    
    sel(0)<=s(0);
    sel(1)<=s(1);

    Ileft <= IL;
    Iright <= IR;
    clk <= clock;
    reset <= rst;

end structure;