library ieee;
use ieee.std_logic_1164.all;

entity TBAdd4b is
end entity;

architecture bhr of TBAdd4b is
  signal sgnA, sgnB: std_logic_vector(3 downto 0);
  signal sgnCin:     std_logic;
  
  signal sgnS:       std_logic_vector(3 downto 0);
  signal sgnCout:    std_logic;
begin

  sgnCin <= '0';
  sgnA   <= "0000", x"2"   after 10ns, "1001" after 20ns;
  sgnB   <= x"0",   "0011" after 10ns, x"A" after 20ns;

DUV: entity work.Adder4bit port map(
		A => sgnA, B    => sgnB, Cin => sgnCin,
		S => sgnS, Cout => sgnCout);

end architecture;
