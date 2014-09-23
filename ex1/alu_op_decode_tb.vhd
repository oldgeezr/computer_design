library ieee;
use ieee.std_logic_1164.all;   
-- use ieee.std_logic_unsigned.all;
-- library work;
-- use work.all;

entity alu_op_decode_tb is
end entity;

architecture arch of alu_op_decode_tb is	 

	component alu_op_decode
		port (	clk : in std_logic;
			opcode : in std_logic_vector(5 downto 0);
			alu_op : out std_logic_vector(1 downto 0));
	end component;	
	
	signal clk : std_logic := '0';
	signal opcode : std_logic_vector(5 downto 0) := (others => '0');	
	signal alu_op : std_logic_vector(1 downto 0);
	
	constant clkperiode : time := 1 ns;	
	
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
	
	DUT: alu_op_decode port map (clk => clk, opcode => opcode, alu_op => alu_op);
	
	clock : process 
	begin
		
		wait for clkperiode/2;
		clk <= '1';
		wait for clkperiode/2;
		clk <= '0';	 
		
	end process;
	
	test: process 	
	begin 
		
		-- Load/Store instructions	
		wait for 2 ns; 
		opcode <= lw;
		
		wait for 1 ns; 
		opcode <= sw; 
		
		-- Beg instruction
		wait for 1 ns; 
		opcode <= beq;
		
		-- Register instructions
		wait for 1 ns; 
		opcode <= add;
		
		wait for 1 ns; 
		opcode <= sub;
		
		wait for 1 ns; 
		opcode <= and_op;
		
		wait for 1 ns; 
		opcode <= or_op;
		
		wait for 1 ns; 
		opcode <= set_on_less_than;
		
	end process;
				
end architecture;