library ieee;
use ieee.std_logic_1164.all;

entity ex_mem_control_reg is
  port (
    clk             : in std_logic;
    reset           : in std_logic;
    mem_write_in    : in std_logic;
    mem_write_out   : out std_logic
    -- branch_in       : in std_logic;
    -- branch_out      : out std_logic
  );
end entity;

  ---------------------------------
  -- NOTE TO SELF: We dont use branching here
  ---------------------------------

architecture rtl of ex_mem_control_reg is

  signal mem_write  : std_logic;
  -- signal branch     : std_logic;

begin

  mem_write_out <= mem_write;
  -- branch_out    <= branch;

  process (clk, reset, mem_write_in) begin
    if reset = '1' then
      -- Do the reset thingy
    else
      if rising_edge(clk) then
        mem_write <= mem_write_in;
        -- branch    <= branch_in;
      end if;
    end if;
  end process;

end architecture;
