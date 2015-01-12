--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:11:46 11/12/2014
-- Design Name:   
-- Module Name:   /opt/dmlab/home/erlenhes/computer_design/pipeline/hazard_detection_unit_tb.vhd
-- Project Name:  pipeline
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: hazard_detection_unit
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
 
ENTITY hazard_detection_unit_tb IS
END hazard_detection_unit_tb;
 
ARCHITECTURE behavior OF hazard_detection_unit_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT hazard_detection_unit
    PORT(
         id_ex_mem_read : IN  std_logic;
         if_id_rs : IN  std_logic_vector(4 downto 0);
         if_id_rt : IN  std_logic_vector(4 downto 0);
         id_ex_rt : IN  std_logic_vector(4 downto 0);
         pc_write : OUT  std_logic;
         if_id_write : OUT  std_logic;
         stall : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
	signal clk : std_logic := '0';
   signal id_ex_mem_read : std_logic := '0';
   signal if_id_rs : std_logic_vector(4 downto 0) := (others => '0');
   signal if_id_rt : std_logic_vector(4 downto 0) := (others => '0');
   signal id_ex_rt : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal pc_write : std_logic;
   signal if_id_write : std_logic;
   signal stall : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: hazard_detection_unit PORT MAP (
          id_ex_mem_read => id_ex_mem_read,
          if_id_rs => if_id_rs,
          if_id_rt => if_id_rt,
          id_ex_rt => id_ex_rt,
          pc_write => pc_write,
          if_id_write => if_id_write,
          stall => stall
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
		report "Hazard Detection Unit: Testbench started...";
		
		wait for clk_period;
		id_ex_mem_read <= '1';
		id_ex_rt <= "00010";
		if_id_rs <= "00010";
		if_id_rt <= "00000";
      wait for clk_period;
		assert(stall = '1' and if_id_write = '0' and pc_write = '0') report "#1 - Test failed" severity note;
		report "#1 - Test passed" severity note;
		
		wait for clk_period;
		id_ex_mem_read <= '1';
		id_ex_rt <= "00010";
		if_id_rs <= "00100";
		if_id_rt <= "00000";
      wait for clk_period;
		assert(stall = '0' and if_id_write = '1' and pc_write = '1') report "#2 - Test failed" severity note;
		report "#2 - Test passed" severity note;
		
		wait for clk_period;
		id_ex_mem_read <= '1';
		id_ex_rt <= "01010";
		if_id_rs <= "01000";
		if_id_rt <= "01010";
      wait for clk_period;
		assert(stall = '1' and if_id_write = '0' and pc_write = '0') report "#3 - Test failed" severity note;
		report "#3 - Test passed" severity note;
		
		wait for clk_period;
		id_ex_mem_read <= '0';
		id_ex_rt <= "01010";
		if_id_rs <= "01000";
		if_id_rt <= "01010";
      wait for clk_period;
		assert(stall = '0' and if_id_write = '1' and pc_write = '1') report "#4 - Test failed" severity note;
		report "#4 - Test passed" severity note;

		wait for clk_period;
		id_ex_mem_read <= '1';
		id_ex_rt <= "00110";
		if_id_rs <= "00110";
		if_id_rt <= "00110";
      wait for clk_period;
		assert(stall = '1' and if_id_write = '0' and pc_write = '0') report "#4 - Test failed" severity note;
		report "#4 - Test passed" severity note;
		
		wait for clk_period;
		id_ex_mem_read <= '1';
		id_ex_rt <= "01001";
		if_id_rs <= "00110";
		if_id_rt <= "00110";
      wait for clk_period;
		assert(stall = '0' and if_id_write = '1' and pc_write = '1') report "#5 - Test failed" severity note;
		report "#5 - Test passed" severity note;

      wait;
   end process;

END;
