library ieee;
use ieee.std_logic_1164.all;

entity mem_wb_reg_tb is
  generic (
    DATA_WIDTH          : integer := 32;
    REG_WIDTH           : integer := 5
  );
end entity;

architecture tb of mem_wb_reg_tb is

  signal clk                          : std_logic := '0';
  signal reset                        : std_logic := '1';
  constant clkperiod                  : time := 10 ns;

  signal reg_write_in                 : std_logic := '0';
  signal reg_write_out                : std_logic;
  signal mem_to_reg_in                : std_logic := '0';
  signal mem_to_reg_out               : std_logic;
  signal dmem_in                      : std_logic_vector(DATA_WIDTH-1 downto 0) := x"00000000";
  signal dmem_out                     : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal alu_result_in                : std_logic_vector(DATA_WIDTH-1 downto 0) := x"00000000";
  signal alu_result_out               : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal rd_in                        : std_logic_vector(REG_WIDTH-1 downto 0) := "00000";
  signal rd_out                       : std_logic_vector(REG_WIDTH-1 downto 0);
  signal address_in                   : std_logic_vector(15 downto 0) := x"0000";
  signal address_out                  : std_logic_vector(15 downto 0);

begin

  clk <= not clk after clkperiod/2;

  reset         <= '0';
  reg_write_in  <= '1' after clkperiod*2;
  mem_to_reg_in <= '1' after clkperiod*2;
  dmem_in       <= x"11110000" after clkperiod*2;
  alu_result_in <= x"00001111" after clkperiod*2;
  rd_in         <= "10101" after clkperiod*2;
  address_in    <= x"CC00" after clkperiod*2;

  DUT : entity work.mem_wb_reg(rtl) port map (
    clk             => clk,
    reset           => reset,
    reg_write_in    => reg_write_in,
    reg_write_out   => reg_write_out,
    mem_to_reg_in   => mem_to_reg_in,
    mem_to_reg_out  => mem_to_reg_out,
    dmem_in         => dmem_in,
    dmem_out        => dmem_out,
    alu_result_in   => alu_result_in,
    alu_result_out  => alu_result_out,
    rd_in           => rd_in,
    rd_out          => rd_out,
    address_in      => address_in,
    address_out     => address_out);

end architecture;
