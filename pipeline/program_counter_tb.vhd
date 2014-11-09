--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:03:22 10/03/2014
-- Design Name:   
-- Module Name:   /opt/dmlab/home/victoriv/exercise1/program_counter_tb.vhd
-- Project Name:  exercise1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: program_counter
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY program_counter_tb IS
END program_counter_tb;
 
ARCHITECTURE behavior OF program_counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT program_counter
    PORT(
			reset : IN  std_logic;
         clk : IN  std_logic;
         addr_in : IN  std_logic_vector(31 downto 0);
         addr_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
	signal reset : std_logic := '0';
   signal addr_in : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal addr_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: program_counter PORT MAP (
          clk => clk,
			 reset => reset,
          addr_in => addr_in,
          addr_out => addr_out
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      report "Testbench started...";
		
		-- Start with reset
		reset <= '1';
		wait for clk_period;
		reset <= '0';
		
		wait for clk_period;
		addr_in <= x"AAAAAAAA";
      wait for clk_period;
		assert(addr_out = x"AAAAAAAA") report "Write/read test 1 failed" severity note;
		report "Write/read test 1 passed" severity note;
		
		-- Reset test
		reset <= '1';
		wait for clk_period;
		reset <= '0';
		assert(addr_out = x"00000000") report "Reset test 1 failed" severity note;
		report "Write/read test 1 passed" severity note;
		
		assert false report "Testbench finished" severity failure;
		
		
	wait;
   end process;

END;
