library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity control_tb is
end entity;

architecture arch of control_tb is

  component control
    port (  -- Input
          processor_enable        : in std_logic;
          opcode i                : in std_logic_vector(5 downto 0);
          -- Output
          mem_write               : out std_logic;
          mem_read                : out std_logic;
          mem_to_reg              : out std_logic;
          reg_dst                 : out std_logic;
          reg_write               : out std_logic;
          alu_op                  : out std_logic_vector(1 downto 0);
          alu_src                 : out std_logic;
          branch                  : out std_logic;
          jump                    : out std_logic);
  end component;

  signal processor_enable         : std_logic;
  signal opcode                   : std_logic_vector(5 downto 0);
  signal mem_write                : std_logic;
  signal mem_read                 : std_logic;
  signal mem_to_reg               : std_logic;
  signal reg_dst                  : std_logic;
  signal reg_write                : std_logic;
  signal alu_op                   : std_logic_vector(1 downto 0);
  signal alu_src                  : std_logic;
  signal branch                   : std_logic;
  signal jump                     : std_logic;

  constant clkperiod              : time := 10 ns;

  -- Load/Store instructions
  signal lw                       : std_logic_vector(5 downto 0) := "100011";
  signal sw                       : std_logic_vector(5 downto 0) := "101011";
  signal lui                      : std_logic_vector(5 downto 0) := "001111";

  -- Beg instruction
  signal beq                      : std_logic_vector(5 downto 0) := "000100";

  -- Register instructions
  signal jtype                    : std_logic_vector(5 downto 0) := "000010";

  -- Register instructions
  signal rtype                    : std_logic_vector(5 downto 0) := "000000";

begin

  DUT: control port map (
    processor_enable  => processor_enable,
    opcode            => opcode,
    mem_write         => mem_write,
    mem_read          => mem_read,
    mem_to_reg        => mem_to_reg,
    reg_dst           => reg_dst,
    reg_write         => reg_write,
    alu_op            => alu_op,
    alu_src           => alu_src,
    branch            => branch,
    jump              => jump);


  test: process

    procedure Checklist(
      tb_reg_dst      : in std_logic;
      tb_alu_src      : in std_logic;
      tb_mem_to_reg   : in std_logic;
      tb_reg_write    : in std_logic;
      tb_mem_write    : in std_logic;
      tb_mem_read     : in std_logic;
      tb_branch       : in std_logic;
      tb_jump         : in std_logic;
      tb_alu_op       : in std_logic_vector(1 downto 0)) is
    begin

      wait for 0.5*clkperiod;
      if(tb_reg_dst /= '-') then
        assert tb_reg_dst = reg_dst report "reg_dest is wrong, found = " & std_logic'image(reg_dst) severity note;
      end if;
      if(tb_alu_src /= '-') then
      assert tb_alu_src = alu_src report "alu_src is wrong, found = " & std_logic'image(alu_src) severity note;
      end if;
      if(tb_mem_to_reg /= '-') then
      assert tb_mem_to_reg = mem_to_reg report "mem_to_reg is wrong, found = " & std_logic'image(mem_to_reg) severity note;
      end if;
      if(tb_reg_write /= '-') then
      assert tb_reg_write = reg_write report "reg_write is wrong, found = " & std_logic'image(reg_write) severity note;
      end if;
      if(tb_mem_write /= '-') then
      assert tb_mem_write = mem_write report "mem_write is wrong, found = " & std_logic'image(mem_write) severity note;
      end if;
      if(tb_mem_read /= '-') then
      assert tb_mem_read = mem_read report "mem_read is wrong, found = " & std_logic'image(mem_read) severity note;
      end if;
      if(tb_branch /= '-') then
      assert tb_branch = branch report "branch is wrong, found = " & std_logic'image(branch) severity note;
      end if;
      if(tb_jump /= '-') then
      assert tb_jump = jump report "jump is wrong, found = " & std_logic'image(jump) severity note;
      end if;
      if(tb_alu_op(0) /= '-') then
      assert tb_alu_op(0) = alu_op(0) report "alu_op(0) is wrong, found = " & std_logic'image(alu_op(0)) severity note;
      end if;
      if(tb_alu_op(1) /= '-') then
      assert tb_alu_op(1) = alu_op(1) report "alu_op(1) is wrong, found = " & std_logic'image(alu_op(1)) severity note;
      end if;
      wait for 0.5*clkperiod;

    end Checklist;

  begin

    -- Disable processor
    wait for clkperiod;
    processor_enable <= '0';

    -- Enable processor
    wait for clkperiod;
    processor_enable <= '1';

    -- Load/Store instructions
    opcode <= rtype;

    wait for clkperiod;
    -- reg_dst, alu_src, mem_to_reg, reg_write, mem_write, mem_read, branch, jump, alu_op
    Checklist('1', '0', '0', '1', '0', '0', '0', '0', "10");


    -- Store instruction
    opcode <= lw;

    wait for clkperiod;
    -- reg_dst, alu_src, mem_to_reg, reg_write, mem_write, mem_read, branch, jump, alu_op
    Checklist('0', '1', '1', '1', '0', '1', '0', '0', "00");


    -- Beg instruction
    opcode <= sw;

    wait for clkperiod;
    -- reg_dst, alu_src, mem_to_reg, reg_write, mem_write, mem_read, branch, jump, alu_op
    Checklist('-', '1', '-', '0', '1', '0', '0', '0', "00");

    -- J-Type instruction
    opcode <= beq;

    wait for clkperiod;
    -- reg_dst, alu_src, mem_to_reg, reg_write, mem_write, mem_read, branch, jump, alu_op
    Checklist('-', '0', '-', '0', '0', '0', '1', '0', "--");

    -- Register instructions
    opcode <= jtype;

    wait for clkperiod;
    -- reg_dst, alu_src, mem_to_reg, reg_write, mem_write, mem_read, branch, jump, alu_op
    Checklist('-', '-', '-', '0', '0', '0', '-', '1', "--");

    -- LUI instrucion
    opcode <= lui;

    wait for clkperiod;
    -- reg_dst, alu_src, mem_to_reg, reg_write, mem_write, mem_read, branch, jump, alu_op
    Checklist('0', '1', '0', '1', '0', '0', '0', '0', "11");


    -- Disable processor
    wait for clkperiod;
    processor_enable <= '0';


    -- Enable processor
    wait for clkperiod;
    processor_enable <= '1';


    wait for clkperiod;
    -- reg_dst, alu_src, mem_to_reg, reg_write, mem_write, branch, jump, alu_op
    Checklist('0', '1', '0', '1', '0', '0', '0', '0', "11");


    -- END SIMULATION
    assert false report"END SIM" severity failure;

  end process;

end architecture;
