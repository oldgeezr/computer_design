library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.defs.all;

entity stack is
  
  generic (
    size : natural := 1024);            -- Maximum number of operands on stack

  port (
    clk       : in  std_logic;
    rst       : in  std_logic;
    value_in  : in  operand_t;
    push      : in  std_logic;
    pop       : in  std_logic;
    top       : out operand_t);

end entity stack;

architecture behavioural of stack is

	type mem_type is array (size-1 downto 0) of operand_t;
	signal stack_mem : mem_type := (others => (others => '0'));
	signal stack_ptr : integer := size-1;
	signal full, empty : std_logic := '0';

begin

	--PUSH and POP process for the stack.
	PUSH_POP : process(clk ,rst , push, pop, value_in)
	begin

    if(rising_edge(clk)) then
	--PUSH section.
	if (push = '1' and full = '0') then
		--Data pushed to the current address.
		stack_mem(stack_ptr) <= value_in; 
		if(stack_ptr /= 0) then
				stack_ptr <= stack_ptr - 1;
		end if; 
			--setting full and empty flags
		if(stack_ptr = 0) then
			full <= '1';
			empty <= '0';
		elsif(stack_ptr = size-1) then
			full <= '0';
			empty <= '1';
		else
			full <= '0';
			empty <= '0';
		end if;

	end if;
	--POP section.
	if (pop = '1' and empty = '0') then
	--Data has to be taken from the next highest address(empty descending
		if(stack_ptr /= size-1) then   
			top <= stack_mem(stack_ptr+1); 
			stack_ptr <= stack_ptr + 1;
		end if; 
		--setting full and empty flags
		if(stack_ptr = 0) then
			full <= '1';
			empty <= '0';
		elsif(stack_ptr = size-1) then
			full <= '0';
			empty <= '1';
		else
			full <= '0';
			empty <= '0';
		end if; 
			
	end if;
    end if; 
	end process;-- Fill in type and signal declarations here.

end architecture behavioural;
