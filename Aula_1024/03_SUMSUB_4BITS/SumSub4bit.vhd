Library ieee;
use ieee.std_logic_1164.all;

entity SumSub4Bit is
  port(
    A, B: in  std_logic_vector(3 downto 0);
    Cin : in  std_logic;
    S   : out std_logic_vector(3 downto 0);
    Cout, OvFlw: out std_logic
  );
end entity;

architecture bhr of SumSub4Bit is
  signal sgnCo0_Ci1: std_logic;
  signal sgnCo1_Ci2: std_logic;
  signal sgnCo2_Ci3: std_logic;
  signal sgnCout   : std_logic;
begin

  FA0: entity work.FAdder port map(A => A(0), B =>B(0) xor Cin, Cin => Cin,        S =>S(0), Cout =>sgnCo0_Ci1);
  FA1: entity work.FAdder port map(A => A(1), B =>B(1) xor Cin, Cin => sgnCo0_Ci1, S =>S(1), Cout =>sgnCo1_Ci2);
  FA2: entity work.FAdder port map(A => A(2), B =>B(2) xor Cin, Cin => sgnCo1_Ci2, S =>S(2), Cout =>sgnCo2_Ci3);
  FA3: entity work.FAdder port map(A => A(3), B =>B(3) xor Cin, Cin => sgnCo2_Ci3, S =>S(3), Cout =>sgnCout);
  
  Cout <= sgnCout;
  OvFl <= sgnCout xor sgnCo2_Ci3;

end architecture;
