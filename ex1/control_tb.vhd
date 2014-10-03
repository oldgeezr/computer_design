library ieee;
use ieee.std_logic_1164.all;   
-- use ieee.std_logic_unsigned.all;
-- library work;
-- use work.all;

entity control_tb is
end entity;

architecture arch of control_tb is	 

	component control
		port (	-- Input
					clk : in std_logic;
					processor_enable : in std_logic;
					opcode : in std_logic_vector(5 downto 0);
					-- Output 
					mem_read : out std_logic;
					mem_write : out std_logic;
					mem_to_reg : out std_logic;
					reg_dest : out std_logic; 
					reg_write : out std_logic;
					alu_op : out std_logic_vector(1 downto 0);
					alu_src : out std_logic;
					branch : out std_logic;
					jump : out std_logic);
	end component;	
	
	signal clk : std_logic;
	signal processor_enable : std_logic;
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
	
	constant clkperiod : time := 10 ns;	
	
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
	
	DUT: control port map (
		clk => clk, 
		processor_enable => processor_enable,
		opcode => opcode,
		mem_read => mem_read,
		mem_write => mem_write,
		mem_to_reg => mem_to_reg,
		reg_dest => reg_dest, 
		reg_write => reg_write,
		alu_op => alu_op,
		alu_src => alu_src,
		branch => branch,
		jump => jump);
	
	clock : process 
	begin
		
		wait for clkperiod/2;
		clk <= '0';
		wait for clkperiod/2;
		clk <= '1';	 
		
	end process;
	
	test: process 	
	begin 		  
		
		-- Reset 
		-- wait for clkperiod;
		-- reset <= '0';
		
		wait for clkperiod;
		processor_enable <= '0';
		-- reset <= '1';
		
		-- reset <= '0';
		wait for clkperiod;
		processor_enable <= '1';
		
		-- Load/Store instructions	
		opcode <= lw;		
		
		wait for 3*clkperiod; 
		opcode <= sw; 
		
		-- Beg instruction
		wait for 3*clkperiod;  
		opcode <= beq;
		
		-- Register instructions
		wait for 2*clkperiod; 
		opcode <= add;
		
		wait for 2*clkperiod; 
		opcode <= sub;
		
		wait for 2*clkperiod; 
		opcode <= and_op;
		
		wait for 2*clkperiod; 
		opcode <= or_op;
		
		wait for 2*clkperiod; 
		opcode <= set_on_less_than;
		
		assert false report"END SIM" severity failure;
		
	end process;
	
end architecture;