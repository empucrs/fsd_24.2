Library ieee;
use ieee.std_logic_1164.all;

entity Registrador is
  port(
    -- ENTRADA E SAIDA DE DADOS
	D : in std_logic_vector(3 downto 0);
	Q, nQ : out std_logic_vector(3 downto 0);
	-- SINAIS DE CONTROLE
	clock: in std_logic;
	reset: in std_logic	
  );
end entity;

architecture comportamento of Registrador is
  signal sgnReg : std_logic_vector(3 downto 0);
begin

  process (clock, reset)
  begin
  
    if(reset='1')then
      sgnReg <= (others=>'0');
    elsif (rising_edge(clock))then
      sgnReg <= D;
    end if;
      
  end process;
  
  Q  <= sgnReg;
  nQ <= not sgnReg;

end architecture;
