library ieee;
use ieee.std_logic_1164.all;

entity control is
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
end entity;

architecture fsm of control is		 

type state_type is (fetch, execute, stall);

attribute enum_encoding : string;
attribute enum_encoding of
state_type : type is "00 01 11";
	
signal current_state, next_state : state_type; 

begin			  
	
	control_output : process (current_state, opcode)
	begin
		
		mem_read <= '0'; 
		mem_write <= '0';
		mem_to_reg <= '0'; 
		reg_dest <= '0'; 
		reg_write <= '0'; 
		alu_op <= "00";
		alu_src <= '1';
		branch <= '0';
		jump <= '0';
		
		case current_state is
			when fetch => 
				mem_read <= '1'; 
				-- alu_op <= "00";
				-- pc_source <= "00"; 
				
				next_state <= execute;
				
			when execute =>  
				-- mem_to_reg <= '0'; 
				
				case opcode is
					when "000000" => -- R-type
						alu_op <= "10";
						reg_dest <= '1'; 
						reg_write <= '1'; 
						
						next_state <= fetch;
					when "100011" => -- LW
						alu_op <= "00";
						mem_to_reg <= '1';
						alu_src <= '1';
						reg_write <= '1'; 
						mem_read <= '1'; 
						
						next_state <= stall;
					when "101011" => -- SW
						alu_op <= "00";
						alu_src <= '1';
						mem_write <= '1';
						
						next_state <= stall;
					when "000100" => -- Beq	
						branch <= '1';
						alu_op <= "01";
						-- alu_src <= '0';
						
						next_state <= fetch;
					when "000010" =>-- J-type	
						jump <= '1';
					
						next_state <= fetch;
					when others =>
						null;
				end case;
					
			when stall => 
				
				next_state <= fetch;		
			when others =>
				null;
		end case;
	end process;
	
	fsm_state : process (clk, processor_enable)
	begin		
		if processor_enable = '0' then
			current_state <= fetch;
		elsif clk'event and clk = '1' then 
			current_state <= next_state;
		end if;
	end process;	  
end architecture;