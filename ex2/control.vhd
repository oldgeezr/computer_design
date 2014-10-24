library ieee;
use ieee.std_logic_1164.all;

----------------------------------------------------------------
-- Control Unit
----------------------------------------------------------------
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
				jump : out std_logic;
				shift : out std_logic;
				pc_mux : out std_logic_vector(1 downto 0));
end entity;

architecture fsm of control is		 

type state_type is (idle, fetch, execute, stall);

attribute enum_encoding : string;
attribute enum_encoding of
state_type : type is "10 00 01 11";
	
signal current_state : state_type := idle;
signal next_state : state_type; 

begin		

	fsm_state : process (clk, processor_enable)
	begin			
	
		if clk'event and clk = '1' then
		
			current_state <= idle;
		
			if processor_enable = '1' then
				current_state <= next_state;
			end if;
		end if;
	end process;	  
end architecture;
