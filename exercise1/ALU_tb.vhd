library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

---------------------------------------------------

entity ALU_tb is

end entity ALU_tb;

---------------------------------------------------

architecture behavioral of ALU_tb is

-- component ports
signal data_1: std_logic_vector(31 downto 0);
signal data_2: std_logic_vector(31 downto 0);
signal alu_op: std_logic_vector(3 downto 0);
signal result: std_logic_vector(31 downto 0);
signal zero: std_ulogic;

-- clock
  constant clk_period : time := 20 ns;
  signal clk : std_logic := '1';

begin	-- architecture behavioural

  -- component instantiation
  DUT: entity work.ALU
    port map (
      data_1      => data_1,
      data_2      => data_2,
      alu_op => alu_op,
      result     => result,
      zero      => zero
		);
		
	 -- clock generation
  clk <= not clk after clk_period/2;	
		
	-- waveform generation
  WaveGen_Proc: process
  begin
    -- insert signal assignments here
    wait until clk='1';
	 alu_op <= x"0";
    data_1 <= x"000000FF";
	 data_2 <= x"000000F0";
	 
  end process WaveGen_Proc;

end behavioral;

----------------------------------------------------