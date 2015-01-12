library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

---------------------------------------------------

entity ALU is

port(
      data_1      : in std_logic_vector(31 downto 0);
      data_2      : in std_logic_vector(31 downto 0);
      alu_ctrl    : in std_logic_vector(3 downto 0);
      result      : out std_logic_vector(31 downto 0)
);

end ALU;

---------------------------------------------------

architecture behavioral of ALU is
begin

process(data_1,data_2,alu_ctrl)

begin

case alu_ctrl is
   when "0000" => -- AND
    result <= data_1 and data_2;
   when "0001" => -- OR
    result <= data_1 or data_2;
   when "0010" => -- ADD
    result <= data_1 + data_2;
   when "0110" => -- SUB
    result <= data_1 - data_2;
   when "0111" =>
    if (data_1 < data_2) then -- SLT
      result <= x"00000001";
    else
      result <= (others => '0');
    end if;
   when others => -- SLL (16)
    result <= data_2(15 downto 0) & x"0000";
   end case;

 end process;

end behavioral;
