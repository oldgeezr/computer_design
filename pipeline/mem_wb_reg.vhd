library ieee;
use ieee.std_logic_1164.all;

entity mem_wb_reg is
  generic (
    DATA_WIDTH          : integer := 32;
    REG_WIDTH           : integer := 5
  );
  port (
    clk                 : in std_logic;
    reset               : in std_logic;
    reg_write_in        : in std_logic;
    mem_to_reg_in       : in std_logic;
    dmem_in             : in std_logic_vector(DATA_WIDTH-1 downto 0);
    alu_result_in       : in std_logic_vector(DATA_WIDTH-1 downto 0);
    rd_in               : in std_logic_vector(REG_WIDTH-1 downto 0);
    reg_write_out       : out std_logic;
    mem_to_reg_out      : out std_logic;
    dmem_out            : out std_logic_vector(DATA_WIDTH-1 downto 0);
    alu_result_out      : out std_logic_vector(DATA_WIDTH-1 downto 0);
    rd_out              : out std_logic_vector(REG_WIDTH-1 downto 0)
  );
end entity;

architecture rtl of mem_wb_reg is

  signal alu_result     : std_logic_vector(DATA_WIDTH-1 downto 0) := (others => '0');
  signal rd             : std_logic_vector(REG_WIDTH-1 downto 0) := (others => '0');

begin

  WB_control : entity work.mem_wb_control_reg(rtl) port map (
    clk             => clk,
    reset           => reset,
    reg_write_in    => reg_write_in,
    reg_write_out   => reg_write_out,
    mem_to_reg_in   => mem_to_reg_in,
    mem_to_reg_out  => mem_to_reg_out);

  alu_result_out        <= alu_result;
  rd_out                <= rd;

  process (clk, reset, dmem_in, alu_result_in, rd_in) begin
    if reset = '1' then
      alu_result    <= (others => '0');
      rd            <= (others => '0');
    else
      if rising_edge(clk) then
        alu_result  <= alu_result_in;
        rd          <= rd_in;
      end if;
    end if;
  end process;

end architecture;
