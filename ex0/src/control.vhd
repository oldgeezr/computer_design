library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.defs.all;

entity control is
  
  port (
    clk : in std_logic;
    rst : in std_logic;

    -- Communication
    instruction      : in  instruction_t;
    empty            : in  std_logic;
    read_instruction : out std_logic;

    -- Stack control
    push               : out std_logic;
    pop                : out std_logic;
    stack_input_select : out stack_input_select_t;
    operand            : out operand_t;

    -- ALU control
    operand_a_wen : out std_logic;
    operand_b_wen : out std_logic;
    alu_operation : out alu_operation_t);


end entity control;

architecture behavioural of control is

	type state_type is (idle, fetch, decode, push_op, pop_b, pop_a, compute, push_result);
	signal current_state : state_type := idle; 
	signal next_state : state_type := idle;
	
	signal opcode_in : opcode_t;
	-- signal operand_in : operand_t;

begin
	opcode_in <= instruction(15 downto 8);
	-- operand_in <= instruction(7 downto 0);
	operand <= instruction(7 downto 0);

	CTRL_TRANSITION : process (current_state, empty, opcode_in)
	begin
	
		read_instruction <= '0';
		stack_input_select <= STACK_INPUT_OPERAND;
		push <= '0';
		pop <= '0';
		operand_a_wen <= '0';
		operand_b_wen <= '0';
		alu_operation <= ALU_SUB;

		case current_state is
			when idle=>
				if empty = '0' then
					next_state <= fetch;
				else
					next_state <= idle;
				end if;
			when fetch=>
				read_instruction <= '1';
				next_state <= decode;
			when decode=>
				if (opcode_in = x"00") then
					next_state <= push_op;
				else
					next_state <= pop_b;
				end if;
			when push_op=>
				push <= '1';
				-- stack_input_select <= STACK_INPUT_OPERAND;
				next_state <= idle;
			when pop_b=>
				operand_b_wen <= '1';
				pop <= '1';
				next_state <= pop_a;
			when pop_a=>
				operand_a_wen <= '1';
				pop <= '1';
				next_state <= compute;
			when compute=>
				if (opcode_in = x"01") then
					alu_operation <= ALU_ADD;
				end if;
				-- alu_operation <= ALU_SUB;
				next_state <= push_result;				
			when push_result=>
				if (opcode_in = x"01") then
					alu_operation <= ALU_ADD;
				end if;
				-- alu_operation <= ALU_SUB;
				stack_input_select <= STACK_INPUT_RESULT;
				push <= '1';
				next_state <= idle;
			when others =>
				NULL;
		end case;
			
	end process;
	
	CTRL_STATES : process(clk, rst)
	begin
	
		if (rst = '1') then 
			current_state <= idle;
		else
			if (rising_edge(clk)) then
				current_state <= next_state;
			end if;
		end if;
	end process;

end architecture behavioural;
