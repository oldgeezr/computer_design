library ieee;
use ieee.std_logic_1164.all;  
use ieee.numeric_std.all;

entity alu_control_tb is
end entity;

architecture arch of alu_control_tb is	 

	component alu_control
		port (	
					alu_op : in std_logic_vector(1 downto 0);
					funct : in std_logic_vector(5 downto 0);
					alu_ctrl : out std_logic_vector(3 downto 0));
	end component;	
	
	signal alu_op : std_logic_vector(1 downto 0);
	signal funct : std_logic_vector(5 downto 0);
	signal alu_ctrl : std_logic_vector(3 downto 0);
	
	constant clkperiod : time := 10 ns;	
	signal clk : std_logic;
	
	-- Load/Store instructions
	signal lwsw : std_logic_vector(1 downto 0) := "00";   
	
	-- Beg instruction
	signal beq : std_logic_vector(1 downto 0) := "01";

	-- Register instructions
	signal rtype : std_logic_vector(1 downto 0) := "10";
	
	signal dontcare : std_logic_vector(5 downto 0) := "------";
	signal add : std_logic_vector(5 downto 0) := "100000";
	signal sub : std_logic_vector(5 downto 0) := "100010";
	signal and_op : std_logic_vector(5 downto 0) := "100100";
	signal or_op : std_logic_vector(5 downto 0) := "100101";
	signal slt : std_logic_vector(5 downto 0) := "101010";
	
begin
	
	DUT: alu_control port map (
		alu_op => alu_op,
		funct => funct,
		alu_ctrl => alu_ctrl);
	
	clock : process 
	begin
		
		wait for clkperiod/2;
		clk <= '0';
		wait for clkperiod/2;
		clk <= '1';	 
		
	end process;
	
	test: process

		procedure Checklist(
			tb_alu_ctrl : in std_logic_vector(3 downto 0)) is
		begin
			wait for 0.5*clkperiod;
			assert tb_alu_ctrl = alu_ctrl report "alu_ctrl is wrong, found = " & integer'image(to_integer(unsigned(alu_ctrl))) severity note;
			wait for 0.5*clkperiod;
			
		end Checklist;
 	
	begin 
		
		wait for clkperiod;
		alu_op <= lwsw;
		funct <= dontcare;
		
		-- alu_ctrl
		Checklist("0010");
		
		alu_op <= beq;
		funct <= dontcare;
		
		-- alu_ctrl
		Checklist("0110");
		
		alu_op <= rtype;
		funct <= add;
		
		-- alu_ctrl
		Checklist("0010");
		
		alu_op <= rtype;
		funct <= sub;
		
		-- alu_ctrl
		Checklist("0110");
		
		alu_op <= rtype;
		funct <= and_op;
		
		-- alu_ctrl
		Checklist("0000");
		
		alu_op <= rtype;
		funct <= or_op;
		
		-- alu_ctrl
		Checklist("0001");
		
		alu_op <= rtype;
		funct <= slt;
		
		-- alu_ctrl
		Checklist("0111");
		
		-- END SIMULATION
		assert false report"END SIM" severity failure;
		
	end process;
	
end architecture;