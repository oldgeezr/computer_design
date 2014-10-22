library ieee;
use ieee.std_logic_1164.all;

entity test is
  generic (ADDR_WIDTH = 8);
end entity;

architecture rtl of test is

  -- Test signals and constants
  signal register_value               : std_logic_vector(ADDR_WIDTH-1 downto 0) := x"01";
  signal clk                          : std_logic;
  constant clkperiod                  : time := 10 ns;

	-- Instruction Fetch/Decode
	signal if_id_new_pc                 : std_logic_vector(ADDR_WIDTH-1 downto 0);

	-- Instruction Decode/Execute
	signal id_ex_new_pc                 : std_logic_vector(ADDR_WIDTH-1 downto 0);

begin

  clock : process

    clk <= '0';
    wait for clkperiod/2;
    clk <= '1';
    wait for clkperiod/2;

  begin

  end process;

  registers : process (clk)
  begin

    if rising_edge(clk) then
      id_ex_new_pc <= if_id_new_pc;
      if_id_new_pc <= register_value;
    end if;

  end process;

end architecture;
