library ieee;
use ieee.std_logic_1164.all;  
use ieee.numeric_std.all;

entity control_tb is
end entity;

architecture arch of control_tb is	 

	component control
		port (	-- Input
					clk : in std_logic;
					processor_enable : in std_logic;
					opcode : in std_logic_vector(5 downto 0);
					-- Output 
					mem_write : out std_logic;
					mem_to_reg : out std_logic;
					reg_dest : out std_logic; 
					reg_write : out std_logic;
					alu_op : out std_logic_vector(1 downto 0);
					alu_src : out std_logic;
					branch : out std_logic;
					shift : out std_logic;
					pc_mux : out std_logic;
					jump : out std_logic);
	end component;	
	
	signal clk : std_logic;
	signal processor_enable : std_logic;
	signal opcode : std_logic_vector(5 downto 0);
	signal mem_write : std_logic;
	signal mem_to_reg : std_logic;
	signal reg_dest : std_logic; 
	signal reg_write : std_logic;
	signal alu_op : std_logic_vector(1 downto 0);
	signal alu_src : std_logic;
	signal branch : std_logic;
	signal shift : std_logic;
	signal jump : std_logic;
	signal pc_mux : std_logic;
	
	constant clkperiod : time := 10 ns;	
	
	-- Load/Store instructions
	signal lw : std_logic_vector(5 downto 0) := "100011";   
	signal sw : std_logic_vector(5 downto 0) := "101011";
	signal lui : std_logic_vector(5 downto 0) := "001111";
	
	-- Beg instruction
	signal beq : std_logic_vector(5 downto 0) := "000100";
	
	-- Register instructions
	signal jtype : std_logic_vector(5 downto 0) := "000010";
	
	-- Register instructions
	signal rtype : std_logic_vector(5 downto 0) := "000000";
	
begin
	
	DUT: control port map (
		clk => clk, 
		processor_enable => processor_enable,
		opcode => opcode,
		mem_write => mem_write,
		mem_to_reg => mem_to_reg,
		reg_dest => reg_dest, 
		reg_write => reg_write,
		alu_op => alu_op,
		alu_src => alu_src,
		branch => branch,
		shift => shift,
		pc_mux => pc_mux,
		jump => jump);
	
	clock : process 
	begin
		
		wait for clkperiod/2;
		clk <= '0';
		wait for clkperiod/2;
		clk <= '1';	 
		
	end process;
	
	test: process

		procedure Checklist(
			tb_mem_write : in std_logic;
			tb_mem_to_reg : in std_logic;
			tb_reg_dest : in std_logic; 
			tb_reg_write : in std_logic;
			tb_alu_op : in std_logic_vector(1 downto 0);
			tb_alu_src : in std_logic;
			tb_branch : in std_logic;
			tb_shift : in std_logic;
			tb_pc_mux : in std_logic;
			tb_jump : in std_logic) is
		begin
		
			wait for 0.5*clkperiod;
			assert tb_mem_write = mem_write report "mem_write is wrong, found = " & std_logic'image(mem_write) severity note;
			assert tb_mem_to_reg = mem_to_reg report "mem_to_reg is wrong, found = " & std_logic'image(mem_to_reg) severity note;
			assert tb_reg_dest = reg_dest report "reg_dest is wrong, found = " & std_logic'image(reg_dest) severity note;
			assert tb_reg_write = reg_write report "reg_write is wrong, found = " & std_logic'image(reg_write) severity note;
			assert tb_alu_op = alu_op report "alu_op is wrong, found = " & integer'image(to_integer(unsigned(alu_op))) severity note;
			assert tb_alu_src = alu_src report "alu_src is wrong, found = " & std_logic'image(alu_src) severity note;
			assert tb_branch = branch report "branch is wrong, found = " & std_logic'image(branch) severity note;
			assert tb_shift = shift report "shift is wrong, found = " & std_logic'image(shift) severity note;
			assert tb_pc_mux = pc_mux report "pc_mux is wrong, found = " & std_logic'image(pc_mux) severity note;
			assert tb_jump = jump report "jump is wrong, found = " & std_logic'image(jump) severity note;
			wait for 0.5*clkperiod;
			
		end Checklist;
 	
	begin 
		
		-- Disable processor
		wait for clkperiod;
		processor_enable <= '0';
		
		-- Enable processor
		wait for clkperiod;
		processor_enable <= '1';
		
		-- Load/Store instructions	
		opcode <= lw;	
		
		wait for clkperiod; 
		-- mem_write, mem_to_reg, reg_dest, reg_write, alu_op, alu_src, branch, shift, pc_mux, jump
		Checklist('0', '1', '0', '1', "00", '1', '0', '0', '0', '0');
		 
		-- mem_write, mem_to_reg, reg_dest, reg_write, alu_op, alu_src, branch, shift, pc_mux, jump
		Checklist('0', '1', '0', '1', "00", '1', '0', '0', '1', '0');
		
		-- Store instruction
		opcode <= sw;
		
		wait for clkperiod; 
		-- mem_write, mem_to_reg, reg_dest, reg_write, alu_op, alu_src, branch, shift, pc_mux, jump
		Checklist('1', '0', '0', '0', "00", '1', '0', '0', '0', '0');
		 
		-- mem_write, mem_to_reg, reg_dest, reg_write, alu_op, alu_src, branch, shift, pc_mux, jump
		Checklist('1', '0', '0', '0', "00", '1', '0', '0', '1', '0');
		
		-- Beg instruction  
		opcode <= beq;
		
		wait for clkperiod; 
		-- mem_write, mem_to_reg, reg_dest, reg_write, alu_op, alu_src, branch, shift, pc_mux, jump
		Checklist('0', '0', '0', '0', "01", '0', '1', '0', '1', '0');
		
		-- Beg instruction  
		opcode <= jtype;
		
		wait for clkperiod; 
		-- mem_write, mem_to_reg, reg_dest, reg_write, alu_op, alu_src, branch, shift, pc_mux, jump
		Checklist('0', '0', '0', '0', "00", '0', '0', '0', '1', '1');
		
		-- Register instructions
		opcode <= rtype;
		
		wait for clkperiod; 
		-- mem_write, mem_to_reg, reg_dest, reg_write, alu_op, alu_src, branch, shift, pc_mux, jump
		Checklist('0', '0', '1', '1', "10", '0', '0', '0', '1', '0');
		
		-- LUI instrucion
		opcode <= lui;
		
		wait for clkperiod; 
		-- mem_write, mem_to_reg, reg_dest, reg_write, alu_op, alu_src, branch, shift, pc_mux, jump
		Checklist('0', '0', '0', '1', "00", '1', '0', '1', '1', '0');
		
		-- LUI instrucion
		opcode <= lui;
		
		-- Disable processor
		wait for clkperiod;
		processor_enable <= '0';
		
		
		-- Enable processor
		wait for clkperiod;
		processor_enable <= '1';
		
		-- Store instruction 
		opcode <= sw;
		
		-- Disable processor
		wait for 2*clkperiod;
		processor_enable <= '0';
		
		wait for 2*clkperiod;
		
		-- END SIMULATION
		assert false report"END SIM" severity failure;
		
	end process;
	
end architecture;