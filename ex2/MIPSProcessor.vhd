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
  signal new_pc                       : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal opcode                       : std_logic_vector(5 downto 0) := imem_data_in(31 downto 26);
  signal if_rs                        : std_logic_vector(REG_WIDTH-1 downto 0) := imem_data_in(25 downto 21);
  signal if_rt                        : std_logic_vector(REG_WIDTH-1 downto 0) := imem_data_in(20 downto 16);
  signal if_rd                        : std_logic_vector(REG_WIDTH-1 downto 0) := imem_data_in(15 downto 11);
  signal if_address                   : std_logic_vector(15 downto 0);

  -- Instruction Decode
  signal branch_addr                  : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal jump_addr                    : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal result                       : unsigned(DATA_WIDTH-1 downto 0);
  signal zero                         : std_ulogic;
  signal sign_extend_bits             : std_logic_vector(15 downto 0);
  signal sign_extend                  : std_logic_vector(DATA_WIDTH-1 downto 0);

  -- Execute
  signal ex_rd                        : std_logic_vector(REG_WIDTH-1 downto 0);

  -- Write Back
  signal wb_write_data                : std_logic_vector(DATA_WIDTH-1 downto 0);

  -- Jump/Branch mux out
  signal branch_sel                   : std_logic;
  signal branch_or_pc_pluss_one       : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal shift_left                   : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal shift_left_or_sign_extend    : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal next_pc                      : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal pc_addr                      : std_logic_vector(DATA_WIDTH-1 downto 0); -- No longer needed

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
    opcode                  => opcode,
    mem_write               => dmem_write_enable,
    mem_to_reg              => mem_to_reg,
    reg_dest                => reg_dest,
    reg_write               => reg_write,
    alu_op                  => alu_op,
    alu_src                 => alu_src,
    branch                  => branch,
    jump                    => jump,
    shift                   => shift,
    pc_src                  => pc_src);

  -- Initialize the ALU
  alu_module : entity work.ALU(behavioral) port map (
    data_1                  => alu_data_1,
    data_2                  => alu_data_2,
    alu_ctrl                => alu_ctrl,
    result                  => alu_result);

  -- Initialize the register file
  register_file : entity work.registerfile(Behavioral) port map (
    clk                     => clk,
    reset                   => reset,
    reg_write               => reg_write,
    read_reg_1              => read_reg_1,
    read_reg_2              => read_reg_2,
    write_reg               => write_reg,
    write_data              => write_data,
    read_data_1             => read_data_1,
    read_data_2             => read_data_2);

  -- Initialize the program counter
  pc : entity work.program_counter(Behavioral) port map (
    clk                     => clk,
    reset                   => reset,
    enable                  => pc_enable,
    addr_in                 => pc_addr_in,
    addr_out                => pc_addr_out);

  -- Initialize the alu control
  alu_control_module : entity work.alu_control(arch) port map (
    alu_op                  => alu_op,
    funct                   => funct,
    alu_ctrl                => alu_ctrl);

  -- Initialize the hazard detection unit
  hazard_detection : entity work.hazard_detection_unit(rtl) port map (
    id_ex_mem_write         => id_ex_mem_write,
    if_id_rs                => if_id_rs,
    id_ex_rt                => id_ex_rt,
    pc_write                => pc_write,
    if_id_write             => if_id_write,
    stall                   => stall);

  -- Initialize the forwarding unit
  forwarding : entity work.forwarding_unit(rtl) port map (
    id_ex_rs                => id_ex_rs,
    id_ex_rt                => id_ex_rt,
    ex_mem_rd               => ex_mem_rd,
    mem_wb_rd               => mem_wb_rd,
    ex_mem_reg_write        => ex_mem_reg_write,
    mem_wb_reg_write        => mem_wb_reg_write,
    forward_a               => forward_a,
    forward_b               => forward_b);

  ---------------------------------
  -- Stage Registers
  ---------------------------------

  IF_ID : entity work.if_id_reg(rtl) port map (
    clk          => clk,
    reset        => reset,
    new_pc_in    => new_pc_in,
    instruction  => instruction,
    new_pc_out   => new_pc_out,
    opcode_out   => opcode_out,
    rs_out       => rs_out,
    rt_out       => rt_out,
    rd_out       => rd_out,
    address_out  => address_out);

  ID_EX : entity work.id_ex_reg(rtl) port map (
    clk              => clk,
    reset            => reset,
    reg_write_in     => reg_write_in,
    reg_write_out    => reg_write_out,
    mem_to_reg_in    => mem_to_reg_in,
    mem_to_reg_out   => mem_to_reg_out,
    mem_write_in     => mem_write_in,
    mem_write_out    => mem_write_out,
    reg_dest_in      => reg_dest_in,
    reg_dest_out     => reg_dest_out,
    alu_src_in       => alu_src_in,
    alu_src_out      => alu_src_out,
    alu_op_in        => alu_op_in,
    alu_op_out       => alu_op_out,
    data_1_in        => data_1_in,
    data_1_out       => data_1_out,
    data_2_in        => data_2_in,
    data_2_out       => data_2_out,
    sign_extend_in   => sign_extend_in,
    sign_extend_out  => sign_extend_out,
    rs_in            => rs_in,
    rs_out           => rs_out,
    rt_in            => rt_in,
    rt_out           => rt_out,
    rd_in            => rd_in,
    rd_out           => rd_out,
    address_in       => address_in,
    address_out      => address_out);

  EX_MEM : entity work.ex_mem_reg(rtl) port map (
    clk             => clk,
    reset           => reset,
    reg_write_in    => reg_write_in,
    reg_write_out   => reg_write_out,
    mem_to_reg_in   => mem_to_reg_in,
    mem_to_reg_out  => mem_to_reg_out,
    mem_write_in    => mem_write_in,
    mem_write_out   => mem_write_out,
    alu_result_in   => alu_result_in,
    alu_result_out  => alu_result_out,
    rd_in           => rd_in,
    rd_out          => rd_out,
    address_in      => address_in,
    address_out     => address_out);

  MEM_WB : entity work.mem_wb_reg(rtl) port map (
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

  ---------------------------------
  -- Instruction Fetch
  ---------------------------------

  -- Increment PC
  new_pc <= std_logic_vector(unsigned(pc_addr_out) + 1);

  -- PC MUX
  with pc_src select
    pc_addr_in <= OVERFLOW_EXECPTION(ADDR_WIDTH-1 downto 0) when "11", -- NOTE THAT WE ONLY USE THE 8 LSB
                  jump_addr when "10",
                  branch_addr when "01",
                  new_pc when others;

  -- Pass PC to IM
  imem_address <= pc_addr_out;

  ---------------------------------
  -- Instruction Decode
  ---------------------------------

  -- Branch adder
  branch_addr <= std_logic_vector(unsigned(if_id_new_pc(ADDR_WIDTH-1 downto 0)) + unsigned(sign_extend(ADDR_WIDTH-1 downto 0)));

  -- Jump address
  jump_addr <= if_id_address(ADDR_WIDTH-1 downto 0);

  -- Addresses to register
  read_reg_1          <= if_id_rs;
  read_reg_2          <= if_id_rt; -- I think the mux enabled by the reg_dest signal is removed when pipelining
  write_reg           <= mem_wb_rd;
  write_data          <= wb_write_data;-- data from the mux in the write back stage

  -- Branch equal zero
  result <= unsigned(read_data_1) - unsigned(read_data_2);
  with result select
    zero <= '1' when x"00000000",
            '0' when others;

  -- Sign extend
  sign_extend_bits <= (others => '0') when if_id_address(15) = '0' else (others => '1');
  sign_extend <= sign_extend_bits & if_id_address;

  ---------------------------------
  -- Execute
  ---------------------------------

  -- Get the funct bits from the instruction
  funct <= id_ex_address(5 downto 0);

  -- Destination register  MUX
  ex_rd <= id_ex_rd when reg_dest = '1' else id_ex_rt;

  -- ALU data_1 MUX NOTE! BUT WHERE DO WE USE THE SIGNEXTEND
  with forward_a select
    alu_data_1 <=  wb_write_data when "00",
                   mem_wb_alu_result when "01",
                   read_data_1 when others;

  -- ALU data_2 MUX
  with forward_b select
    alu_data_2 <=  wb_write_data when "00",
                   mem_wb_alu_result when "01",
                   read_data_2 when others;

  ---------------------------------
  -- Memory
  ---------------------------------

  dmem_data_out <= ex_mem_alu_result;

  ---------------------------------
  -- Write Back
  ---------------------------------

  -- Mem to reg MUX
  wb_write_data <= dmem_data_in when mem_to_reg = '1' else mem_wb_alu_result;

end Behavioral;
