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
				mem_write : out std_logic;
				mem_to_reg : out std_logic;
				reg_dest : out std_logic;
				reg_write : out std_logic;
				alu_op : out std_logic_vector(1 downto 0);
				alu_src : out std_logic;
				branch : out std_logic;
				jump : out std_logic;
				pc_src : out std_logic_vector(1 downto 0);
				flush : out std_logic);
end entity;

architecture fsm of control is
begin

  mem_write <= clk;
  mem_to_reg <= clk;
  reg_dest <= clk;
  reg_write <= clk;
  alu_op <= clk & clk;
  alu_src <= clk;
  branch <= clk;
  jump <= clk;
  pc_src <= clk & clk;
  flush <= clk;

end architecture;
