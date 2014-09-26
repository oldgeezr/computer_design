----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Design Name: 
-- Module Name:    registerfile - Behavioral 
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
use ieee.std_logic_arith.all ; 

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registerfile is

	generic (
				DATA_WIDTH : integer := 32;
				size : integer := 32
				);

	Port ( 
				clk : in  std_logic;
				reg_write : in  std_logic;
				read_reg_1 : in  std_logic_vector(4 downto 0);
				read_reg_2 : in  std_logic_vector(4 downto 0);
				write_reg : in  std_logic_vector(4 downto 0);
				write_data : in  std_logic_vector(DATA_WIDTH-1 downto 0);
				read_data_1 : out  std_logic_vector(DATA_WIDTH-1 downto 0);
				read_data_2 : out  std_logic_vector(DATA_WIDTH-1 downto 0)
				);
end registerfile;

architecture Behavioral of registerfile is

	type mem_type is array(size-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
	signal mem : mem_type := (others => (others => '0'));
begin
	write_register: process(clk)
	begin
		if(rising_edge(clk)) then
			if(reg_write = '1') then
				mem(conv_integer(unsigned(write_reg))) <= write_data;
			end if;
		end if;
	end process;

	read_register: process(clk)
	begin
		if(rising_edge(clk)) then
			read_data_1 <= mem(conv_integer(unsigned(read_reg_1)));
			read_data_2 <= mem(conv_integer(unsigned(read_reg_2)));
		end if;
	end process;
	

end Behavioral;

