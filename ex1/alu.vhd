library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

---------------------------------------------------

entity ALU is

port(	data_1:	in std_logic_vector(31 downto 0);
	data_2:	in std_logic_vector(31 downto 0);
	alu_ctrl: in std_logic_vector(3 downto 0);
	result:	out std_logic_vector(31 downto 0);
	zero: out std_ulogic
);

end ALU;

---------------------------------------------------

architecture behavioral of ALU is
begin					   

process(data_1,data_2,alu_ctrl) 

begin
    
zero <= '0';

case alu_ctrl is
	 when "0000" =>
		result <= data_1 and data_2;
	 when "0001" =>	
		result <= data_1 or data_2;
	 when "0010" =>
		result <= data_1 + data_2;
	 when "0110" =>	 
		result <= data_1 - data_2;
	 when "1000" =>
		if (data_1 < data_2) then
			result <= (others => '1');
		else
			result <= (others => '0');
			zero <= '1';
		end if;
	 when others =>	 
		result <= (others => '0');
	 end case;

 end process;

end behavioral;

----------------------------------------------------