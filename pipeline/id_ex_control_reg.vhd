library ieee;
use ieee.std_logic_1164.all;

entity id_ex_control_reg is
  port (
    clk             : in std_logic;
    reset           : in std_logic;
    reg_dest_in     : in std_logic;
    reg_dest_out    : out std_logic;
    alu_src_in      : in std_logic;
    alu_src_out     : out std_logic;
    alu_op_in       : in std_logic_vector(1 downto 0);
    alu_op_out      : out std_logic_vector(1 downto 0)
  );
end entity;

architecture rtl of id_ex_control_reg is

  signal reg_dest  : std_logic := '0';
  signal alu_src   : std_logic := '0';
  signal alu_op    : std_logic_vector(1 downto 0) := "00";

begin

  reg_dest_out <= reg_dest;
  alu_src_out  <= alu_src;
  alu_op_out   <= alu_op;

  process (clk, reset, reg_dest_in, alu_src_in, alu_op_in) is
  begin
    if reset = '1' then
      reg_dest <= '0';
      alu_src  <= '0';
      alu_op   <= "00";
    else
      if rising_edge(clk) then
        reg_dest <= reg_dest_in;
        alu_src  <= alu_src_in;
        alu_op   <= alu_op_in;
      end if;
    end if;
  end process;

end architecture;
