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
    REG_WIDTH                                    : integer := 5
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
  signal if_new_pc                               : std_logic_vector(ADDR_WIDTH-1 downto 0);
  signal if_next_pc                              : std_logic_vector(ADDR_WIDTH-1 downto 0);

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
  signal ex_data_1                               : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal ex_data_2                               : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal ex_alu_data_2                           : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal ex_sign_extend                          : std_logic_vector(DATA_WIDTH-1 downto 0);

  ---- Memory
  signal mem_alu_result                          : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal mem_data                                : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal mem_dmem_data                           : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal mem_write_reg                           : std_logic_vector(REG_WIDTH-1 downto 0);

  ---- Write Back
  signal wb_dmem_data                            : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal wb_alu_result                           : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal wb_write_reg                            : std_logic_vector(REG_WIDTH-1 downto 0);
  signal wb_write_data                           : std_logic_vector(DATA_WIDTH-1 downto 0);

  ---------------------------------
  -- Control signals
  ---------------------------------

  -- Control signals in the ID stage
  signal id_mem_write                            : std_logic;
  signal id_mem_read                             : std_logic;
  signal id_reg_write                            : std_logic;
  signal id_mem_to_reg                           : std_logic;
  signal id_reg_dest                             : std_logic;
  signal id_alu_op                               : std_logic_vector(1 downto 0);
  signal id_alu_src                              : std_logic;
  signal id_pc_src 										 : std_logic_vector(1 downto 0);

  ---- Control signals in EX stage
  signal ex_control_reg_write                    : std_logic;
  signal ex_control_mem_to_reg                   : std_logic;
  signal ex_control_mem_write                    : std_logic;
  signal ex_control_mem_read                     : std_logic;
  signal ex_control_reg_dest                     : std_logic;
  signal ex_control_alu_src                      : std_logic;
  signal ex_control_alu_op                       : std_logic_vector(1 downto 0);
  signal ex_control_alu_result                   : std_logic_vector(DATA_WIDTH-1 downto 0);

  ---- Control signals in MEM stage
  signal mem_control_reg_write                   : std_logic;
  signal mem_control_mem_to_reg                  : std_logic;
  signal mem_control_mem_write                   : std_logic;
  signal mem_control_mem_read                    : std_logic;

  ---- Control signals in WB stage
  signal wb_control_reg_write                    : std_logic;
  signal wb_control_mem_to_reg                   : std_logic;

  ---------------------------------
  -- Component signals
  ---------------------------------

  -- Control Unit Signals
  signal id_control_mem_write                    : std_logic;
  signal id_control_mem_read                     : std_logic;
  signal id_control_reg_write                    : std_logic;
  signal id_control_mem_to_reg                   : std_logic;
  signal id_control_reg_dest                     : std_logic;
  signal id_control_alu_op                       : std_logic_vector(1 downto 0);
  signal id_control_alu_src                      : std_logic;
  signal id_control_branch                       : std_logic;
  signal id_control_jump                         : std_logic;
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

--  signal dummy_if 										 : std_logic_vector(DATA_WIDTH-1 downto 0);
--  signal dummy_id 										 : std_logic_vector(DATA_WIDTH-1 downto 0);
--  signal dummy_ex 										 : std_logic_vector(DATA_WIDTH-1 downto 0);
--  signal dummy_mem										 : std_logic_vector(DATA_WIDTH-1 downto 0);
--  signal dummy_wb 										 : std_logic_vector(DATA_WIDTH-1 downto 0);
  
  -- temp 
  signal previous_instruction : std_logic_vector(DATA_WIDTH-1 downto 0);
  signal previous_if_id_write : std_logic;
  signal if_id_reset : std_logic;
  signal if_instruction : std_logic_vector(DATA_WIDTH-1 downto 0);

begin

  ---------------------------------
  -- Component Initialization
  ---------------------------------

  -- Initialize the Control Unit
  control_unit:   entity work.control(arch) port map (
    processor_enable        => processor_enable,
    opcode                  => id_opcode,
    mem_write               => id_control_mem_write,
	 mem_read                => id_control_mem_read,
    mem_to_reg              => id_control_mem_to_reg,
    reg_dst                 => id_control_reg_dest,
    reg_write               => id_control_reg_write,
    alu_op                  => id_control_alu_op,
    alu_src                 => id_control_alu_src,
    branch                  => id_control_branch,
    jump                    => id_control_jump);

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
	 processor_enable        => processor_enable,
    enable                  => pc_write,
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
    id_ex_mem_read          => ex_control_mem_read,
    if_id_rs                => id_rs,
    if_id_rt                => id_rt,
    id_ex_rt                => ex_rt,
    -- Outputs
    pc_write                => pc_write,
    if_id_write             => if_id_write,
    stall                   => stall);

  -- Initialize the forwarding unit
  forwarding : entity work.forwarding_unit(rtl) port map (
    -- Inputs
    id_ex_rs                => ex_rs,
    id_ex_rt                => ex_rt,
    ex_mem_rd               => mem_write_reg,
    mem_wb_rd               => wb_write_reg,
    ex_mem_reg_write        => mem_control_reg_write,
    mem_wb_reg_write        => wb_control_reg_write,
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
    reset                   => if_id_reset,
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
	 mem_read_in             => id_mem_read,
    reg_dest_in             => id_reg_dest,
    alu_src_in              => id_alu_src,
    alu_op_in               => id_alu_op,
    -- Control outputs
    reg_write_out           => ex_control_reg_write,
    mem_to_reg_out          => ex_control_mem_to_reg,
    mem_write_out           => ex_control_mem_write,
	 mem_read_out            => ex_control_mem_read,
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
    -- Data outputs
    data_1_out              => ex_data_1,
    data_2_out              => ex_data_2,
    sign_extend_out         => ex_sign_extend,
    rt_out                  => ex_rt,
    rs_out                  => ex_rs,
    rd_out                  => ex_rd);

  EX_MEM : entity work.ex_mem_reg(rtl) port map (
    -- Control inputs
    reg_write_in            => ex_control_reg_write,
    mem_to_reg_in           => ex_control_mem_to_reg,
    mem_write_in            => ex_control_mem_write,
	 mem_read_in             => ex_control_mem_read,
    -- Control outputs
    reg_write_out           => mem_control_reg_write,
    mem_to_reg_out          => mem_control_mem_to_reg,
    mem_write_out           => dmem_write_enable,
	 mem_read_out            => mem_control_mem_read,
    -- Data inputs
    clk                     => clk,
    reset                   => reset,
    alu_result_in           => alu_result,
    data_in                 => ex_alu_data_2,
    rd_in                   => ex_write_reg,
    -- Data outputs
    alu_result_out          => mem_alu_result,
    data_out                => mem_data,
    rd_out                  => mem_write_reg);

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
    dmem_in                 => mem_dmem_data,
    alu_result_in           => mem_alu_result,
    rd_in                   => mem_write_reg,
    -- Data outputs
    dmem_out                => wb_dmem_data,
    alu_result_out          => wb_alu_result,
    rd_out                  => wb_write_reg);
	 
  ---------------------------------
  -- DUMMY REGISTERS for testbenching
  --------------------------------- 
  
