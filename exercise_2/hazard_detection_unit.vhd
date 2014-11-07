library ieee;
use ieee.std_logic_1164.all;

entity hazard_detection_unit is
  generic (
      REG_WIDTH : integer := 5); -- Should probably be 5 beacuse of the register width
  port(
      id_ex_mem_read     : in std_logic; -- Think this should be std_logic and active low
      if_id_rs           : in std_logic_vector(REG_WIDTH-1 downto 0);
      if_id_rt           : in std_logic_vector(REG_WIDTH-1 downto 0);
      id_ex_rt           : in std_logic_vector(REG_WIDTH-1 downto 0);
      pc_write           : out std_logic;
      if_id_write        : out std_logic;
      stall              : out std_logic);
end entity;

architecture rtl of hazard_detection_unit is
begin

  process(id_ex_mem_read, if_id_rs, if_id_rt, id_ex_rt) begin

	  if (id_ex_mem_read = '1' and ((id_ex_rt = if_id_rs) or (id_ex_rt = if_id_rt))) then
		 stall <= '1';
		 if_id_write <= '0';
		 pc_write <= '0';
	  else
		 stall <= '0';
		 if_id_write <= '1';
		 pc_write <= '1';
	  end if;

end process;

end architecture;
