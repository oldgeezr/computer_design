library ieee;
use ieee.std_logic_1164.all;

entity forwarding_unit is
  generic (
      DATA_WIDTH = 32);
  port(
      id_ex_rs              : in std_logic_vector(DATA_WIDTH-1 downto 0);
      id_ex_rt              : in std_logic_vector(DATA_WIDTH-1 downto 0);
      ex_mem_rd             : in std_logic_vector(DATA_WIDTH-1 downto 0);
      mem_wb_rd             : in std_logic_vector(DATA_WIDTH-1 downto 0);
      ex_mem_reg_write      : in std_logic;
      mem_wb_reg_write      : in std_logic;
      forward_a             : out std_logic_vector(1 downto 0);
      forward_b             : out std_logic_vector(1 downto 0));
end entity;

architecture rtl of forwarding_unit is
begin

end architecture;
