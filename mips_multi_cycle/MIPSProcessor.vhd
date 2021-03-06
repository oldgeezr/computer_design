



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
		DATA_WIDTH : integer := 32
	);
	port (
		clk, reset 				: in std_logic;
		processor_enable		: in std_logic;
		imem_data_in			: in std_logic_vector(DATA_WIDTH-1 downto 0);
		imem_address			: out std_logic_vector(ADDR_WIDTH-1 downto 0);
		dmem_data_in			: in std_logic_vector(DATA_WIDTH-1 downto 0);
		dmem_address			: out std_logic_vector(ADDR_WIDTH-1 downto 0);
		dmem_data_out			: out std_logic_vector(DATA_WIDTH-1 downto 0);
		dmem_write_enable		: out std_logic
	);
end MIPSProcessor;

architecture Behavioral of MIPSProcessor is

	---------------------------------
	-- Signal Declarations
	---------------------------------

	signal counterReg : unsigned(31 downto 0);
	signal pc_increment_value : std_logic_vector(31 downto 0) := x"00000004";

	-- Jump/Branch mux out
	signal pc_pluss_one : std_logic_vector(31 downto 0);
	signal branch_sel : std_logic;
	signal branch_or_pc_pluss_one : std_logic_vector(31 downto 0);
	signal shift_left : std_logic_vector(31 downto 0);
	signal sign_extend : std_logic_vector(31 downto 0);
	signal shift_left_or_sign_extend : std_logic_vector(31 downto 0);
	signal sign_extend_bits : std_logic_vector(15 downto 0);
	signal branch_addr : std_logic_vector(31 downto 0);
	signal jump_addr : std_logic_vector(31 downto 0);
	signal next_pc : std_logic_vector(31 downto 0);
	signal pc_addr : std_logic_vector(31 downto 0);
	signal pc_mux : std_logic;

	-- Control Unit Signals
	signal opcode : std_logic_vector(5 downto 0);
	signal mem_read : std_logic;
	signal mem_to_reg : std_logic;
	signal reg_dest : std_logic;
	signal alu_op : std_logic_vector(1 downto 0);
	signal alu_src : std_logic;
	signal branch : std_logic;
	signal jump : std_logic;
	signal shift : std_logic;

	-- ALU Signals
	signal alu_data_1: std_logic_vector(31 downto 0);
	signal alu_data_2: std_logic_vector(31 downto 0);
	signal alu_result: std_logic_vector(31 downto 0);
	signal zero: std_ulogic;

	-- Register
	signal reg_write : std_logic;
	signal read_reg_1 : std_logic_vector(4 downto 0);
	signal read_reg_2 : std_logic_vector(4 downto 0);
	signal write_reg : std_logic_vector(4 downto 0);
	signal write_data : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal read_data_1 : std_logic_vector(DATA_WIDTH-1 downto 0);
	signal read_data_2 : std_logic_vector(DATA_WIDTH-1 downto 0);

	-- Program Counter
	signal pc_addr_in : std_logic_vector(31 downto 0);
	signal pc_addr_out : std_logic_vector(31 downto 0);

	-- ALU Control
	signal funct : std_logic_vector(5 downto 0);
	signal alu_ctrl : std_logic_vector(3 downto 0);

begin

	---------------------------------
	-- Component Initialization
	---------------------------------

	-- Initialize the Control Unit
control_unit: 	entity work.control(fsm) port map (
		clk => clk,
		processor_enable => processor_enable,
		opcode => imem_data_in(31 downto 26),
		mem_read => mem_read,
		mem_write => dmem_write_enable,
		mem_to_reg => mem_to_reg,
		reg_dest => reg_dest,
		reg_write => reg_write,
		alu_op => alu_op,
		alu_src => alu_src,
		branch => branch,
		jump => jump,
		shift => shift,
		pc_mux => pc_mux);

	-- Initialize the ALU
	alu_module : entity work.ALU(behavioral) port map (
		data_1 => read_data_1,
		data_2 => alu_data_2,
		alu_ctrl => alu_ctrl,
		result => alu_result,
		zero => zero);

	-- Initialize the register file
	register_file : entity work.registerfile(Behavioral) port map (
		clk => clk,
		reset => reset,
		reg_write => reg_write,
		read_reg_1 => read_reg_1,
		read_reg_2 => read_reg_2,
		write_reg => write_reg,
		write_data => write_data,
		read_data_1 => read_data_1,
		read_data_2 => read_data_2);

	-- Initialize the program counter
	pc : entity work.program_counter(Behavioral) port map (
		clk => clk,
		reset => reset,
		addr_in => pc_addr_in,
		addr_out => pc_addr_out);

	-- Initialize the alu control
	alu_control_module : entity work.alu_control(arch) port map (
		alu_op => alu_op,
		funct => imem_data_in(5 downto 0),
		alu_ctrl => alu_ctrl);

	---------------------------------
	-- Main Curcuit
	---------------------------------

	-- PC addr to instruction memory
	imem_address <= pc_addr_out(ADDR_WIDTH-1 downto 0);

	-- Instruction to register
	read_reg_1 <= imem_data_in(25 downto 21);
	read_reg_2 <= imem_data_in(20 downto 16);

	-- Write register MUX
	write_reg <= imem_data_in(15 downto 11) when reg_dest = '1' else imem_data_in(20 downto 16);

	-- Alu to mem MOVE THIS ONE
	dmem_address <= alu_result(ADDR_WIDTH-1 downto 0);
	dmem_data_out <= read_data_2;

	-- PC adder
	pc_pluss_one <= std_logic_vector(unsigned(pc_addr_out) + 1);

	-- Jump address
	jump_addr <= pc_pluss_one(31 downto 26) & imem_data_in(25 downto 0); -- Might be wrong

	-- Branch adder
	branch_addr <= std_logic_vector(unsigned(pc_pluss_one) + unsigned(shift_left_or_sign_extend));

	-- Branch if zero
	branch_sel <= branch and zero;

	-- Branch MUX
	branch_or_pc_pluss_one <= branch_addr when branch_sel = '1' else pc_pluss_one;

	-- Jump MUX
	pc_addr <= jump_addr when jump = '1' else branch_or_pc_pluss_one;

	-- PC MUX
	pc_addr_in <= pc_addr when pc_mux = '1' else pc_addr_out;

	-- Mem to reg MUX
	write_data <= dmem_data_in when mem_to_reg = '1' else alu_result;

	-- Sign extend
	sign_extend_bits <= (others => '0') when imem_data_in(15) = '0' else (others => '1');
	sign_extend <= sign_extend_bits & imem_data_in(15 downto 0);

	-- Shift left 16
	shift_left <= imem_data_in(15 downto 0) & x"0000";
	shift_left_or_sign_extend <= shift_left when shift = '1' else sign_extend;

	-- ALU src MUX
	alu_data_2 <= read_data_2 when alu_src = '0' else shift_left_or_sign_extend;
	-- alu_data_1 <= read_data_1; NOT NECESSARY

	DummyProc: process(clk, reset)
	begin
		if reset = '1' then
			counterReg <= (others => '0');
		elsif rising_edge(clk) then
			if processor_enable = '1' then

				counterReg <= counterReg + 1;
			end if;
		end if;
	end process;

	-- dmem_write_enable <= processor_enable;
	-- imem_address <= (others => '0');
	-- dmem_address <= std_logic_vector(counterReg(7 downto 0));
	-- dmem_data_out <= std_logic_vector(counterReg);

end Behavioral;

