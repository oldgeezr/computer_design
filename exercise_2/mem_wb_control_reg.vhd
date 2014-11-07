library ieee;
use ieee.std_logic_1164.all;

entity mem_wb_control_reg is
  port (
    clk             : in std_logic;
    reset           : in std_logic;
    reg_write_in    : in std_logic;
    mem_to_reg_in   : in std_logic;
    mem_to_reg_out  : out std_logic;
    reg_write_out   : out std_logic
  );
end entity;

architecture rtl of mem_wb_control_reg is

  signal reg_write   : std_logic := '0';
  signal mem_to_reg  : std_logic := '0';

begin

  reg_write_out   <= reg_write;
  mem_to_reg_out  <= mem_to_reg;

  process (clk, reset, reg_write_in, mem_to_reg_in) begin
    if reset = '1' then
      -- Do the reset thingy
		reg_write  <= '0';
      mem_to_reg <= '0';
    else
      if rising_edge(clk) then
        reg_write  <= reg_write_in;
        mem_to_reg <= mem_to_reg_in;
      end if;
    end if;
  end process;

end architecture;
