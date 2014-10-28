----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Design Name:
-- Module Name:    program_counter - Behavioral
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

entity program_counter is

	generic (
				ADDR_WIDTH : integer := 8
				);

	Port (
				clk       : in  std_logic;
				reset     : in std_logic;
        enable    : in std_logic;
				addr_in   : in std_logic_vector(ADDR_WIDTH-1 downto 0);
				addr_out  : out  std_logic_vector(ADDR_WIDTH-1 downto 0)
	      );
end program_counter;

architecture Behavioral of program_counter is

	signal pc : std_logic_vector(ADDR_WIDTH-1 downto 0) := (others => '0');

begin

	addr_out <= pc;

	process(clk, reset, enable)
	begin
		if reset = '1' then
			pc <= (others => '0');
		else
			if(rising_edge(clk) and enable = '1') then
				pc <= addr_in;
			end if;
		end if;
	end process;
end Behavioral;

