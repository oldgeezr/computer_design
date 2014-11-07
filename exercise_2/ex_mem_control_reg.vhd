library ieee;
use ieee.std_logic_1164.all;

entity ex_mem_control_reg is
  port (
    clk             : in std_logic;
    reset           : in std_logic;
    mem_write_in    : in std_logic;
	 mem_read_in     : in std_logic;
    mem_write_out   : out std_logic;
	 mem_read_out    : out std_logic
  );
end entity;

architecture rtl of ex_mem_control_reg is

  signal mem_write  : std_logic := '0';
  signal mem_read   : std_logic := '0';

begin

  mem_write_out <= mem_write;
  mem_read_out  <= mem_read;

  process (clk, reset, mem_write_in, mem_read_in) begin
    if reset = '1' then
      -- Do the reset thingy
		mem_write <= '0';
		mem_read  <= '0';
    else
      if rising_edge(clk) then
        mem_write <= mem_write_in;
		  mem_read  <= mem_read_in;
      end if;
    end if;
  end process;

end architecture;
