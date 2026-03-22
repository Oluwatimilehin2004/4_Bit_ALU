library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ALU_4bit_tb is
end ALU_4bit_tb;

architecture Behavioral of ALU_4bit_tb is
  -- Component declaration for the ALU
  component ALU_4bit
    Port (
      A, B   : in std_logic_vector(3 downto 0);    -- 4-bit inputs
      OP     : in std_logic_vector(2 downto 0);    -- Operation select
      Result : out std_logic_vector(3 downto 0);   -- 4-bit result
      Zero   : out std_logic                       -- Zero flag
    );
  end component;

  -- Signals for testbench
  signal A, B, Result : std_logic_vector(3 downto 0);
  signal OP           : std_logic_vector(2 downto 0);
  signal Zero         : std_logic;

  -- Constants for test cases
  type test_vector is record
    A, B, OP, Expected_Result : std_logic_vector(3 downto 0);
    Expected_Zero             : std_logic;
    Test_Name                 : string(1 to 50);
  end record;

  type test_vector_array is array (natural range <>) of test_vector;
  constant TEST_VECTORS : test_vector_array := (
    -- Test Case: A, B, OP, Expected Result, Expected Zero, Test Name
    ("0011", "0001", "000", "0100", '0', "Addition: 3 + 1 = 4                  "),
    ("0100", "0010", "001", "0010", '0', "Subtraction: 4 - 2 = 2               "),
    ("1100", "1010", "010", "1000", '0', "AND: 1100 AND 1010 = 1000            "),
    ("1100", "1010", "011", "1110", '0', "OR: 1100 OR 1010 = 1110              "),
    ("1100", "1010", "100", "0110", '0', "XOR: 1100 XOR 1010 = 0110            "),
    ("1100", "0000", "101", "0011", '0', "NOT: NOT 1100 = 0011                 "),
    ("0010", "0010", "001", "0000", '1', "Zero flag: 2 - 2 = 0                 "),
    ("1111", "0001", "000", "0000", '1', "Addition overflow: 15 + 1 = 0 (4-bit)"),
    ("1010", "0101", "110", "0000", '1', "Default operation: OP = 110           ")
  );

  -- Procedure to apply and verify a test case
  procedure apply_test (
    constant A_in, B_in, OP_in, Exp_Result : in std_logic_vector(3 downto 0);
    constant Exp_Zero : in std_logic;
    constant Test_Name : in string
  ) is
  begin
    A <= A_in; B <= B_in; OP <= OP_in;
    wait for 5 ns; -- Reduced delay for faster simulation
    assert Result = Exp_Result and Zero = Exp_Zero
      report "Test failed: " & Test_Name & 
             " | Expected Result=" & to_string(Exp_Result) & ", Zero=" & to_string(Exp_Zero) & 
             " | Got Result=" & to_string(Result) & ", Zero=" & to_string(Zero)
      severity error;
    report "Test passed: " & Test_Name;
  end procedure;

begin
  -- Instantiate the ALU
  uut: ALU_4bit
    Port map (
      A => A,
      B => B,
      OP => OP,
      Result => Result,
      Zero => Zero
    );

  -- Stimulus process
  stim_proc: process
    variable pass_count : integer := 0;
    variable fail_count : integer := 0;
  begin
    -- Initialize inputs
    A <= "0000"; B <= "0000"; OP <= "000";
    wait for 5 ns;
    report "Starting ALU simulation...";

    -- Run test cases
    for i in TEST_VECTORS'range loop
      apply_test(
        TEST_VECTORS(i).A,
        TEST_VECTORS(i).B,
        TEST_VECTORS(i).OP,
        TEST_VECTORS(i).Expected_Result,
        TEST_VECTORS(i).Expected_Zero,
        TEST_VECTORS(i).Test_Name
      );
      if Result = TEST_VECTORS(i).Expected_Result and Zero = TEST_VECTORS(i).Expected_Zero then
        pass_count := pass_count + 1;
      else
        fail_count := fail_count + 1;
      end if;
    end loop;

    -- Summary report
    report "Simulation completed: " & integer'image(pass_count) & " tests passed, " & 
           integer'image(fail_count) & " tests failed" severity note;
    
    wait; -- End simulation
  end process;
end Behavioral;
