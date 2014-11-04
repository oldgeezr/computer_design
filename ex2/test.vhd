library ieee;
use ieee.std_logic_1164.all;

entity test is
  generic (ADDR_WIDTH : integer := 8);
  port (
		reg1 : out std_logic_vector(ADDR_WIDTH-1 downto 0);
		reg2 : out std_logic_vector(ADDR_WIDTH-1 downto 0)
  );
end entity;

architecture rtl of test is

  -- Test signals and constants
  signal register_value               : std_logic_vector(ADDR_WIDTH-1 downto 0) := x"01";
  signal clk                          : std_logic := '0';
  constant clkperiod                  : time := 10 ns;

	-- Instruction Fetch/Decode
	signal if_id_new_pc                 : std_logic_vector(ADDR_WIDTH-1 downto 0);

	-- Instruction Decode/Execute
	signal id_ex_new_pc                 : std_logic_vector(ADDR_WIDTH-1 downto 0);

begin

  clk <= not clk after clkperiod/2;

  registers : process (clk)
  begin

    if rising_edge(clk) then
      if_id_new_pc <= register_value;
		id_ex_new_pc <= if_id_new_pc;  
    end if;

  end process;
  
  reg1 <= id_ex_new_pc;
  reg2 <= if_id_new_pc;

end architecture;
