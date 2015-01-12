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
    top       : out operand_t := (others => '0'));

end entity stack;

architecture behavioural of stack is

	type mem_type is array (size-1 downto 0) of operand_t;
	signal full : std_logic := '0';
	signal empty : std_logic := '1';

begin

	--PUSH and POP process for the stack.
	PUSH_POP : process(clk ,rst)
	
	variable stack_mem : mem_type := (others => (others => '0'));
	variable stack_ptr : integer := 0; -- 1;
	
	begin

	-- Reset
	if (rst = '1') then
		stack_mem := (others => (others => '0'));
		stack_ptr := 0; -- 1;
		full <= '0';
		empty <= '1';
		top <= (others => '0');
	else

    if(rising_edge(clk)) then
	 
			--PUSH section.
			if (push = '1' and full = '0') then
			
				if (stack_ptr /= size-1) then
					stack_mem(stack_ptr) := value_in;
					top <= stack_mem(stack_ptr);
					stack_ptr := stack_ptr + 1; 
				end if;
			end if;
			
			--POP section.
			if (pop = '1' and empty = '0') then
			
				if (stack_ptr > 1) then
					stack_ptr := stack_ptr - 1;
					top <= stack_mem(stack_ptr-1);
					stack_mem(stack_ptr) := (others => '0');
				elsif (stack_ptr = 1) then
					stack_ptr := stack_ptr - 1;
					stack_mem(stack_ptr) := (others => '0');
					top <= (others => '0');
				end if;
			
			--Setting full and empty flags
			end if;
			
			if(stack_ptr = 0) then -- 1) then
					full <= '0';
					empty <= '1';
				elsif(stack_ptr = size-1) then
					full <= '1';
					empty <= '0';
				else
					full <= '0';
					empty <= '0';
			end if;	
    end if;
	end if;
	end process;-- Fill in type and signal declarations here.
end architecture behavioural;
