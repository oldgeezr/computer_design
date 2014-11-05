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
    ADDR_WIDTH                                   : integer := 8;
    DATA_WIDTH                                   : integer := 32;
    REG_WIDTH                                    : integer := 5;
    OVERFLOW_EXECPTION                           : std_logic_vector(31 downto 0) := x"80000180";
    FLUSH_EXCEPTION                              : std_logic_vector(31 downto 0) := x"40000040"
  );
  port (
    clk, reset                                   : in std_logic;
    processor_enable                             : in std_logic;
    imem_data_in                                 : in std_logic_vector(DATA_WIDTH-1 downto 0);
    dmem_data_in                                 : in std_logic_vector(DATA_WIDTH-1 downto 0);
    imem_address                                 : out std_logic_vector(ADDR_WIDTH-1 downto 0);
    dmem_address                                 : out std_logic_vector(ADDR_WIDTH-1 downto 0);
    dmem_data_out                                : out std_logic_vector(DATA_WIDTH-1 downto 0);
    dmem_write_enable                            : out std_logic
  );
end MIPSProcessor;

architecture Behavioral of MIPSProcessor is

  ---------------------------------
  -- Internal wires
  ---------------------------------

  -- Instruction Fetch
  alias if_instruction                           : std_logic_vector(DATA_WIDTH-1 downto 0) is imem_data_in;
  signal if_new_pc                               : std_logic_vector(ADDR_WIDTH-1 downto 0);

  ---- Instruction Decode
  signal id_new_pc                               : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal id_opcode                               : std_logic_vector(5 downto 0);
  signal id_rs                                   : std_logic_vector(REG_WIDTH-1 downto 0);
  signal id_rt                                   : std_logic_vector(REG_WIDTH-1 downto 0);
  signal id_rd                                   : std_logic_vector(REG_WIDTH-1 downto 0);
  signal id_immediate                            : std_logic_vector(15 downto 0);
  signal id_branch                               : std_logic;
  signal id_branch_addr                          : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal id_jump_addr                            : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal id_result                               : unsigned(DATA_WIDTH-1 downto 0);
  signal id_zero                                 : std_logic;
  signal id_sign_extend_bits                     : std_logic_vector(15 downto 0);
  signal id_sign_extend                          : std_logic_vector(DATA_WIDTH-1 downto 0);

  ---- Execute
  signal ex_immediate_extend                     : std_logic_vector(REG_WIDTH-1 downto 0);
  signal ex_write_reg                            : std_logic_vector(REG_WIDTH-1 downto 0);
  signal ex_alu_restult                          : std_logic_vector(REG_WIDTH-1 downto 0);
  signal ex_rs                                   : std_logic_vector(REG_WIDTH-1 downto 0);
  signal ex_rt                                   : std_logic_vector(REG_WIDTH-1 downto 0);
  signal ex_rd                                   : std_logic_vector(REG_WIDTH-1 downto 0);
  signal ex_immediate                            : std_logic_vector(15 downto 0);
  signal ex_data_1                               : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal ex_data_2                               : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal ex_sign_extend                          : std_logic_vector(DATA_WIDTH-1 downto 0);

  ---- Memory
  signal mem_alu_result                          : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal mem_data                                : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal mem_write_reg                           : std_logic_vector(REG_WIDTH-1 downto 0);
  signal mem_immediate                           : std_logic_vector(15 downto 0);

  ---- Write Back
  signal wb_dmem_data                            : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal wb_alu_result                           : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal wb_write_reg                            : std_logic_vector(REG_WIDTH-1 downto 0);
  signal wb_immediate                            : std_logic_vector(15 downto 0);
  signal wb_write_data                           : std_logic_vector(DATA_WIDTH-1 downto 0);

  ---------------------------------
  -- Control signals
  ---------------------------------

  -- Control signals in the ID stage
  signal id_mem_write                            : std_logic;
  signal id_reg_write                            : std_logic;
  signal id_mem_to_reg                           : std_logic;
  signal id_reg_dest                             : std_logic;
  signal id_alu_op                               : std_logic_vector(1 downto 0);
  signal id_alu_src                              : std_logic;

  ---- Control signals in EX stage
  signal ex_control_reg_write                    : std_logic;
  signal ex_control_mem_to_reg                   : std_logic;
  signal ex_control_mem_write                    : std_logic;
  signal ex_control_reg_dest                     : std_logic;
  signal ex_control_alu_src                      : std_logic;
  signal ex_control_alu_op                       : std_logic_vector(1 downto 0);
  signal ex_control_alu_result                   : std_logic_vector(DATA_WIDTH-1 downto 0);

  signal ex_reg_write                            : std_logic;
  signal ex_mem_to_reg                           : std_logic;
  signal ex_mem_write                            : std_logic;

  ---- Control signals in MEM stage
  signal mem_control_reg_write                   : std_logic;
  signal mem_control_mem_to_reg                  : std_logic;
  signal mem_control_mem_write                   : std_logic;

  ---- Control signals in WB stage
  signal wb_control_reg_write                    : std_logic;
  signal wb_control_mem_to_reg                   : std_logic;

  ---------------------------------
  -- Component signals
  ---------------------------------

  -- Control Unit Signals
  signal id_control_mem_write                    : std_logic;
  signal id_control_reg_write                    : std_logic;
  signal id_control_mem_to_reg                   : std_logic;
  signal id_control_reg_dest                     : std_logic;
  signal id_control_alu_op                       : std_logic_vector(1 downto 0);
  signal id_control_alu_src                      : std_logic;
  signal id_control_branch                       : std_logic;
  signal id_control_jump                         : std_logic;
  signal id_control_pc_src                       : std_logic_vector(1 downto 0);
  signal id_control_flush                        : std_logic;
  signal ex_control_flush                        : std_logic;

  -- ALU Signals
  signal alu_data_1                              : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal alu_data_2                              : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal alu_result                              : std_logic_vector(DATA_WIDTH-1 downto 0);

  ---- Register Signals
  signal read_data_1                             : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal read_data_2                             : std_logic_vector(DATA_WIDTH-1 downto 0);

  ---- Program Counter Signals
  signal pc_addr_in                              : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal pc_addr_out                             : std_logic_vector(ADDR_WIDTH-1 downto 0);

  ---- ALU Control Signals
  signal funct                                   : std_logic_vector(5 downto 0);
  signal alu_ctrl                                : std_logic_vector(3 downto 0);

  -- Forwarding Unit Signals
  signal forward_a                               : std_logic_vector(1 downto 0);
  signal forward_b                               : std_logic_vector(1 downto 0);

  -- Hazard Detection Unit Signals
  signal stall                                   : std_logic;
  signal if_id_write                             : std_logic;
  signal pc_write                                : std_logic;

