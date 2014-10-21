-- Part of TDT4255 Computer Design laboratory exercises
-- Group for Computer Architecture and Design
-- Department of Computer and Information Science
-- Norwegian University of Science and Technology

-- MIPSProcessor.vhd
-- The MIPS processor component to be used in Exercise 1 and 2.

-- TODO replace the architecture DummyArch with a working Behavioral

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity MIPSProcessor is
	generic (
		ADDR_WIDTH : integer := 8;
		DATA_WIDTH : integer := 32;
    OVERFLOW_EXECPTION : std_logic_vector(DATA_WIDTH-1 downto 0) := x"80000180";
	);
	port (
		clk, reset                       : in std_logic;
		processor_enable                 : in std_logic;
		imem_data_in                     : in std_logic_vector(DATA_WIDTH-1 downto 0);
		imem_address                     : out std_logic_vector(ADDR_WIDTH-1 downto 0);
		dmem_data_in                     : in std_logic_vector(DATA_WIDTH-1 downto 0);
		dmem_address                     : out std_logic_vector(ADDR_WIDTH-1 downto 0);
		dmem_data_out                    : out std_logic_vector(DATA_WIDTH-1 downto 0);
		dmem_write_enable                : out std_logic
	);
end MIPSProcessor;

architecture Behavioral of MIPSProcessor is

	---------------------------------
	-- Register Declarations
	---------------------------------

	-- Instruction Fetch/Decode
	signal if_id_new_pc                 : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal if_id_instruction            : std_logic_vector(DATA_WIDTH-1 downto 0);

	-- Instruction Decode/Execute
	signal id_ex_new_pc                 : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal id_ex_read_data_1            : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal id_ex_read_data_2            : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal id_ex_sign_extend            : std_logic_vector(15 downto 0);
	signal id_ex_lw_address             : std_logic_vector(15 downto 0);

	-- Execute/Memory
	signal ex_mem_zero                  : std_logic;
	signal ex_mem_alu_result            : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal ex_mem_read_data_2           : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal ex_mem_branch_addr           : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal ex_mem_lw_address            : std_logic_vector(15 downto 0);

	-- Memory/Writeback
	signal mem_wb_alu_result            : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal mem_wb_read_dmem             : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal mem_wb_lw_address            : std_logic_vector(15 downto 0);


	---------------------------------
	-- Signal Declarations
	---------------------------------

	-- Jump/Branch mux out
	signal new_pc                 : std_logic_vector(ADDR_WIDTH-1 downto 0);
	signal branch_sel                   : std_logic;
	signal branch_or_pc_pluss_one       : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal shift_left                   : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sign_extend                  : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal shift_left_or_sign_extend    : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal sign_extend_bits             : std_logic_vector(15 downto 0);
	signal branch_addr                  : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal jump_addr                    : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal next_pc                      : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal pc_addr                      : std_logic_vector(DATA_WIDTH-1 downto 0); -- No longer needed
	signal pc_src                       : std_logic; -- Change to correct signal

	-- Control Unit Signals
	signal opcode                       : std_logic_vector(5 downto 0);
	signal mem_read                     : std_logic; -- Excess. !mem_write TODO: remove
	signal mem_write                    : std_logic;
	signal mem_to_reg                   : std_logic;
	signal reg_dest                     : std_logic;
	signal alu_op                       : std_logic_vector(1 downto 0);
	signal alu_src                      : std_logic;
	signal branch                       : std_logic;
	signal jump                         : std_logic;
	signal shift                        : std_logic;

	-- ALU Signals
	signal alu_data_1                   : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal alu_data_2                   : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal alu_result                   : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal zero                         : std_ulogic;

	-- Register Signals
	signal reg_write                    : std_logic;
	signal read_reg_1                   : std_logic_vector(4 downto 0);
	signal read_reg_2                   : std_logic_vector(4 downto 0);
	signal write_reg                    : std_logic_vector(4 downto 0);
	signal write_data                   : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal read_data_1                  : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal read_data_2                  : std_logic_vector(DATA_WIDTH-1 downto 0);

	-- Program Counter Signals
	signal pc_addr_in                   : std_logic_vector(ADDR_WIDTH-1 downto 0); -- Changed for new PC
	signal pc_addr_out                  : std_logic_vector(ADDR_WIDTH-1 downto 0); -- Changed for new PC

	-- ALU Control Signals
	signal funct                        : std_logic_vector(5 downto 0);
	signal alu_ctrl                     : std_logic_vector(3 downto 0);

