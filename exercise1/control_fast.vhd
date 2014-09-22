library ieee;
use ieee.std_logic_1164.all;

entity control_fast is
	port (	-- Input
			clk : in std_logic;
			reset : in std_logic;
			opcode : in std_logic_vector(5 downto 0);
			-- Output 
			pc_write_cond : out std_logic;
			pc_write : out std_logic;
			i_or_d : out std_logic;
			mem_read : out std_logic;
			mem_write : out std_logic;
			mem_to_reg : out std_logic;
			ir_write : out std_logic;
			reg_dest : out std_logic;
			reg_write : out std_logic;
			alu_src_a : out std_logic;
			alu_src_b : out std_logic_vector(1 downto 0);
			alu_op : out std_logic_vector(1 downto 0);
			pc_source : out std_logic_vector(1 downto 0));	
end entity;

architecture fsm of control_fast is		 

type state_type is (
	inst_fetch, 
	inst_decode_reg_fetch,
	execution,
	r_comp,
	mem_comp,  
	branch_comp, 
	jump_comp, 
	mem_w, 
	mem_r, 
	write_back);

attribute enum_encoding : string;
attribute enum_encoding of
state_type : type is "0000 0001 0011 0010 1000 1001 0101 1010 1100 0100";
	
signal current_state, next_state : state_type; 

begin			  
	
	control_output : process (current_state, opcode)
	begin
		
		pc_write_cond <= '0';
		pc_write <= '0'; 
		i_or_d <= '0'; 
		mem_read <= '0'; 
		mem_write <= '0';
		mem_to_reg <= '0'; 
		ir_write <= '0';
		reg_dest <= '0'; 
		reg_write <= '0'; 
		alu_src_a <= '0'; 
		alu_src_b <= "00";
		alu_op <= "00";
		pc_source <= "00";
		
		case current_state is
			when inst_fetch => 
				pc_write <= '1'; 
				-- i_or_d <= '0'; 
				mem_read <= '1'; 
				ir_write <= '1';
				-- alu_src_a <= '0'; 
				alu_src_b <= "01";
				-- alu_op <= "00";
				-- pc_source <= "00"; 
				
				next_state <= inst_decode_reg_fetch;
				
			when inst_decode_reg_fetch =>  
				-- alu_src_a <= '0'; 
				alu_src_b <= "11";
				-- alu_op <= '00';	
				
				if opcode = "000000" then -- R-type	
					next_state <= execution;
				elsif opcode = "100011" or opcode = "101011" then -- LW/SW
					next_state <= mem_comp;
				elsif opcode = "000100" then -- Beq	
					next_state <= branch_comp;
				elsif opcode = "000010" then -- J-type
					next_state <= jump_comp;
				end if;
					
			when mem_comp =>	 
				alu_src_a <= '1'; 
				alu_src_b <= "10";
				-- alu_op <= '00'; 
				
				if opcode = "100011" then -- LW
					next_state <= mem_r;
				elsif opcode = "101011" then -- SW
					next_state <= mem_w;
				end if;
					
			when execution => 
				alu_src_a <= '1'; 
				-- alu_src_b <= '00';
				alu_op <= "10";	   
				
				next_state <= r_comp;
				
			when branch_comp => 
				pc_write_cond <= '1';
				alu_src_a <= '1'; 
				-- alu_src_b <= '00';
				alu_op <= "01";
				pc_source <= "01"; 
				
				next_state <= inst_fetch;
				
			when jump_comp => 
				pc_write <= '1'; 
				pc_source <= "10"; 
				
				next_state <= inst_fetch;
				
			when mem_r => 
				i_or_d <= '1'; 
				mem_read <= '1'; 
				
				next_state <= write_back;
				
			when mem_w => 
				i_or_d <= '1'; 
				mem_write <= '1';  
				
				next_state <= inst_fetch;
				
			when r_comp =>
				-- mem_to_reg <= '0'; 
				reg_dest <= '1'; 
				reg_write <= '1';  
				
				next_state <= inst_fetch;
				
			when write_back => 
				mem_to_reg <= '1'; 
				-- reg_dest <= '0'; 
				reg_write <= '1'; 
				
				next_state <= inst_fetch;
				
			when others =>
				null;
		end case;
	end process;
	
	fsm_state : process (clk, reset)
	begin		
		if reset = '1' then
			current_state <= inst_fetch;
		elsif clk'event and clk = '1' then 
			current_state <= next_state;
		end if;
	end process;	  
end architecture;