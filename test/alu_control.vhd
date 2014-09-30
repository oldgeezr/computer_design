library ieee;
use ieee.std_logic_1164.all;

entity alu_control is
	port (	-- Input
			clk : in std_logic;	
			alu_op : in std_logic_vector(1 downto 0);
			funct : in std_logic_vector(5 downto 0);
			-- Output
			alu_ctrl : out std_logic_vector(3 downto 0));
end entity;

architecture arch of alu_control is		

signal r_type_ctrl : std_logic_vector(3 downto 0);

begin	 	   
	
	-- Circuit
	r_type_ctrl(0) <= funct(3) or funct(0);	
	r_type_ctrl(1) <= (funct(3) and funct(2)) or funct(1);	
	r_type_ctrl(2) <= funct(1);
	r_type_ctrl(3) <= '0';
	  
	with alu_op select
	 	alu_ctrl <= "0010" when "00", -- LW/SW
				"0110" when "01", -- Beq
					r_type_ctrl when others; -- R-Type 
	
end architecture;