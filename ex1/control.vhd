library ieee;
use ieee.std_logic_1164.all;

entity control is
	port (	-- Input
			clk : in std_logic;
			reset : in std_logic;
			instruction : in std_logic_vector(31 downto 0);
			-- Output
			alu_op : out std_logic_vector(1 downto 0));
end entity;

architecture fsm of control is		 

type state_type is (
	inst_fetch, 
	inst_decode_reg_fetch, 
	mem_comp, 
	execution, 
	branch_comp, 
	jump_comp, 
	mem_write, 
	mem_read, 
	reg_comp, 
	write_back);		  		
	
signal current_state : state_type; 
signal opcode : std_logic_vector(5 downto 0) := instruction(5 downto 0) ;

begin			  
	
	control_output : process (current_state, opcode)
	begin
		case current_state is
			when inst_fetch => 
				alu_op <= "00";
			when inst_decode_reg_fetch => 
				alu_op <= "00";
			when mem_comp =>	
				alu_op <= "00";
			when execution => 
				alu_op <= "00";
			when branch_comp => 
				alu_op <= "00";
			when jump_comp => 
				alu_op <= "00";
			when mem_read => 
				alu_op <= "00";
			when mem_write => 
				alu_op <= "00";
			when reg_comp =>
				alu_op <= "00";
			when write_back => 
				alu_op <= "00";
			when others =>
				null;
		end case;
	end process;
	
	fsm_state : process (clk, reset)
	begin		
		if reset = '1' then
			current_state <= inst_fetch;
		elsif clk'event and clk = '1' then 
			case current_state is
				when inst_fetch => 
					current_state <= inst_decode_reg_fetch;
				when inst_decode_reg_fetch => 
					if opcode = "000000" then -- R-type	
						current_state <= execution;
					elsif opcode = "100011" or opcode = "101011" then -- LW/SW
						current_state <= mem_comp;
					elsif opcode = "000100" then -- Beq	
						current_state <= branch_comp;
					elsif opcode = "000010" then -- J-type
						current_state <= jump_comp;
					end if;
				when mem_comp =>	
					if opcode = "100011" then -- LW
						current_state <= mem_read;
					elsif opcode = "101011" then -- SW
						current_state <= mem_write;
					end if;
				when execution => 
					current_state <= reg_comp;
				when branch_comp => 
					current_state <= inst_fetch;
				when jump_comp => 
					current_state <= inst_fetch;
				when mem_read => 
					current_state <= write_back;
				when mem_write => 
					current_state <= inst_fetch;
				when reg_comp =>
					current_state <= inst_fetch;
				when write_back => 
					current_state <= inst_fetch;
				when others =>
					null;
			end case;
		end if;
	end process;	  
end architecture;