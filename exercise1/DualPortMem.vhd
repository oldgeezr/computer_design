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
				DATA_WIDTH : integer := 32;
				size : integer := 2**ADDR_WIDTH );

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
	signal mem : mem_type := (others => (others => '0'));
	
begin

	mem_write: process(clka, clkb)
	begin
		if(rising_edge(clka) or rising_edge(clkb)) then
			if(wea = '1' and web = '0') then
				mem(addra) <= dina;
			elsif(web = '1' and wea = '0') then
				mem(addrb) <= dinb;
			end if;
		end if;
	end process;

	mem_reada: process(clka)
	begin
		if(rising_edge(clka)) then
			if(wea = '0') then
				douta <= mem(addra);
			end if;
		end if;
	end process;
	
	mem_readb: process(clkb)
	begin
		if(rising_edge(clkb)) then
			if(web = '0') then
				douta <= mem(addrb);
			end if;
		end if;
	end process;

end Behavioral;

