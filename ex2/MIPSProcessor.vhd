        -- Part of TDT4255 Computer Design laboratory exercises
-- Group for Computer Architecture and Design
-- Department of Computer and Information Science
-- Norwegian University of Science and Technology

-- MIPSProcessor.vhd
-- The MIPS processor component to be used in Exercise 1 and 2.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MIPSProcessor is
  generic (
    ADDR_WIDTH                       : integer := 8;
    DATA_WIDTH                       : integer := 32;
    REG_WIDTH                        : integer := 5;
    OVERFLOW_EXECPTION               : std_logic_vector(31 downto 0) := x"80000180";
    FLUSH_EXCEPTION                  : std_logic_vector(31 downto 0) := x"40000040"
  );
  port (
    clk, reset                       : in std_logic;
    processor_enable                 : in std_logic;
    imem_data_in                     : in std_logic_vector(DATA_WIDTH-1 downto 0);
    dmem_data_in                     : in std_logic_vector(DATA_WIDTH-1 downto 0);
    imem_address                     : out std_logic_vector(ADDR_WIDTH-1 downto 0);
    dmem_address                     : out std_logic_vector(ADDR_WIDTH-1 downto 0);
    dmem_data_out                    : out std_logic_vector(DATA_WIDTH-1 downto 0);
    dmem_write_enable                : out std_logic
  );
end MIPSProcessor;

