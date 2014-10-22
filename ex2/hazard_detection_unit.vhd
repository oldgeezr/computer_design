library ieee;
use ieee.std_logic_1164.all;

entity hazard_detection_unit is
  generic (
      DATA_WIDTH : integer := 32); -- Should probably be 5 beacuse of the register width
  port(
      id_ex_mem_write    : in std_logic; -- Think this should be std_logic and active low
      if_id_rs           : in std_logic_vector(DATA_WIDTH-1 downto 0);
      id_ex_rt           : in std_logic_vector(DATA_WIDTH-1 downto 0);
      pc_write           : out std_logic;
      if_id_write        : out std_logic;
      stall              : out std_logic);
end entity;

architecture rtl of hazard_detection_unit is
begin

end architecture;
