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
use IEEE.NUMERIC_STD.ALL;

entity registerfile is

	generic (
				DATA_WIDTH : integer := 32;
				size : integer := 32
				
				);

	Port (
				reset : in  std_logic;
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

	type reg_type_t is array(size-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
	signal reg_file : reg_type_t;
	
begin

	read_data_1 <= reg_file(to_integer(unsigned(read_reg_1)));
	read_data_2 <= reg_file(to_integer(unsigned(read_reg_2)));

	process(clk, reset) is
	begin
		if(reset = '1') then
			reg_file <= (others => (others => '0'));
		elsif(falling_edge(clk)) then
			if(reg_write = '1') then
				reg_file(to_integer(unsigned(write_reg))) <= write_data;
			end if;
			-- Register 0 is always zero
			reg_file(0) <= (others => '0');
		end if;
	end process;
	

end Behavioral;