--  dummy_if <= imem_data_in;
--  
--  DUMMY : process (clk, reset, processor_enable, dummy_if, dummy_id, dummy_ex, dummy_mem, imem_data_in) begin
--    if reset = '1' then 
--		dummy_id <= (others => '0');
--		dummy_ex <= (others => '0');
--		dummy_mem <= (others => '0');
--		dummy_wb <= (others => '0');
--	 else
--		if rising_edge(clk) and processor_enable = '1' then 
--		  dummy_id <= dummy_if;
--		  dummy_ex <= dummy_id;
--		  dummy_mem <= dummy_ex;
--		  dummy_wb <= dummy_mem;
--		end if;
--	 end if;
--  end process;

  ---------------------------------
  -- Instruction Fetch
  ---------------------------------

  -- Increment PC
  if_new_pc <= std_logic_vector(unsigned(pc_addr_out) + 1) ;
  
  branch_jump_registers : process (clk, imem_data_in, if_id_write, id_branch, id_control_jump) begin
    if rising_edge(clk) then
      previous_instruction <= imem_data_in;
		previous_if_id_write <= if_id_write;
		if_id_reset <= id_branch or id_control_jump;
    end if;
  end process;
  
  if_instruction <= imem_data_in when previous_if_id_write = '1' else previous_instruction;

  id_pc_src <= id_branch & id_control_jump;

  -- PC MUX
  with id_pc_src select 
    if_next_pc <=  if_new_pc when "00",
						 id_jump_addr when "01", 
						 id_branch_addr when others;

	with processor_enable select 
     pc_addr_in <= if_next_pc when '1',
						 (others => '0') when others;

  -- Pass PC to IM
  imem_address <= pc_addr_out;

  ---------------------------------
  -- Instruction Decode
  ---------------------------------

  ID_FLUSH_MUX : process (stall,
                          id_control_mem_write,
								  id_control_mem_read,
                          id_control_mem_to_reg,
                          id_control_reg_dest,
                          id_control_reg_write,
                          id_control_alu_op,
                          id_control_alu_src)
  begin
    if stall = '0' then 
      id_mem_write  <= id_control_mem_write;
		id_mem_read   <= id_control_mem_read;
      id_mem_to_reg <= id_control_mem_to_reg;
      id_reg_dest   <= id_control_reg_dest;
      id_reg_write  <= id_control_reg_write;
      id_alu_op     <= id_control_alu_op;
      id_alu_src    <= id_control_alu_src;
    else
      id_mem_write  <= '0';
		id_mem_read   <= '0';
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

  -- Get the funct bits from the instruction
  funct <= ex_sign_extend(5 downto 0);

  -- Destination register MUX
  ex_write_reg <= ex_rd when ex_control_reg_dest = '1' else ex_rt;

  -- ALU data_1 MUX 
  with forward_a select
    alu_data_1 <=  ex_data_1 when "00",
                   wb_write_data when "01",
                   mem_alu_result when others;

  -- ALU data_2 MUX
  with forward_b select
    ex_alu_data_2 <= ex_data_2 when "00",
							wb_write_data when "01",
							mem_alu_result when others;
						 
  with ex_control_alu_src select
    alu_data_2 <= ex_alu_data_2 when '0',
						ex_sign_extend when others;

  ---------------------------------
  -- Memory
  ---------------------------------

  dmem_data_out <= mem_data;
  dmem_address  <= mem_alu_result(ADDR_WIDTH-1 downto 0);

  mem_dmem_data <= wb_dmem_data when mem_control_mem_read = '1' else dmem_data_in;

  ---------------------------------
  -- Write Back
  ---------------------------------

  -- Mem to reg MUX
  wb_write_data <= dmem_data_in when wb_control_mem_to_reg = '1' else wb_alu_result;

end Behavioral;
