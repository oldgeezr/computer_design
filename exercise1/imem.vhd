----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:41:34 09/23/2014 
-- Design Name: 
-- Module Name:    imem - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity imem is

	generic (
				addr_size : natural := 3);
				size : natural := 2**addr_size);
			

	port (	read_address : in  std_logic_vector(2 downto 0);
				instruction : out  std_logic_vector(31 downto 0);
				clk, rst : in STD_LOGIC);
end imem;

architecture Behavioral of imem is
	type mem_type is array(2**)
	

	imem: process(clk,reset)
	begin
	
		if(rst = '1') then
			
		else
			if(rising_edge(clk)) then
				
			end if;
		end if;
		
	end process

begin


end Behavioral;

