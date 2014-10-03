library ieee;
use ieee.std_logic_1164.all;

entity alu_op_decode is
	port (	-- Input
			clk : in std_logic;
			opcode : in std_logic_vector(5 downto 0);
			-- Output
			alu_op : out std_logic_vector(1 downto 0));
end entity;

architecture arch of alu_op_decode is		   
begin	 
	
	-- Circuit
	alu_op(0) <= not opcode(5);	
	alu_op(1) <= opcode(5) and not(opcode(1) and opcode(0));
	
	-- For testbench
	-- process (clk)
	-- begin	
		
	-- end process;
	
end architecture;