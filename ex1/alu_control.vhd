library ieee;
use ieee.std_logic_1164.all;

entity alu_control is
	port (	-- Input
			alu_op : in std_logic_vector(1 downto 0);
			funct : in std_logic_vector(5 downto 0);
			-- Output
			alu_ctrl : out std_logic_vector(3 downto 0));
end entity;

architecture arch of alu_control is		
begin	 	   
	
	-- Circuit
	alu_ctrl(0) <= alu_op(1) and (funct(3) or funct(0));
	alu_ctrl(1) <= not alu_op(1) or not funct(2);
	alu_ctrl(2) <= alu_op(0) or (alu_op(1) and funct(1));
	alu_ctrl(3) <= alu_op(0) and not alu_op(0);
	
end architecture;