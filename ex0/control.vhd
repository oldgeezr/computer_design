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

  -- Fill in type and signal declarations here.
  
  type states is (idle, fetch, push_operand, push_result, decode, compute, pop_a, pop_b);
  signal state : states := idle;

begin  -- architecture behavioural

	process (clk, rst) 
	begin

	case state is
		when idle => 
		when fetch => 
		when push_operand => 
		when push_result => 
		when decode => 
		when compute => 
		when pop_a => 
		when pop_b => 
		when others =>
	end case;
	
	end process;
end architecture behavioural;
