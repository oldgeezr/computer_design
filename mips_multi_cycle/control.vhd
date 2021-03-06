library ieee;
use ieee.std_logic_1164.all;

----------------------------------------------------------------
-- Control Unit
----------------------------------------------------------------
entity control is
	port (	-- Input
				clk : in std_logic;
				processor_enable : in std_logic;
				opcode : in std_logic_vector(5 downto 0);
				-- Output
				mem_read : out std_logic;
				mem_write : out std_logic;
				mem_to_reg : out std_logic;
				reg_dest : out std_logic;
				reg_write : out std_logic;
				alu_op : out std_logic_vector(1 downto 0);
				alu_src : out std_logic;
				branch : out std_logic;
				jump : out std_logic;
				shift : out std_logic;
				pc_mux : out std_logic);
end entity;

architecture fsm of control is

type state_type is (idle, fetch, execute, stall);

attribute enum_encoding : string;
attribute enum_encoding of
state_type : type is "10 00 01 11";

signal current_state : state_type := idle;
signal next_state : state_type;

begin

	-- Generate the ALU_OP signal
	with opcode select
		alu_op <=	"10" when "000000", -- 0, R-Type
						"01" when "000100", -- 4, Beq
						"00" when others; -- 15, 35 and 43, LUI | LW | SW

	-- FSM: Setting the correct control signals
	control_output : process (current_state, opcode)
	begin

		case current_state is
			when fetch =>

				mem_read <= '0';
				mem_write <= '0';
				mem_to_reg <= '0';
				reg_dest <= '0';
				reg_write <= '0';
				-- alu_op <= '0';
				alu_src <= '0';
				branch <= '0';
				jump <= '0';
				shift <= '0';
				pc_mux <= '0';

				next_state <= execute;

			when execute =>

				mem_read <= '0';
				mem_write <= '0';
				mem_to_reg <= '0';
				reg_dest <= '0';
				reg_write <= '0';
				-- alu_op <= '0';
				alu_src <= '0';
				branch <= '0';
				jump <= '0';
				shift <= '0';
				pc_mux <= '0';

				next_state <= fetch;

				case opcode is

					when "100011" => -- LW
						mem_to_reg <= '1';
						alu_src <= '1';
						reg_write <= '1';
						-- mem_read <= '1';

						next_state <= stall;

					when "001111" => -- LUI
						alu_src <= '1';
						reg_write <= '1';
						shift <= '1';
						pc_mux <= '1';

					when "101011" => -- SW
						alu_src <= '1';
						mem_write <= '1';

						next_state <= stall;
					when "000100" => -- Beq
						branch <= '1';
						pc_mux <= '1';

					when "000010" =>-- J-type
						jump <= '1';
						pc_mux <= '1';

					when others => -- R-Type
						reg_dest <= '1';
						reg_write <= '1';
						pc_mux <= '1';

				end case;

			when stall =>

				mem_read <= '0';
				mem_write <= '0';
				mem_to_reg <= '0';
				reg_dest <= '0';
				reg_write <= '0';
				-- alu_op <= '0';
				alu_src <= '0';
				branch <= '0';
				jump <= '0';
				shift <= '0';
				pc_mux <= '1';

				if opcode = "100011" then -- LW
					mem_to_reg <= '1';
						alu_src <= '1';
						reg_write <= '1';
				else -- SW
					alu_src <= '1';
						mem_write <= '1';
				end if;

				next_state <= fetch;

			when others =>

			mem_read <= '0';
				mem_write <= '0';
				mem_to_reg <= '0';
				reg_dest <= '0';
				reg_write <= '0';
				-- alu_op <= '0';
				alu_src <= '0';
				branch <= '0';
				jump <= '0';
				shift <= '0';
				pc_mux <= '0';

				next_state <= fetch;

		end case;
	end process;

	fsm_state : process (clk, processor_enable)
	begin

		if clk'event and clk = '1' then

			current_state <= idle;

			if processor_enable = '1' then
				current_state <= next_state;
			end if;
		end if;
	end process;
end architecture;
