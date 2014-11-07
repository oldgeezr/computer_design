library ieee;
use ieee.std_logic_1164.all;

entity ex_mem_reg is
  generic (
    DATA_WIDTH          : integer := 32;
    REG_WIDTH           : integer := 5
  );
  port (
    clk              : in std_logic;
    reset            : in std_logic;
    reg_write_in     : in std_logic;
    mem_to_reg_in    : in std_logic;
    mem_write_in     : in std_logic;
	 mem_read_in      : in std_logic;
    alu_result_in    : in std_logic_vector(DATA_WIDTH-1 downto 0);
    data_in          : in std_logic_vector(DATA_WIDTH-1 downto 0);
    rd_in            : in std_logic_vector(REG_WIDTH-1 downto 0);
    reg_write_out    : out std_logic;
    mem_to_reg_out   : out std_logic;
    mem_write_out    : out std_logic;
	 mem_read_out     : out std_logic;
    alu_result_out   : out std_logic_vector(DATA_WIDTH-1 downto 0);
    data_out         : out std_logic_vector(DATA_WIDTH-1 downto 0);
    rd_out           : out std_logic_vector(REG_WIDTH-1 downto 0)
  );
end entity;

architecture rtl of ex_mem_reg is

  signal alu_result  : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
  signal data        : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
  signal rd          : std_logic_vector(REG_WIDTH-1 downto 0) := (others => '0');

begin

  WB_control : entity work.mem_wb_control_reg(rtl) port map (
    clk             => clk,
    reset           => reset,
    reg_write_in    => reg_write_in,
    reg_write_out   => reg_write_out,
    mem_to_reg_in   => mem_to_reg_in,
    mem_to_reg_out  => mem_to_reg_out);

  MEM_control : entity work.ex_mem_control_reg(rtl) port map (
    clk             => clk,
    reset           => reset,
    mem_write_in    => mem_write_in,
    mem_write_out   => mem_write_out,
	 mem_read_in     => mem_read_in,
    mem_read_out    => mem_read_out);

  alu_result_out        <= alu_result;
  rd_out                <= rd;
  data_out              <= data;

  process (clk, reset, alu_result_in, data_in, rd_in) begin
    if reset = '1' then
      -- Do the reset thingy
		alu_result <= (others => '0');
      data       <= (others => '0');
      rd         <= (others => '0');
    else
      if rising_edge(clk) then
        alu_result <= alu_result_in;
        data       <= data_in;
        rd         <= rd_in;
      end if;
    end if;
  end process;

end architecture;
