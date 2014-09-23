library ieee;
use ieee.std_logic_1164.all;   
-- use ieee.std_logic_unsigned.all;
-- library work;
-- use work.all;

entity control_fast_tb is
end entity;

architecture arch of control_fast_tb is	 

	component control_fast
		port (	-- Input
				clk : in std_logic;
				reset : in std_logic;
				opcode : in std_logic_vector(5 downto 0);
				-- Output 
				pc_write_cond : out std_logic;
				pc_write : out std_logic;
				i_or_d : out std_logic;
				mem_read : out std_logic;
				mem_write : out std_logic;
				mem_to_reg : out std_logic;
				ir_write : out std_logic;
				reg_dest : out std_logic;
				reg_write : out std_logic;
				alu_src_a : out std_logic;
				alu_src_b : out std_logic_vector(1 downto 0);
				alu_op : out std_logic_vector(1 downto 0);
				pc_source : out std_logic_vector(1 downto 0));
	end component;	
	
	signal clk, reset : std_logic := '0';
	signal instruction : std_logic_vector(31 downto 0) := (others => '0');	
	signal pc_write_cond : std_logic;
	signal pc_write : std_logic;
	signal i_or_d : std_logic;
	signal mem_read : std_logic;
	signal mem_write : std_logic;
	signal mem_to_reg : std_logic;
	signal ir_write : std_logic;
	signal reg_dest : std_logic;
	signal reg_write : std_logic;
	signal alu_src_a : std_logic;
	signal alu_src_b : std_logic_vector(1 downto 0);
	signal alu_op : std_logic_vector(1 downto 0);
	signal pc_source : std_logic_vector(1 downto 0);
	
	constant clkperiod : time := 1 ns;	
	
	-- Load/Store instructions
	signal lw : std_logic_vector(5 downto 0) := "100011";   
	signal sw : std_logic_vector(5 downto 0) := "101011";
	
	-- Beg instruction
	signal beq : std_logic_vector(5 downto 0) := "000100";
	
	-- Register instructions
	signal add : std_logic_vector(5 downto 0) := "100000";
	signal sub : std_logic_vector(5 downto 0) := "100010";
	signal and_op : std_logic_vector(5 downto 0) := "100100";
	signal or_op : std_logic_vector(5 downto 0) := "100101";
	signal set_on_less_than : std_logic_vector(5 downto 0) := "101010";
	
begin
	
	DUT: control_fast port map (	clk => clk, 
									reset => reset, 
									opcode => instruction(5 downto 0), 
									pc_write_cond => pc_write_cond,
									pc_write => pc_write,
									i_or_d => i_or_d,
									mem_read =>	mem_read,
									mem_write => mem_write,
									mem_to_reg => mem_to_reg,
									ir_write =>	ir_write,
									reg_dest =>	reg_dest,
									reg_write => reg_write,
									alu_src_a => alu_src_a,
									alu_src_b => alu_src_b,
									alu_op => alu_op,
									pc_source => pc_source);
	
	clock : process 
	begin
		
		wait for clkperiod/2;
		clk <= '1';
		wait for clkperiod/2;
		clk <= '0';	 
		
	end process;
	
	test: process 	
	begin 		  
		
		-- Reset 
		wait for 1 ns;
		reset <= '0';
		
		wait for 1 ns;
		reset <= '1';
		
		wait for 1 ns;
		reset <= '0';
		
		-- Load/Store instructions	
		instruction(31 downto 26) <= lw;
		
		wait for 5 ns; 
		instruction(31 downto 26) <= sw; 
		
		-- Beg instruction
		wait for 5 ns;  
		instruction(31 downto 26) <= beq;
		
		-- Register instructions
		wait for 5 ns; 
		instruction(31 downto 26) <= add;
		
		wait for 5 ns; 
		instruction(31 downto 26) <= sub;
		
		wait for 5 ns; 
		instruction(31 downto 26) <= and_op;
		
		wait for 5 ns; 
		instruction(31 downto 26) <= or_op;
		
		wait for 5 ns; 
		instruction(31 downto 26) <= set_on_less_than;
		
	end process;
				
end architecture;