architecture Behavioral of MIPSProcessor is

  ---------------------------------
  -- Signal Declarations
  ---------------------------------

  -- Instruction Fetch
  signal if_instruction               : std_logic_vector(DATA_WIDTH-1 downto 0) := imem_data_in;
  signal if_new_pc                    : std_logic_vector(ADDR_WIDTH-1 downto 0);

  -- Instruction Decode
  signal id_new_pc                    : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal id_opcode                    : std_logic_vector(5 downto 0);
  signal id_rs                        : std_logic_vector(REG_WIDTH-1 downto 0);
  signal id_rt                        : std_logic_vector(REG_WIDTH-1 downto 0);
  signal id_rd                        : std_logic_vector(REG_WIDTH-1 downto 0);
  signal id_address                   : std_logic_vector(15 downto 0);

  signal id_branch_addr               : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal id_jump_addr                 : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal id_result                    : unsigned(DATA_WIDTH-1 downto 0);
  signal id_zero                      : std_ulogic;
  signal id_sign_extend_bits          : std_logic_vector(15 downto 0);
  signal id_sign_extend               : std_logic_vector(DATA_WIDTH-1 downto 0);

  -- Control signal in ID stage
  signal id_reg_write                 : std_logic;
  signal id_mem_to_reg                : std_logic;
  signal id_mem_write                 : std_logic;
  signal id_reg_dest                  : std_logic;
  signal id_alu_src                   : std_logic;
  signal id_alu_op                    : std_logic_vector(1 downto 0);

  -- Control signals in EX stage
  signal ex_reg_write                 : std_logic;
  signal ex_mem_to_reg                : std_logic;
  signal ex_mem_write                 : std_logic;
  signal ex_reg_dest                  : std_logic;
  signal ex_alu_src                   : std_logic;
  signal ex_alu_op                    : std_logic_vector(1 downto 0);
  signal ex_alu_result                : std_logic_vector(DATA_WIDTH-1 downto 0);

  -- Control signals in MEM stage
  signal mem_reg_write                : std_logic;
  signal mem_mem_to_reg               : std_logic;
  signal mem_mem_write                : std_logic;

  -- Control signals in WB stage
  signal wb_reg_write                 : std_logic;
  signal wb_mem_to_reg                : std_logic;

  -- Execute
  signal ex_rs                        : std_logic_vector(REG_WIDTH-1 downto 0);
  signal ex_rt                        : std_logic_vector(REG_WIDTH-1 downto 0);
  signal ex_rd                        : std_logic_vector(REG_WIDTH-1 downto 0);
  signal ex_to_mem_rd                 : std_logic_vector(REG_WIDTH-1 downto 0);
  signal ex_address                   : std_logic_vector(15 downto 0);
  signal ex_sign_extend_bits          : std_logic_vector(15 downto 0);
  signal ex_sign_extend               : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal ex_data_1                    : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal ex_data_2                    : std_logic_vector(DATA_WIDTH-1 downto 0);

  -- Memory
  signal mem_alu_result               : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal mem_rd                       : std_logic_vector(REG_WIDTH-1 downto 0);
  signal mem_address                  : std_logic_vector(15 downto 0);

  -- Write Back
  signal wb_dmem_data                 : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal wb_alu_result                : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal wb_rd                        : std_logic_vector(REG_WIDTH-1 downto 0);
  signal wb_address                   : std_logic_vector(15 downto 0);
  signal wb_write_data                : std_logic_vector(DATA_WIDTH-1 downto 0);

  -- Control Unit Signals
  signal mem_read                     : std_logic; -- Excess. !mem_write TODO: remove
  signal mem_write                    : std_logic;
  signal mem_to_reg                   : std_logic;
  signal reg_dest                     : std_logic;
  signal alu_op                       : std_logic_vector(1 downto 0);
  signal alu_src                      : std_logic;
  signal branch                       : std_logic;
  signal jump                         : std_logic;
  signal shift                        : std_logic;
  signal pc_src                       : std_logic_vector(1 downto 0);

  -- ALU Signals
  signal alu_data_1                   : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal alu_data_2                   : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal alu_result                   : std_logic_vector(DATA_WIDTH-1 downto 0);

  -- Register Signals
  signal reg_write                    : std_logic;
  signal read_reg_1                   : std_logic_vector(REG_WIDTH-1 downto 0);
  signal read_reg_2                   : std_logic_vector(REG_WIDTH-1 downto 0);
  signal write_reg                    : std_logic_vector(REG_WIDTH-1 downto 0);
  signal write_data                   : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal read_data_1                  : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal read_data_2                  : std_logic_vector(DATA_WIDTH-1 downto 0);

  -- Program Counter Signals
  signal pc_addr_in                   : std_logic_vector(ADDR_WIDTH-1 downto 0); -- Changed for new PC
  signal pc_addr_out                  : std_logic_vector(ADDR_WIDTH-1 downto 0); -- Changed for new PC
  signal pc_enable                       : std_logic;

  -- ALU Control Signals
  signal funct                        : std_logic_vector(5 downto 0);
  signal alu_ctrl                     : std_logic_vector(3 downto 0);

  -- Forwarding Unit Signals NOTE! Should probably remove some of these signals
  -- signal id_ex_rs                     : std_logic_vector(DATA_WIDTH-1 downto 0);
  -- signal id_ex_rt                     : std_logic_vector(DATA_WIDTH-1 downto 0);
  -- signal ex_mem_rd                    : std_logic_vector(DATA_WIDTH-1 downto 0);
  -- signal mem_wb_rd                    : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal ex_mem_reg_write             : std_logic;
  signal mem_wb_reg_write             : std_logic;
  signal forward_a                    : std_logic_vector(1 downto 0);
  signal forward_b                    : std_logic_vector(1 downto 0);

  -- Hazard Detection Unit Signals NOTE! Should probably remove some of these signals
  signal id_ex_mem_write              : std_logic;
  signal id_if_id_write               : std_logic;
  -- signal id_ex_rt                     : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal pc_write                     : std_logic;
  signal if_id_write                  : std_logic;
  signal stall                        : std_logic;

