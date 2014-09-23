----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:09:32 09/23/2014 
-- Design Name: 
-- Module Name:    DualPortMem - Behavioral 
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

entity DualPortMem is

	generic (
				ADDR_WIDTH : integer := 32;	
				DATA_WIDTH : integer := 8;
				size : natural := 8);

	Port ( 
				clka : in  std_logic;
				clkb : in  std_logic;
				wea : in  std_logic;
				dina : in  std_logic;
				addra : in  std_logic;
				douta : out  std_logic;
				web : in  std_logic;
				addrb : in  std_logic;
				dinb : in  std_logic;
				doutb : out  std_logic);
end DualPortMem;

architecture Behavioral of DualPortMem is

	type mem_type is array(size-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
	
begin

	

	mema: process(clka)
	variable mem : mem_type := (others => (others => '0'));
	begin
	

		if(rising_edge(clka)) then
			
		end if;

		
	end process;
	
	memb: process(clkb)
	begin
	

		if(rising_edge(clkb)) then
			
		end if;

		
	end process;

end Behavioral;

