--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:28:53 10/28/2014
-- Design Name:   
-- Module Name:   /opt/dmlab/home/erlenhes/computer_design/ex2/forwarding_unit_tb.vhd
-- Project Name:  ex2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: forwarding_unit
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
 
ENTITY forwarding_unit_tb IS
END forwarding_unit_tb;
 
ARCHITECTURE behavior OF forwarding_unit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT forwarding_unit
    PORT(
         id_ex_rs : IN  std_logic_vector(4 downto 0);
         id_ex_rt : IN  std_logic_vector(4 downto 0);
         ex_mem_rd : IN  std_logic_vector(4 downto 0);
         mem_wb_rd : IN  std_logic_vector(4 downto 0);
         ex_mem_reg_write : IN  std_logic;
         mem_wb_reg_write : IN  std_logic;
         forward_a : OUT  std_logic_vector(1 downto 0);
         forward_b : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal id_ex_rs : std_logic_vector(4 downto 0) := (others => '0');
   signal id_ex_rt : std_logic_vector(4 downto 0) := (others => '0');
   signal ex_mem_rd : std_logic_vector(4 downto 0) := (others => '0');
   signal mem_wb_rd : std_logic_vector(4 downto 0) := (others => '0');
   signal ex_mem_reg_write : std_logic := '0';
   signal mem_wb_reg_write : std_logic := '0';

 	--Outputs
   signal forward_a : std_logic_vector(1 downto 0);
   signal forward_b : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
	-- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: forwarding_unit PORT MAP (
          id_ex_rs => id_ex_rs,
          id_ex_rt => id_ex_rt,
          ex_mem_rd => ex_mem_rd,
          mem_wb_rd => mem_wb_rd,
          ex_mem_reg_write => ex_mem_reg_write,
          mem_wb_reg_write => mem_wb_reg_write,
          forward_a => forward_a,
          forward_b => forward_b
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
      report "Forwarding Unit: Testbench started...";
		
		--#1 Type 1a : 
		wait for clk_period;
		id_ex_rs <= "00011";
      ex_mem_rd <= "00011";
		ex_mem_reg_write <= '1';
      wait for clk_period;
		assert(forward_a = "10") report "#1 - Type 1a test failed" severity note;
		report "#1 - Type 1a test passed" severity note;
		
		--#2 Type 1a : 
		wait for clk_period;
		id_ex_rs <= "11111";
      ex_mem_rd <= "11111";
		ex_mem_reg_write <= '0';
      wait for clk_period;
		assert(forward_a = "00") report "#2 - Type 1a test failed" severity note;
		report "#2 - Type 1a test passed" severity note;
		
		--#3 Type 1a : 
		wait for clk_period;
		id_ex_rs <= "11001";
      ex_mem_rd <= "11111";
		ex_mem_reg_write <= '1';
      wait for clk_period;
		assert(forward_a = "00") report "#3 - Type 1a test failed" severity note;
		report "#3 - Type 1a test passed" severity note;
		
		--#4 Type 1a : 
		wait for clk_period;
		id_ex_rs <= "11001";
      ex_mem_rd <= "00000";
		ex_mem_reg_write <= '1';
      wait for clk_period;
		assert(forward_a = "00") report "#4 - Type 1a test failed" severity note;
		report "#4 - Type 1a test passed" severity note;
		
		--#1 Type 1b : 
		wait for clk_period;
		id_ex_rs <= "00000";
		id_ex_rt <= "00011";
      ex_mem_rd <= "00011";
		ex_mem_reg_write <= '1';
      wait for clk_period;
		assert(forward_b = "10") report "#1 - Type 1b test failed" severity note;
		report "#1 - Type 1b test passed" severity note;
		
		--#2 Type 1b : 
		wait for clk_period;
		id_ex_rt <= "11111";
      ex_mem_rd <= "11111";
		ex_mem_reg_write <= '0';
      wait for clk_period;
		assert(forward_b = "00") report "#2 - Type 1b test failed" severity note;
		report "#2 - Type 1b test passed" severity note;
		
		--#3 Type 1b : 
		wait for clk_period;
		id_ex_rt <= "11001";
      ex_mem_rd <= "11111";
		ex_mem_reg_write <= '1';
      wait for clk_period;
		assert(forward_b = "00") report "#3 - Type 1b test failed" severity note;
		report "#3 - Type 1b test passed" severity note;
		
		--#4 Type 1b : 
		wait for clk_period;
		id_ex_rt <= "11001";
      ex_mem_rd <= "11001";
		ex_mem_reg_write <= '1';
      wait for clk_period;
		assert(forward_b = "10") report "#4 - Type 1b test failed" severity note;
		report "#4 - Type 1b test passed" severity note;
		
		--#1 Type 2a : 
		wait for clk_period;
		id_ex_rt <= "00000";
      ex_mem_rd <= "00000";
		ex_mem_reg_write <= '0';
		id_ex_rs <= "00100";
      mem_wb_rd <= "00100";
		mem_wb_reg_write <= '1';
      wait for clk_period;
		assert(forward_a = "01") report "#1 - Type 2a test failed" severity note;
		report "#1 - Type 2a test passed" severity note;
		
		--#2 Type 2a : 
		wait for clk_period;
		id_ex_rs <= "00011";
      mem_wb_rd <= "00011";
		mem_wb_reg_write <= '0';
      wait for clk_period;
		assert(forward_a = "00") report "#2 - Type 2a test failed" severity note;
		report "#2 - Type 2a test passed" severity note;
		
		--#3 Type 2a : 
		wait for clk_period;
		id_ex_rs <= "01011";
      mem_wb_rd <= "00011";
		mem_wb_reg_write <= '1';
      wait for clk_period;
		assert(forward_a = "00") report "#3 - Type 2a test failed" severity note;
		report "#3 - Type 2a test passed" severity note;
		
		--#4 Type 2a : 
		wait for clk_period;
		id_ex_rs <= "01011";
      mem_wb_rd <= "01011";
		mem_wb_reg_write <= '1';
      wait for clk_period;
		assert(forward_a = "01") report "#4 - Type 2a test failed" severity note;
		report "#4 - Type 2a test passed" severity note;
		
		--#1 Type 2b :
		wait for clk_period;
		id_ex_rs <= "00000";
		id_ex_rt <= "11011";
      mem_wb_rd <= "11011";
		mem_wb_reg_write <= '1';
      wait for clk_period;
		assert(forward_b = "01") report "#1 - Type 2b test failed" severity note;
		report "#1 - Type 2b test passed" severity note;
		
		--#2 Type 2b :
		wait for clk_period;
		id_ex_rt <= "10011";
      mem_wb_rd <= "11011";
		mem_wb_reg_write <= '1';
      wait for clk_period;
		assert(forward_b = "00") report "#2 - Type 2b test failed" severity note;
		report "#2 - Type 2b test passed" severity note;
		
		--#3 Type 2b :
		wait for clk_period;
		id_ex_rt <= "11010";
      mem_wb_rd <= "11010";
		mem_wb_reg_write <= '0';
      wait for clk_period;
		assert(forward_b = "00") report "#3 - Type 2b test failed" severity note;
		report "#3 - Type 2b test passed" severity note;
		
		--#1 Type 2b :
		wait for clk_period;
		id_ex_rt <= "00100";
      mem_wb_rd <= "00100";
		mem_wb_reg_write <= '1';
      wait for clk_period;
		assert(forward_b = "01") report "#4 - Type 2b test failed" severity note;
		report "#4 - Type 2b test passed" severity note;
		
      wait;
   end process;

END;