begin

  ---------------------------------
  -- Component Initialization
  ---------------------------------

  -- Initialize the Control Unit
  control_unit:   entity work.control(fsm) port map (
    clk                     => clk,
    processor_enable        => processor_enable,
    opcode                  => id_opcode,
    mem_write               => id_mem_write,
    mem_to_reg              => id_mem_to_reg,
    reg_dest                => id_reg_dest,
    reg_write               => id_reg_write,
    alu_op                  => id_alu_op,
    alu_src                 => id_alu_src,
    branch                  => branch,
    jump                    => jump,
    pc_src                  => pc_src);

  -- Initialize the ALU
  alu_module : entity work.ALU(behavioral) port map (
    data_1                  => alu_data_1, -- OK
    data_2                  => alu_data_2, -- OK
    alu_ctrl                => alu_ctrl, -- OK
    result                  => ex_alu_result); -- OK

  -- Initialize the register file
  register_file : entity work.registerfile(Behavioral) port map (
    clk                     => clk,
    reset                   => reset,
    reg_write               => wb_reg_write, -- OK
    read_reg_1              => read_reg_1, -- OK
    read_reg_2              => read_reg_2, -- OK
    write_reg               => write_reg, -- OK
    write_data              => write_data, -- OK
    read_data_1             => read_data_1, -- OK
    read_data_2             => read_data_2); -- OK

  -- Initialize the program counter
  pc : entity work.program_counter(Behavioral) port map (
    clk                     => clk,
    reset                   => reset,
    enable                  => pc_enable, -- NOT CONNECTED TO CONTROL
    addr_in                 => pc_addr_in, -- OK
    addr_out                => pc_addr_out); -- OK

  -- Initialize the alu control
  alu_control_module : entity work.alu_control(arch) port map (
    alu_op                  => id_alu_op, -- OK
    funct                   => funct, -- OK
    alu_ctrl                => alu_ctrl); -- OK

  -- Initialize the hazard detection unit
  hazard_detection : entity work.hazard_detection_unit(rtl) port map (
    id_ex_mem_write         => ex_mem_write, -- OK
    if_id_rs                => id_rs, -- OK
    if_id_rt                => id_rt, -- OK
    id_ex_rt                => ex_rt, -- OK
    pc_write                => pc_write, --THIS SHOULD PROBABLY BE CONNECTED TO PC_ENABLE?
    if_id_write             => id_if_id_write, -- OK
    stall                   => stall); -- DUNNO

    -- TODO: impement if_id_write signal in IF ID Register

  -- Initialize the forwarding unit
  forwarding : entity work.forwarding_unit(rtl) port map (
    id_ex_rs                => ex_rs,
    id_ex_rt                => ex_rt,
    ex_mem_rd               => mem_rd,
    mem_wb_rd               => wb_rd,
    ex_mem_reg_write        => ex_reg_write,
    mem_wb_reg_write        => mem_reg_write,
    forward_a               => forward_a,
    forward_b               => forward_b);

  ---------------------------------
  -- Stage Registers
  ---------------------------------

  IF_ID : entity work.if_id_reg(rtl) port map (
    clk          => clk,
    reset        => reset,
    if_id_write  => id_if_id_write,
    new_pc_in    => if_new_pc,
    instruction  => if_instruction,
    new_pc_out   => id_new_pc,
    opcode_out   => id_opcode,
    rs_out       => id_rs,
    rt_out       => id_rt,
    rd_out       => id_rd,
    address_out  => id_address);

  ID_EX : entity work.id_ex_reg(rtl) port map (
    clk              => clk,
    reset            => reset,
    -- Control signals
    reg_write_in     => id_reg_write,
    mem_to_reg_in    => id_mem_to_reg,
    mem_write_in     => id_mem_write,
    reg_dest_in      => id_reg_dest,
    alu_src_in       => id_alu_src,
    alu_op_in        => id_alu_op,
    reg_write_out    => ex_reg_write,
    mem_to_reg_out   => ex_mem_to_reg,
    mem_write_out    => ex_mem_write,
    reg_dest_out     => ex_reg_dest,
    alu_src_out      => ex_alu_src,
    alu_op_out       => ex_alu_op,
    -- Data
    data_1_in        => read_data_1,
    data_2_in        => read_data_2,
    sign_extend_in   => id_sign_extend,
    rs_in            => id_rs,
    rt_in            => id_rt,
    rd_in            => id_rd,
    address_in       => id_address,
    data_1_out       => ex_data_1,
    data_2_out       => ex_data_2,
    sign_extend_out  => ex_sign_extend,
    rt_out           => ex_rt,
    rs_out           => ex_rs,
    rd_out           => ex_rd,
    address_out      => ex_address);

  EX_MEM : entity work.ex_mem_reg(rtl) port map (
    clk             => clk,
    reset           => reset,
    reg_write_in    => ex_reg_write,
    mem_to_reg_in   => ex_mem_to_reg,
    mem_write_in    => ex_mem_write,
    alu_result_in   => ex_alu_result,
    rd_in           => ex_to_mem_rd,
    address_in      => ex_address,
    reg_write_out   => mem_reg_write,
    mem_to_reg_out  => mem_mem_to_reg,
    mem_write_out   => mem_mem_write,
    alu_result_out  => mem_alu_result,
    rd_out          => mem_rd,
    address_out     => mem_address);

  MEM_WB : entity work.mem_wb_reg(rtl) port map (
    clk             => clk,
    reset           => reset,
    reg_write_in    => mem_reg_write,
    mem_to_reg_in   => mem_mem_to_reg,
    dmem_in         => dmem_data_in,
    alu_result_in   => mem_alu_result,
    rd_in           => mem_rd,
    address_in      => mem_address,
    mem_to_reg_out  => wb_mem_to_reg,
    reg_write_out   => wb_reg_write,
    dmem_out        => wb_dmem_data,
    alu_result_out  => wb_alu_result,
    rd_out          => wb_rd,
    address_out     => wb_address);

  ---------------------------------
  -- Instruction Fetch
  ---------------------------------

  -- Increment PC
  if_new_pc <= std_logic_vector(unsigned(pc_addr_out) + 1);

  -- PC MUX
  with pc_src select
    pc_addr_in <= OVERFLOW_EXECPTION(ADDR_WIDTH-1 downto 0) when "11", -- NOTE THAT WE ONLY USE THE 8 LSB
                  id_jump_addr when "10",
                  id_branch_addr when "01",
                  if_new_pc when others;

  -- Pass PC to IM
  imem_address <= pc_addr_out;

  ---------------------------------
  -- Instruction Decode
  ---------------------------------

  -- Branch adder
  id_branch_addr <= std_logic_vector(unsigned(id_new_pc(ADDR_WIDTH-1 downto 0)) + unsigned(id_sign_extend(ADDR_WIDTH-1 downto 0)));

  -- Jump address
  id_jump_addr <= id_address(ADDR_WIDTH-1 downto 0);

  -- Addresses to register
  read_reg_1          <= id_rs;
  read_reg_2          <= id_rt; -- I think the mux enabled by the reg_dest signal is removed when pipelining
  write_reg           <= wb_rd;
  write_data          <= wb_write_data;-- data from the mux in the write back stage

  -- Branch equal zero
  id_result <= unsigned(read_data_1) - unsigned(read_data_2);
  with id_result select
    id_zero <= '1' when x"00000000",
            '0' when others;

  -- Sign extend
  id_sign_extend_bits <= (others => '0') when id_address(15) = '0' else (others => '1');
  id_sign_extend <= id_sign_extend_bits & id_address;

  ---------------------------------
  -- Execute
  ---------------------------------

  -- Get the funct bits from the instruction
  funct <= ex_address(5 downto 0);

  -- Destination register MUX
  ex_to_mem_rd <= ex_rd when ex_reg_dest = '1' else ex_rt;

  -- ALU data_1 MUX NOTE! BUT WHERE DO WE USE THE SIGNEXTEND
  with forward_a select
    alu_data_1 <=  wb_write_data when "00",
                   mem_alu_result when "01",
                   ex_data_1 when others;

  -- ALU data_2 MUX
  with forward_b select
    alu_data_2 <=  wb_write_data when "00",
                   mem_alu_result when "01",
                   ex_data_2 when others;

  ---------------------------------
  -- Memory
  ---------------------------------

  dmem_data_out <= mem_alu_result;

  ---------------------------------
  -- Write Back
  ---------------------------------

  -- Mem to reg MUX
  wb_write_data <= wb_dmem_data when wb_mem_to_reg = '1' else mem_alu_result;

end Behavioral;
