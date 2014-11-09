library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity alu_tb is
end alu_tb;

architecture behavior of alu_tb is

	component alu
	port(
		data_1 : in std_logic_vector(31 downto 0);
		data_2 : in std_logic_vector(31 downto 0);
		alu_ctrl : in std_logic_vector(3 downto 0);
		result : out std_logic_vector(31 downto 0)
		);
	end component;
	
	signal data_1 : std_logic_vector(31 downto 0);
	signal data_2 : std_logic_vector(31 downto 0);
	signal alu_ctrl : std_logic_vector(3 downto 0);
	signal result : std_logic_vector(31 downto 0);
	
	signal clk_period : time := 10ns;
	
begin
	
	--Instantiate the unit
	DUT : alu port map (
		data_1 => data_1,
		data_2 => data_2,
		alu_ctrl => alu_ctrl,
		result => result
	);
	
	--Test process
	test : process
	begin
		report "Testbench started...";
		
		--AND test
		wait for clk_period;
		data_1 <= x"00000001";
		data_2 <= x"00000000";
		alu_ctrl <= "0000";
      wait for clk_period;
		assert(result = x"00000000") report "AND test 1 failed" severity note;
		report "AND test 1 passed" severity note;
		
		wait for clk_period;
		data_1 <= x"11111111";
		data_2 <= x"11000011";
		alu_ctrl <= "0000";
      wait for clk_period;
		assert(result = x"11000011") report "AND test 2 failed" severity note;
		report "AND test 2 passed" severity note;
		
		--OR test
		wait for clk_period;
		data_1 <= x"00000001";
		data_2 <= x"00000000";
		alu_ctrl <= "0001";
      wait for clk_period;
		assert(result = x"00000001") report "OR test 1 failed" severity note;
		report "OR test 1 passed" severity note;
		
		wait for clk_period;
		data_1 <= x"11111111";
		data_2 <= x"11000011";
		alu_ctrl <= "0001";
      wait for clk_period;
		assert(result = x"11111111") report "OR test 2 failed" severity note;
		report "OR test 2 passed" severity note;
		
		--ADD test
		wait for clk_period;
		data_1 <= std_logic_vector(to_signed(45,32));
		data_2 <= std_logic_vector(to_signed(120,32));
		alu_ctrl <= "0010";
      wait for clk_period;
		assert(result = std_logic_vector(to_signed(165,32))) report "ADD test 1 failed" severity note;
		report "ADD test 1 passed" severity note;
		
		wait for clk_period;
		data_1 <= std_logic_vector(to_signed(65547,32));
		data_2 <= std_logic_vector(to_signed(-65547,32));
		alu_ctrl <= "0010";
      wait for clk_period;
		assert(result = std_logic_vector(to_signed(0,32))) report "ADD test 2 failed" severity note;
		report "ADD test 2 passed" severity note;
		
		--SUB test
		wait for clk_period;
		data_1 <= std_logic_vector(to_signed(45,32));
		data_2 <= std_logic_vector(to_signed(120,32));
		alu_ctrl <= "0110";
      wait for clk_period;
		assert(result = std_logic_vector(to_signed(-75,32))) report "SUB test 1 failed" severity note;
		report "SUB test 1 passed" severity note;
		
		wait for clk_period;
		data_1 <= std_logic_vector(to_signed(65547,32));
		data_2 <= std_logic_vector(to_signed(65547,32));
		alu_ctrl <= "0110";
      wait for clk_period;
		assert(result = std_logic_vector(to_signed(0,32))) report "SUB test 2 failed" severity note;
		report "SUB test 2 passed" severity note;
		
		--SLT test
		wait for clk_period;
		data_1 <= std_logic_vector(to_signed(45,32));
		data_2 <= std_logic_vector(to_signed(120,32));
		alu_ctrl <= "0111";
      wait for clk_period;
		assert(result = std_logic_vector(to_signed(1,32))) report "SLT test 1 failed" severity note;
		report "SLT test 1 passed" severity note;
		
		wait for clk_period;
		data_1 <= std_logic_vector(to_signed(65547,32));
		data_2 <= std_logic_vector(to_signed(65547,32));
		alu_ctrl <= "0111";
      wait for clk_period;
		assert(result = std_logic_vector(to_signed(0,32))) report "SLT test 2 failed" severity note;
		report "SLT test 2 passed" severity note;
		
		wait for clk_period;
		data_1 <= std_logic_vector(to_signed(0,32));
		data_2 <= std_logic_vector(to_signed(6,32));
		alu_ctrl <= "1000";
      wait for clk_period;
		assert(result = std_logic_vector(to_signed(393216,32))) report "SLL test 1 failed" severity note;
		report "SLL test 1 passed" severity note;
		
		assert false report "Testbench finished" severity failure;
		
		
	wait;
   end process;

END;
		
		
	