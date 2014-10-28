library ieee;
use ieee.STD_LOGIC_1164.all;

entity stage_registers is
  generic (
    ADDR_WIDTH          : integer := 8;
    DATA_WIDTH          : integer := 32;
    REG_WIDTH           : integer := 5
  );
  port (
    clk                 : in std_logic;
    reset               : in std_logic;
    new_pc              : in std_logic_vector(ADDR_WIDTH-1 downto 0);
    opcode              : in std_logic_vector(5 downto 0);
    if_rs               : in std_logic_vector(REG_WIDTH-1 downto 0);
    if_rt               : in std_logic_vector(REG_WIDTH-1 downto 0);
    if_rd               : in std_logic_vector(REG_WIDTH-1 downto 0);
    if_address          : in std_logic_vector(15 downto 0);
    read_data_1         : in std_logic_vector(DATA_WIDTH-1 downto 0);
    read_data_2         : in std_logic_vector(DATA_WIDTH-1 downto 0);
    sign_extend         : in std_logic_vector(15 downto 0);
    alu_result          : in std_logic_vector(DATA_WIDTH-1 downto 0);
    ex_rd               : in std_logic_vector(REG_WIDTH-1 downto 0);
    dmem_data_in        : in std_logic_vector(DATA_WIDTH-1 downto 0)
  );
end entity;

architecture rtl of stage_registers is

  ---------------------------------
  -- Register Declarations
  ---------------------------------

  -- Instruction Fetch/Decode
  signal if_id_new_pc                 : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal if_id_opcode                 : std_logic_vector(5 downto 0);
  signal if_id_rs                     : std_logic_vector(REG_WIDTH-1 downto 0);
  signal if_id_rt                     : std_logic_vector(REG_WIDTH-1 downto 0);
  signal if_id_rd                     : std_logic_vector(REG_WIDTH-1 downto 0);
  signal if_id_address                : std_logic_vector(15 downto 0);

  -- Instruction Decode/Execute
  signal id_ex_read_data_1            : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal id_ex_read_data_2            : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal id_ex_sign_extend            : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal id_ex_rs                     : std_logic_vector(REG_WIDTH-1 downto 0);
  signal id_ex_rt                     : std_logic_vector(REG_WIDTH-1 downto 0);
  signal id_ex_rd                     : std_logic_vector(REG_WIDTH-1 downto 0);
  signal id_ex_address                : std_logic_vector(15 downto 0);

  -- Execute/Memory
  signal ex_mem_alu_result            : std_logic_vector(DATA_WIDTH-1 downto 0);
  -- signal ex_mem_branch_addr           : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal ex_mem_rd                    : std_logic_vector(REG_WIDTH-1 downto 0);
  signal ex_mem_address               : std_logic_vector(15 downto 0);

  -- Memory/Writeback
  signal mem_wb_read_dmem             : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal mem_wb_alu_result            : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal mem_wb_rd                    : std_logic_vector(REG_WIDTH-1 downto 0);
  signal mem_wb_address               : std_logic_vector(15 downto 0);

begin

  stage_registers : process (
    clk, reset,
    new_pc,
    opcode,
    if_rs,
    if_rt,
    if_rd,
    if_address,
    read_data_1,
    read_data_2,
    sign_extend,
    if_id_rs,
    if_id_rt,
    if_id_rd,
    if_id_address,
    alu_result,
    ex_rd,
    id_ex_address,
    dmem_data_in,
    ex_mem_alu_result,
    ex_mem_rd,
    ex_mem_address)
  begin
    if reset = '1' then
      -- Do the reset thingy
    else
      if (rising_edge(clk)) then
        -- Instruction Fetch/Decode
        if_id_new_pc      <= new_pc;
        if_id_opcode      <= opcode;
        if_id_rs          <= if_rs;
        if_id_rt          <= if_rt;
        if_id_rd          <= if_rd;
        if_id_address     <= if_address;

        -- Instruction Decode/Execute
        id_ex_read_data_1 <= read_data_1;
        id_ex_read_data_2 <= read_data_2;
        id_ex_sign_extend <= sign_extend;
        id_ex_rs          <= if_id_rs;
        id_ex_rt          <= if_id_rt;
        id_ex_rd          <= if_id_rd;
        id_ex_address     <= if_id_address;

        -- Execute/Memory
        ex_mem_alu_result <= alu_result;
        ex_mem_rd         <= ex_rd; -- from the mux here
        ex_mem_address    <= id_ex_address;

        -- Memory/Write Back
        mem_wb_read_dmem  <= dmem_data_in;
        mem_wb_alu_result <= ex_mem_alu_result;
        mem_wb_rd         <= ex_mem_rd;
        mem_wb_address    <= ex_mem_address;
      end if;
    end if;
  end process;
end architecture;
