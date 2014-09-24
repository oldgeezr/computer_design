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
				ADDR_WIDTH : integer := 8;
				DATA_WIDTH : integer := 32
				size : natural := 8);

	Port ( 
				clka : in  std_logic;
				clkb : in  std_logic;
				wea : in  std_logic;
				web : in  std_logic;
				dina : in  std_logic_vector(DATA_WIDTH-1 downto 0);
				dinb : in  std_logic_vector(DATA_WIDTH-1 downto 0);
				addra : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
				addrb : in  std_logic_vector(ADDR_WIDTH-1 downto 0);
				douta : out  std_logic_vector(DATA_WIDTH-1 downto 0);
				doutb : out  std_logic_vector(DATA_WIDTH-1 downto 0));
end DualPortMem;

architecture Behavioral of DualPortMem is

	type mem_type is array(size-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
	
begin

	

	mem: process(clka, clkb)
	variable mem : mem_type := (others => (others => '0'));
	begin
	

		if(rising_edge(clka)) then
			if(wea and !web) then
				mem(addra) = dina;
			else
				douta = mem(addra);
			end if;
			
		end if;

		if(rising_edge(clkb)) then
			if(web and !wea) then
				mem(addrb) = dinb;
			else
				doutb = mem(addrb);
			end if;
			
		end if;

		
	end process;
	

end Behavioral;

