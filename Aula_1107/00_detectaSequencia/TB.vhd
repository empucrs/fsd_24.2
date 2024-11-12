library ieee;
use ieee.std_logic_1164.all;

entity TB is
end entity;

architecture TB of TB is
  signal sgnClk, sgnRst, sgnDin, sgnDout: std_logic;
begin

  sgnRst <= '1', '0' after 3ns;
  
  process
  begin
    sgnClk <= '0', '1' after 10ns;
    wait for 30ns;  
  end process;
  
  sgnDin <= '1', '0' after 38ns, '1' after 68 ns, '0' after 188ns, '1' after 218ns, '0' after 248ns;

  DUV: entity work.detector port map (clk=>sgnClk, rst=>sgnRst, din=>sgnDin, dout=>sgnDout);

end architecture;
