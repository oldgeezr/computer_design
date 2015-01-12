library ieee;
use ieee.std_logic_1164.all;

entity id_ex_reg is
  generic (
    DATA_WIDTH             : integer := 32;
    REG_WIDTH              : integer := 5
  );
  port (
    clk                    : in std_logic;
    reset                  : in std_logic;
    reg_write_in           : in std_logic;
    mem_to_reg_in          : in std_logic;
    mem_write_in           : in std_logic;
    mem_read_in            : in std_logic;
    reg_dest_in            : in std_logic;
    alu_src_in             : in std_logic;
    alu_op_in              : in std_logic_vector(1 downto 0);
    data_1_in              : in std_logic_vector(DATA_WIDTH-1 downto 0);
    data_2_in              : in std_logic_vector(DATA_WIDTH-1 downto 0);
    sign_extend_in         : in std_logic_vector(DATA_WIDTH-1 downto 0);
    rs_in                  : in std_logic_vector(REG_WIDTH-1 downto 0);
    rt_in                  : in std_logic_vector(REG_WIDTH-1 downto 0);
    rd_in                  : in std_logic_vector(REG_WIDTH-1 downto 0);
    reg_write_out          : out std_logic;
    mem_to_reg_out         : out std_logic;
    mem_write_out          : out std_logic;
    mem_read_out           : out std_logic;
    reg_dest_out           : out std_logic;
    alu_src_out            : out std_logic;
    alu_op_out             : out std_logic_vector(1 downto 0);
    data_1_out             : out std_logic_vector(DATA_WIDTH-1 downto 0);
    data_2_out             : out std_logic_vector(DATA_WIDTH-1 downto 0);
    sign_extend_out        : out std_logic_vector(DATA_WIDTH-1 downto 0);
    rs_out                 : out std_logic_vector(REG_WIDTH-1 downto 0);
    rt_out                 : out std_logic_vector(REG_WIDTH-1 downto 0);
    rd_out                 : out std_logic_vector(REG_WIDTH-1 downto 0)
  );
end entity;

architecture rtl of id_ex_reg is

  signal data_1       : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
  signal data_2       : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
  signal sign_extend  : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
  signal rs           : std_logic_vector(REG_WIDTH-1 downto 0) := (others => '0');
  signal rt           : std_logic_vector(REG_WIDTH-1 downto 0) := (others => '0');
  signal rd           : std_logic_vector(REG_WIDTH-1 downto 0) := (others => '0');

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

  EX_control : entity work.id_ex_control_reg(rtl) port map (
    clk             => clk,
    reset           => reset,
    reg_dest_in     => reg_dest_in,
    reg_dest_out    => reg_dest_out,
    alu_src_in      => alu_src_in,
    alu_src_out     => alu_src_out,
    alu_op_in       => alu_op_in,
    alu_op_out      => alu_op_out);

  data_1_out      <= data_1;
  data_2_out      <= data_2;
  sign_extend_out <= sign_extend;
  rs_out          <= rs;
  rt_out          <= rt;
  rd_out          <= rd;

  process (clk, reset, data_1_in, data_2_in, sign_extend_in, rs_in, rt_in, rd_in) begin
    if reset = '1' then
      data_1        <= (others => '0');
      data_2        <= (others => '0');
      sign_extend   <= (others => '0');
      rs            <= (others => '0');
      rt            <= (others => '0');
      rd            <= (others => '0');
    else
      if rising_edge(clk) then
        data_1      <= data_1_in;
        data_2      <= data_2_in;
        sign_extend <= sign_extend_in;
        rs          <= rs_in;
        rt          <= rt_in;
        rd          <= rd_in;
      end if;
    end if;
  end process;

end architecture;
