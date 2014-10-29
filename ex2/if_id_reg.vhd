library ieee;
use ieee.std_logic_1164.all;

entity if_id_reg is
  generic (
    ADDR_WIDTH          : integer := 8;
    DATA_WIDTH          : integer := 32;
    REG_WIDTH           : integer := 5
  );
  port (
    clk             : in std_logic;
    reset           : in std_logic;
    new_pc_in       : in std_logic_vector(ADDR_WIDTH-1 downto 0);
    instruction     : in std_logic_vector(DATA_WIDTH-1 downto 0);
    new_pc_out      : out std_logic_vector(ADDR_WIDTH-1 downto 0);
    opcode_out      : out std_logic_vector(5 downto 0);
    rs_out          : out std_logic_vector(REG_WIDTH-1 downto 0);
    rt_out          : out std_logic_vector(REG_WIDTH-1 downto 0);
    rd_out          : out std_logic_vector(REG_WIDTH-1 downto 0);
    address_out     : out std_logic_vector(15 downto 0)
  );
end entity;

architecture rtl of if_id_reg is

  signal new_pc      : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal opcode      : std_logic_vector(5 downto 0);
  signal rs          : std_logic_vector(REG_WIDTH-1 downto 0);
  signal rt          : std_logic_vector(REG_WIDTH-1 downto 0);
  signal rd          : std_logic_vector(REG_WIDTH-1 downto 0);
  signal address     : std_logic_vector(15 downto 0);

begin

  new_pc_out  <= new_pc;
  opcode_out  <= opcode;
  rs_out      <= rs;
  rt_out      <= rt;
  rd_out      <= rd;
  address_out <= address;

  process (clk, reset, new_pc_in, instruction) begin
    if reset = '1' then
      -- Do the reset thingy
    else
      if rising_edge(clk) then
        new_pc  <= new_pc_in;
        opcode  <= instruction(31 downto 26);
        rs      <= instruction(25 downto 21);
        rt      <= instruction(20 downto 16);
        rd      <= instruction(15 downto 11);
        address <= instruction(15 downto 0);
      end if;
    end if;
  end process;

end architecture;
