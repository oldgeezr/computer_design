--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:39:51 09/30/2014
-- Design Name:   
-- Module Name:   /opt/dmlab/home/victoriv/exercise1/registerfile_tb.vhd
-- Project Name:  exercise1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: registerfile
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
 
ENTITY registerfile_tb IS
END registerfile_tb;
 
ARCHITECTURE behavior OF registerfile_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT registerfile
    PORT(
         clk : IN  std_logic;
         reg_write : IN  std_logic;
         read_reg_1 : IN  std_logic_vector(4 downto 0);
         read_reg_2 : IN  std_logic_vector(4 downto 0);
         write_reg : IN  std_logic_vector(4 downto 0);
         write_data : IN  std_logic_vector(31 downto 0);
         read_data_1 : OUT  std_logic_vector(31 downto 0);
         read_data_2 : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reg_write : std_logic := '0';
   signal read_reg_1 : std_logic_vector(4 downto 0) := (others => '0');
   signal read_reg_2 : std_logic_vector(4 downto 0) := (others => '0');
   signal write_reg : std_logic_vector(4 downto 0) := (others => '0');
   signal write_data : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal read_data_1 : std_logic_vector(31 downto 0);
   signal read_data_2 : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: registerfile PORT MAP (
          clk => clk,
          reg_write => reg_write,
          read_reg_1 => read_reg_1,
          read_reg_2 => read_reg_2,
          write_reg => write_reg,
          write_data => write_data,
          read_data_1 => read_data_1,
          read_data_2 => read_data_2
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
		
		wait for clk_period;
		write_data <= x"AAAAAAAA";
		write_reg <= "10101";
		reg_write <= '1';
		read_reg_1 <= "10101";
      wait for clk_period;
		assert(read_data_1 = x"AAAAAAAA") report "Write/read test 1 failed" severity note;
		report "Write/read test 1 passed" severity note;
		
		wait for clk_period;
		write_data <= x"BBBBBBBB";
		write_reg <= "10111";
		reg_write <= '1';
		read_reg_2 <= "10111";
      wait for clk_period;
		assert(read_data_2 = x"BBBBBBBB") report "Write/read test 2 failed" severity note;
		report "Write/read test 2 passed" severity note;
		
		wait for clk_period;
		write_data <= x"CCCCCCCC";
		write_reg <= "10111";
		reg_write <= '0';
		read_reg_2 <= "10111";
      wait for clk_period;
		assert(read_data_2 = x"BBBBBBBB") report "Non-write test 1 failed" severity note;
		report "Non-write test 1 passed" severity note;
		
		wait for clk_period;
		write_data <= x"CCCCCCCC";
		write_reg <= "11111";
		reg_write <= '1';
		read_reg_1 <= "11111";
		read_reg_2 <= "11111";
      wait for clk_period;
		assert(read_data_1 = x"CCCCCCCC" and read_data_2 = x"CCCCCCCC") report "Dual read test 1 failed" severity note;
		report "Dual read test 1 passed" severity note;
		
		assert false report "Testbench finished" severity failure;
		
		
	wait;
   end process stim_proc;

END;