begin

  ---------------------------------
  -- Component Initialization
  ---------------------------------

  -- Initialize the Control Unit
  control_unit:   entity work.control(fsm) port map (
    clk                     => clk,
    processor_enable        => processor_enable,
    opcode                  => id_opcode,
    mem_write               => id_control_mem_write,
    mem_to_reg              => id_control_mem_to_reg,
    reg_dest                => id_control_reg_dest,
    reg_write               => id_control_reg_write,
    alu_op                  => id_control_alu_op,
    alu_src                 => id_control_alu_src,
    branch                  => id_control_branch,
    jump                    => id_control_jump,
    pc_src                  => id_control_pc_src,
    id_flush                => id_control_flush,
    ex_flush                => ex_control_flush);

  -- Initialize the ALU
  alu_module : entity work.ALU(behavioral) port map (
    -- Inputs
    data_1                  => alu_data_1,
    data_2                  => alu_data_2,
    alu_ctrl                => alu_ctrl,
    -- Outputs
    result                  => alu_result);

  -- Initialize the register file
  register_file : entity work.registerfile(Behavioral) port map (
    -- Inputs
    clk                     => clk,
    reset                   => reset,
    reg_write               => wb_control_reg_write,
    read_reg_1              => id_rs,
    read_reg_2              => id_rt,
    write_reg               => wb_write_reg,
    write_data              => wb_write_data,
    -- Outputs
    read_data_1             => read_data_1,
    read_data_2             => read_data_2);

  -- Initialize the program counter
  pc : entity work.program_counter(Behavioral) port map (
    -- Inputs
    clk                     => clk,
    reset                   => reset,
    enable                  => pc_write, -- NOT CONNECTED TO CONTROL
    addr_in                 => pc_addr_in,
    -- Outputs
    addr_out                => pc_addr_out);

  -- Initialize the alu control
  alu_control_module : entity work.alu_control(arch) port map (
    -- Inputs
    alu_op                  => ex_control_alu_op,
    funct                   => funct,
    -- Outputs
    alu_ctrl                => alu_ctrl);

  -- Initialize the hazard detection unit
  hazard_detection : entity work.hazard_detection_unit(rtl) port map (
    -- Inputs
    id_ex_mem_write         => ex_control_mem_write,
    if_id_rs                => id_rs,
    if_id_rt                => id_rt,
    id_ex_rt                => id_rt,
    -- Outputs
    pc_write                => pc_write, --THIS SHOULD PROBABLY BE CONNECTED TO PC_ENABLE?
    if_id_write             => if_id_write,
    stall                   => stall); -- DUNNO

  -- Initialize the forwarding unit
  forwarding : entity work.forwarding_unit(rtl) port map (
    -- Inputs
    id_ex_rs                => ex_rs,
    id_ex_rt                => ex_rt,
    ex_mem_rd               => mem_write_reg,
    mem_wb_rd               => wb_write_reg,
    ex_mem_reg_write        => ex_control_reg_write,
    mem_wb_reg_write        => mem_control_reg_write,
    -- Outputs
    forward_a               => forward_a,
    forward_b               => forward_b);

  ---------------------------------
  -- Stage Registers
  ---------------------------------

  IF_ID : entity work.if_id_reg(rtl) port map (
    -- Control inputs
    if_id_write             => if_id_write,
    -- Data inputs
    clk                     => clk,
    reset                   => reset,
    new_pc_in               => if_new_pc,
    instruction             => if_instruction,
    -- Data outputs
    new_pc_out              => id_new_pc,
    opcode_out              => id_opcode,
    rs_out                  => id_rs,
    rt_out                  => id_rt,
    rd_out                  => id_rd,
    address_out             => id_immediate);

  ID_EX : entity work.id_ex_reg(rtl) port map (
    -- Control inputs
    reg_write_in            => id_reg_write,
    mem_to_reg_in           => id_mem_to_reg,
    mem_write_in            => id_mem_write,
    reg_dest_in             => id_reg_dest,
    alu_src_in              => id_alu_src,
    alu_op_in               => id_alu_op,
    -- Control outputs
    reg_write_out           => ex_control_reg_write,
    mem_to_reg_out          => ex_control_mem_to_reg,
    mem_write_out           => ex_control_mem_write,
    reg_dest_out            => ex_control_reg_dest,
    alu_src_out             => ex_control_alu_src,
    alu_op_out              => ex_control_alu_op,
    -- Data inputs
    clk                     => clk,
    reset                   => reset,
    data_1_in               => read_data_1,
    data_2_in               => read_data_2,
    sign_extend_in          => id_sign_extend,
    rs_in                   => id_rs,
    rt_in                   => id_rt,
    rd_in                   => id_rd,
    address_in              => id_immediate,
    -- Data outputs
    data_1_out              => ex_data_1,
    data_2_out              => ex_data_2,
    sign_extend_out         => ex_sign_extend,
    rt_out                  => ex_rt,
    rs_out                  => ex_rs,
    rd_out                  => ex_rd,
    address_out             => ex_immediate);

  EX_MEM : entity work.ex_mem_reg(rtl) port map (
    -- Control inputs
    reg_write_in            => ex_reg_write,
    mem_to_reg_in           => ex_mem_to_reg,
    mem_write_in            => ex_mem_write,
    -- Control outputs
    reg_write_out           => mem_control_reg_write,
    mem_to_reg_out          => mem_control_mem_to_reg,
    mem_write_out           => dmem_write_enable, -- REMEMBER TO DELETE MEM_CONTROL_MEM_WRITE
    -- Data inputs
    clk                     => clk,
    reset                   => reset,
    alu_result_in           => alu_result,
    data_in                 => ex_data_2,
    rd_in                   => ex_write_reg,
    address_in              => ex_immediate,
    -- Data outputs
    alu_result_out          => mem_alu_result,
    data_out                => mem_data,
    rd_out                  => mem_write_reg,
    address_out             => mem_immediate);

  MEM_WB : entity work.mem_wb_reg(rtl) port map (
    -- Control inputs
    reg_write_in            => mem_control_reg_write,
    mem_to_reg_in           => mem_control_mem_to_reg,
    -- Control outputs
    mem_to_reg_out          => wb_control_mem_to_reg,
    reg_write_out           => wb_control_reg_write,
    -- Data inputs
    clk                     => clk,
    reset                   => reset,
    dmem_in                 => dmem_data_in,
    alu_result_in           => mem_alu_result,
    rd_in                   => mem_write_reg,
    address_in              => mem_immediate,
    -- Data outputs
    dmem_out                => wb_dmem_data,
    alu_result_out          => wb_alu_result,
    rd_out                  => wb_write_reg,
    address_out             => wb_immediate); -- Is it necessary to store this signal through all these stages?

  ---------------------------------
  -- Instruction Fetch
  ---------------------------------

  -- Increment PC
  if_new_pc <= std_logic_vector(unsigned(pc_addr_out) + 1);

  -- Branch MUX
  --with andgate select
  --  pc_addr_in <= id_branch_addr when something,
  --                the other mux when ...

  -- PC MUX
  with id_control_pc_src select
    pc_addr_in <= OVERFLOW_EXECPTION(ADDR_WIDTH-1 downto 0) when "11", -- NOTE THAT WE ONLY USE THE 8 LSB
                  id_jump_addr when "10",
                  id_branch_addr when "01",
                  if_new_pc when others;

  -- Pass PC to IM
  imem_address <= pc_addr_out;

  ---------------------------------
  -- Instruction Decode
  ---------------------------------

  -- THIS MIGHT INFERRE LATCHES?
  ID_FLUSH_MUX : process (stall, id_control_flush,
                          id_control_mem_write,
                          id_control_mem_to_reg,
                          id_control_reg_dest,
                          id_control_reg_write,
                          id_control_alu_op,
                          id_control_alu_src)
  begin
    if stall = '1' or id_control_flush = '1' then
      id_mem_write  <= id_control_mem_write;
      id_mem_to_reg <= id_control_mem_to_reg;
      id_reg_dest   <= id_control_reg_dest;
      id_reg_write  <= id_control_reg_write;
      id_alu_op     <= id_control_alu_op;
      id_alu_src    <= id_control_alu_src;
    else
      id_mem_write  <= '0';
      id_mem_to_reg <= '0';
      id_reg_dest   <= '0';
      id_reg_write  <= '0';
      id_alu_op     <= "00";
      id_alu_src    <= '0';
    end if;
  end process;

  -- And branch from CU and zero result
  id_branch <= id_zero and id_control_branch;

  -- Branch adder
  id_branch_addr <= std_logic_vector(unsigned(id_new_pc)+ unsigned(id_sign_extend(ADDR_WIDTH-1 downto 0)));

  -- Jump address
  id_jump_addr <= id_immediate(ADDR_WIDTH-1 downto 0);

  -- Branch equal zero
  id_result <= unsigned(read_data_1) - unsigned(read_data_2);
  with id_result select
    id_zero <= '1' when x"00000000",
            '0' when others;

  -- Sign extend
  id_sign_extend_bits <= (others => '0') when id_immediate(15) = '0' else (others => '1');
  id_sign_extend <= id_sign_extend_bits & id_immediate;

  ---------------------------------
  -- Execute
  ---------------------------------

  -- THIS MIGHT INFERRE LATCHES?
  EX_FLUSH_MUX : process (ex_control_flush,
                          ex_control_mem_write,
                          ex_control_mem_to_reg,
                          ex_control_reg_write)
  begin
    if ex_control_flush = '1' then
      ex_mem_write  <= ex_control_mem_write;
      ex_mem_to_reg <= ex_control_mem_to_reg;
      ex_reg_write  <= ex_control_reg_write;
    else
      ex_mem_write  <= '0';
      ex_mem_to_reg <= '0';
      ex_reg_write  <= '0';
    end if;
  end process;

  -- Get the funct bits from the instruction
  funct <= ex_immediate(5 downto 0);

  -- Destination register MUX
  ex_write_reg <= ex_rd when ex_control_reg_dest = '1' else ex_rt;

  -- ALU data_1 MUX NOTE! BUT WHERE DO WE USE THE SIGNEXTEND
  with forward_a select
    alu_data_1 <=  wb_write_data when "00",
                   mem_alu_result when "01",
                   ex_data_1 when others;

  -- ALU data_2 MUX
  with forward_b & ex_control_alu_src select
    alu_data_2 <=  wb_write_data when "000",
                   mem_alu_result when "010",
                   ex_data_2 when "100",
                   ex_sign_extend when others; -- Might be error prone. At ex_control_alu_src high

  ---------------------------------
  -- Memory
  ---------------------------------

  dmem_data_out <= mem_data;
  dmem_address  <= mem_alu_result(ADDR_WIDTH-1 downto 0);

  ---------------------------------
  -- Write Back
  ---------------------------------

  -- Mem to reg MUX
  wb_write_data <= wb_dmem_data when wb_control_mem_to_reg = '1' else wb_alu_result;

end Behavioral;
