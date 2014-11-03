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
				pc_src : out std_logic_vector(1 downto 0));
end entity;

architecture fsm of control is
begin

  mem_read <= '0';
  mem_write <= '0';
  mem_to_reg <= '0';
  reg_dest <= '0';
  reg_write <= '0';
  alu_op <= "00";
  alu_src <= '0';
  branch <= '0';
  jump <= '0';
  pc_src <= "00";
end architecture;
