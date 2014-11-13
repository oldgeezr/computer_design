library ieee;
use ieee.std_logic_1164.all;

entity forwarding_unit is
  generic (
      REG_WIDTH             : integer := 5);
  port(
      id_ex_rs              : in std_logic_vector(REG_WIDTH-1 downto 0);
      id_ex_rt              : in std_logic_vector(REG_WIDTH-1 downto 0);
      ex_mem_rd             : in std_logic_vector(REG_WIDTH-1 downto 0);
      mem_wb_rd             : in std_logic_vector(REG_WIDTH-1 downto 0);
      ex_mem_reg_write      : in std_logic;
      mem_wb_reg_write      : in std_logic;
      forward_a             : out std_logic_vector(1 downto 0);
      forward_b             : out std_logic_vector(1 downto 0));
end entity;

architecture rtl of forwarding_unit is
begin

process(id_ex_rs,id_ex_rt,ex_mem_rd,mem_wb_rd,ex_mem_reg_write,mem_wb_reg_write)

begin

forward_a <= "00";
forward_b <= "00";

  if((mem_wb_reg_write = '1') and (mem_wb_rd /= "00000")) then
    if(mem_wb_rd = id_ex_rs) then
     forward_a <= "01";
    end if;
    if(mem_wb_rd = id_ex_rt) then
     forward_b <= "01";
    end if;
  end if;

  if((ex_mem_reg_write = '1') and (ex_mem_rd /= "00000")) then
    if(ex_mem_rd = id_ex_rs) then
     forward_a <= "10";
    end if;
    if(ex_mem_rd = id_ex_rt) then
     forward_b <= "10";
    end if;
  end if;

end process;

end architecture;