begin

	---------------------------------
	-- Component Initialization
	---------------------------------

	-- Initialize the Control Unit
	control_unit: 	entity work.control(fsm) port map (
		clk                     => clk,
		processor_enable        => processor_enable, -- Excess.
		opcode                  => imem_data_in(31 downto 26),
		mem_read                => mem_read, -- Excess. !mem_write TODO: remove
		mem_write               => dmem_write_enable,
		mem_to_reg              => mem_to_reg,
		reg_dest                => reg_dest,
		reg_write               => reg_write,
		alu_op                  => alu_op,
		alu_src                 => alu_src,
		branch                  => branch,
		jump                    => jump,
		shift                   => shift,
		pc_mux                  => pc_src); -- Change to correct signal

	-- Initialize the ALU
	alu_module : entity work.ALU(behavioral) port map (
		data_1                  => read_data_1,
		data_2                  => alu_data_2,
		alu_ctrl                => alu_ctrl,
		result                  => alu_result,
		zero                    => zero);

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
		addr_in                 => pc_addr_in,
		addr_out                => pc_addr_out);

	-- Initialize the alu control
	alu_control_module : entity work.alu_control(arch) port map (
		alu_op                  => alu_op,
		funct                   => imem_data_in(5 downto 0),
		alu_ctrl                => alu_ctrl);

	---------------------------------
	-- Main Curcuit
	---------------------------------

	---------------------------------
	-- Instruction Fetch
	---------------------------------

	-- Increment PC
	new_pc <= std_logic_vector(unsigned(pc_addr_out) + 1);

	-- PC MUX
  with pc_src select
    pc_addr_in <= branch_addr when "10",
                  OVERFLOW_EXECPTION when "01",
                  new_pc when others;

	-- Pass PC to IM
	imem_address <= pc_addr_out;

	---------------------------------
	-- Instruction Decode
	---------------------------------

	-- Instruction to register
	read_reg_1 <= imem_data_in(25 downto 21);
	read_reg_2 <= imem_data_in(20 downto 16);

	-- Sign extend
	sign_extend_bits <= (others => '0') when if_id_instruction = '0' else (others => '1'); -- Updated
	sign_extend <= sign_extend_bits & if_id_instruction(15 downto 0); -- Updated

	-- Shift left 16
	shift_left <= imem_data_in(15 downto 0) & x"0000";
	shift_left_or_sign_extend <= shift_left when shift = '1' else sign_extend;

	-- Write register MUX
	write_reg <= imem_data_in(15 downto 11) when reg_dest = '1' else imem_data_in(20 downto 16); -- Must be replaced

	---------------------------------
	-- Execute
	---------------------------------

	-- ALU src MUX
	alu_data_2 <= read_data_2 when alu_src = '0' else shift_left_or_sign_extend;

	-- Branch adder
	branch_addr <= std_logic_vector(unsigned(new_pc) + unsigned(shift_left_or_sign_extend));

	-- Jump MUX
	pc_addr <= jump_addr when jump = '1' else branch_or_pc_pluss_one;

	---------------------------------
	-- Memory
	---------------------------------

	-- Alu to mem MOVE THIS ONE
	dmem_address <= alu_result(ADDR_WIDTH-1 downto 0);
	dmem_data_out <= read_data_2;



	-- Branch if zero
	branch_sel <= branch and zero;

	-- Branch MUX
	branch_or_pc_pluss_one <= branch_addr when branch_sel = '1' else new_pc;

	---------------------------------
	-- Write Back
	---------------------------------

	-- Jump address
	jump_addr <= new_pc & imem_data_in(25 downto 0);

	-- Mem to reg MUX
	write_data <= dmem_data_in when mem_to_reg = '1' else alu_result;

	stage_registers : process (clk, reset)
		if reset = '1' then
			-- Do the reset thingy
		else

			-- Trying to pass the registers. Assuming VHDLs doesnt update signals to fast

			-- Execute/Memory
			ex_mem_branch_addr <=

			-- Instruction Decode/Execute
			id_ex_new_pc 		<= if_id_new_pc;
			id_ex_lw_address 	<= id_if_instruction(15 downto 0);
			id_ex_sign_extend <= sign_extend;
			id_ex_read_data_1 <= read_data_1;
			id_ex_read_data_2 <= read_data_2;

			-- Instruction Fetch/Decode
			if_id_new_pc 		  <= new_pc;
			if_id_instruction <= imem_data_in;

		end if;
	end process;

end Behavioral;

