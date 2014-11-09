library ieee;
use ieee.std_logic_1164.all;

----------------------------------------------------------------
-- Control Unit
----------------------------------------------------------------
entity control is
	port (	-- Input
				processor_enable : in std_logic;
				opcode : in std_logic_vector(5 downto 0);
				-- Output
				reg_dst : out std_logic;
				alu_src : out std_logic;
				mem_to_reg : out std_logic;
				reg_write : out std_logic;
				mem_write : out std_logic;
				mem_read : out std_logic;
				branch : out std_logic;
				jump : out std_logic;
				alu_op : out std_logic_vector(1 downto 0));
end entity;

architecture arch of control is
		signal op0 : std_logic := opcode(0);
		signal op1 : std_logic := opcode(1);
		signal op2 : std_logic := opcode(2);
		signal op3 : std_logic := opcode(3);
		-- signal op4 : std_logic; -- not used
		signal op5 : std_logic := opcode(5);
begin

	op0 <= opcode(0);
	op1 <= opcode(1);
	op2 <= opcode(2);
	op3 <= opcode(3);
	op5 <= opcode(5);
	
	reg_dst <= processor_enable and (not op2) and (not op1);
	alu_src <= processor_enable and (op5 or op3);
	mem_to_reg <= processor_enable and op5;
	reg_write <= processor_enable and ((op5 xor op3) or ((not op2) and (not op1)));
	mem_write <= processor_enable and op5 and op3;
	branch <= processor_enable and op2 and (not op1);
	jump <= processor_enable and op1 and (not op0);
	alu_op(0) <= processor_enable and op2;
	alu_op(1) <= processor_enable and (not op5);
	mem_read <= (not op3) and op5;
	
end architecture;
