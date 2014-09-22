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
				reset : in std_logic;
				instruction : in std_logic_vector(31 downto 0);
				-- Output
				alu_op : out std_logic_vector(1 downto 0));
	end component;	
	
	signal clk, reset : std_logic := '0';
	signal instruction : std_logic_vector(31 downto 0) := (others => '0');	
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
	
	DUT: control port map (clk => clk, reset => reset, instruction => instruction, alu_op => alu_op);
	
	clock : process 
	begin
		
		wait for clkperiode/2;
		clk <= '1';
		wait for clkperiode/2;
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