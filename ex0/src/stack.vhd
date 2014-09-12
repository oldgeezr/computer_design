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

  -- Fill in type and signal declarations here.

	--signal stack_mem : mem_type;
	signal empty : std_logic := '1';
	signal full : std_logic := '0';
	signal stack_ptr : integer := 0;

begin  -- architecture behavioural
	--PUSH
	PUSH_POP : process(clk, rst, value_in, push, pop, stack_ptr) 
	
	type mem_type is array (size-1 downto 0) of operand_t;
	variable stack_mem : mem_type := (others => (others => '0'));
	
	begin
		if (rst = '1') then
			stack_mem := (others => (others => '0'));
			empty <= '1';
			full <= '0';
			stack_ptr <= 0;
			top <= (others => '0');
		else
		
		if (rising_edge(clk)) then
				if (push = '1' and full = '0') then
					stack_ptr <= stack_ptr + 1;
					stack_mem(stack_ptr) := value_in;
					top <= stack_mem(stack_ptr);
					if (stack_ptr = size-1) then
						full <= '1';
						empty <= '0';
					elsif (stack_ptr = 0) then
						full <= '0';
						empty <= '1';
					else 
						full <= '0';
						empty <= '0';
					end if;
				end if;
				if (pop = '1' and empty = '0') then
					stack_ptr <= stack_ptr - 1;
					top <= stack_mem(stack_ptr-1);
					stack_mem(stack_ptr-1) := (others => '0');
					if (stack_ptr = size-1) then
						full <= '1';
						empty <= '0';
					elsif (stack_ptr = 1) then
						full <= '0';
						empty <= '1';
						top <= (others => '0');
					else 
						full <= '0';
						empty <= '0';
					end if;
				end if;
			end if;
		end if;
		if (falling_edge(clk)) then
			top <= (others => '0');
		end if;
	end process;

end architecture behavioural;
