library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ALU_4bit is
  Port (
    A, B : in std_logic_vector(3 downto 0);    -- 4-bit inputs
    OP   : in std_logic_vector(2 downto 0);    -- Operation select
    Result : out std_logic_vector(3 downto 0); -- 4-bit result
    Zero   : out std_logic                     -- Zero flag
  );
end ALU_4bit;

architecture Behavioral of ALU_4bit is
begin
  process(A, B, OP)
  begin
    case OP is
      when "000" => 
        Result <= A + B;         -- Addition
      when "001" => 
        Result <= A - B;         -- Subtraction
      when "010" => 
        Result <= A and B;       -- AND
      when "011" => 
        Result <= A or B;        -- OR
      when "100" => 
        Result <= A xor B;       -- XOR
      when "101" => 
        Result <= not A;         -- NOT A
      when others => 
        Result <= "0000";        -- Default (undefined operations)
    end case;
  end process;

  -- Zero flag logic
  Zero <= '1' when Result = "0000" else '0';
end Behavioral;
