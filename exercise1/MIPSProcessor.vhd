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

architecture DummyArch of MIPSProcessor is
	signal counterReg : unsigned(31 downto 0);
	
	-- Jump/Branch mux out
	signal next_pc_instruction : std_logic_vector(31 downto 0);
	signal branch_instruction : std_logic_vector(31 downto 0);
	signal pc_pluss_one : std_logic_vector(31 downto 0);
	-- signal pc_source : std_logic_vector(1 downto 0);
	signal branch : std_logic;
	signal jump : std_logic;
	signal branch_or_pc_pluss_one : std_logic_vector(31 downto 0);
	
	-- Control Unit Signals
	signal clk : std_logic;
	signal reset : std_logic;
	signal opcode : std_logic_vector(5 downto 0);
	signal mem_read : std_logic;
	signal mem_write : std_logic;
	signal mem_to_reg : std_logic;
	signal reg_dest : std_logic;
	signal reg_write : std_logic;
	signal alu_op : std_logic_vector(1 downto 0);
	signal alu_src : std_logic;
	signal branch : std_logic;
	signal jump : std_logic;	
	
	-- Control Unit
	component control is
		port (	-- Input
					clk : in std_logic;
					reset : in std_logic;
					opcode : in std_logic_vector(5 downto 0);
					-- Output 
					mem_read : out std_logic;
					mem_write : out std_logic;
					mem_to_reg : out std_logic;
					reg_dest : out std_logic;
					reg_write : out std_logic;
					alu_op : out std_logic_vector(1 downto 0);
					alu_src: out std_logic;
					branch: out std_logic;
					jump: out std_logic
					);	
	end component;
	
begin

	-- Initialize the Control Unit
	control_unit: control port map (	clk => clk,
												reset => reset,
												opcode => opcode,
												mem_read => mem_read,
												mem_write => mem_write,
												mem_to_reg => mem_to_reg,
												ir_write => ir_write,
												reg_dest => reg_dest,
												reg_write => reg_write,
												alu_op => alu_op,
												alu_src => alu_src,
												branch => branch,
												jump => jump);
	
	-- Branch MUX
	branch_or_pluss_one <= pc_pluss_one when branch = '0' else 
	
	-- Jump MUX
	next_pc_source <= 
										
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
	
	dmem_write_enable <= processor_enable;
	imem_address <= (others => '0');
	dmem_address <= std_logic_vector(counterReg(7 downto 0));
	dmem_data_out <= std_logic_vector(counterReg);

end DummyArch;

