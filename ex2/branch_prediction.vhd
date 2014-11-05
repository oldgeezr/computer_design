library ieee;
use ieee.std_logic_1164.all;

entity branch_prediction is
    port ( 
		clk				: in std_logic;
		rst 			   : in std_logic;
		branch			: in std_logic;
		branch_taken	: in std_logic;
		predict 			: out std_logic
	 );
end branch_prediction;

architecture behavioral of branch_prediction is

	type state_type is (branch_taken_1, branch_taken_2, branch_not_taken_1, branch_not_taken_2);
	signal current_state : state_type := branch_taken_1; 
	signal next_state : state_type := branch_taken_1;

begin

	PREDICTION_STATES : process (current_state, branch_taken)
	begin

		case current_state is
			when branch_taken_1=>
				if branch_taken = '0' then
					next_state <= branch_taken_1; 
				else
					next_state <= branch_taken_2;
				end if;
				predict <= '1';
			when branch_taken_2=>
				if branch_taken = '0' then
					next_state <= branch_taken_1;
				else
					next_state <= branch_not_taken_1;
				end if;
				predict <= '1';
			when branch_not_taken_1=>
				if branch_taken = '0' then
					next_state <= branch_not_taken_2; 
				else
					next_state <= branch_not_taken_1;
				end if;
				predict <= '0';
			when branch_not_taken_2=>
				if branch_taken = '0' then
					next_state <= branch_taken_1;					
				else
					next_state <= branch_not_taken_1;
				end if;
				predict <= '0';
			when others =>
				NULL;
		end case;
			
	end process;
	
	STATE_CONTROL : process(clk, branch)
	begin
	
		if (rst = '1') then 
			current_state <= branch_taken_1;
		else
			if (rising_edge(clk)) then
				if(branch = '1') then
					current_state <= next_state;
				end if;
			end if;
		end if;
	end process;


end behavioral;

