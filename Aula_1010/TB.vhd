Library IEEE;
use ieee.std_logic_1164.all;

entity tb is
end entity;

architecture coisalinda of tb is
  signal sgnA : std_logic;
begin

  sgnA <= '0', '1' after 15ns, '0' after 30ns, '1' after 90ns;


end architecture;
