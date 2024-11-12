library ieee;
use ieee.std_logic_1164.all;

entity Q07 is
  port(
    CLK, RST, DS: in std_logic;
    MS: in std_logic_vector(1 downto 0);
    X, Y, Z: in std_logic_vector(7 downto 0);
    RA, RB: out std_logic_vector(7 downto 0);
  )
end entity;

architecture comportamento of Q07 is
  signal regRA, sRB: std_logic_vector (7 downto 0);
  signal Multiplexador: std_logic_vector (7 downto 0);
  signal LD0, LD1 : std_logic;
  signal LD: std_logic_vector(1 downto 0);
begin

  process(CLK, RST)
  begin
    if(RST='1')then
      regRA<="00000000";
      regRB<="00000000";
    elsif(rising_edge(CLK))then
      
      if(LD0='1')then
      --if(LD(0)='1')then
		regRA <= Multiplexador;
	  end if;
      
      if(LD1='1')then
      --if(LD(1)='1')then
        regRB <= sRA;
      end if;

    end if;
  end process;
  
  Multiplexado <= X when MS="11" else
                  Y when MS="10" else
                  Z when MS="01" else
                  regRB;
                  
  --CODIGO USANDO O COMANDO PROCESS
  --  RESULTADO EQUIVALENTE A LINHA 
  --  ANTERIOR DE DEFINIÇÃO DO MULTIPLEXADOR
  --
  --process(X, Y, Z, sRB, MS)
  --begin 
  --  if(MS="11")then
  --    Multiplexador <= X;
  --  elsif(MS="10")then
  --    Multiplexador <= Y;
  --  elsif(MS="01")then
  --    Multiplexador <= Z;
  --  else
  --    Multiplexador <= sRB;
  --  end if;
  --end process;
  
  
  LD0 <= '1' when DS = '0' else
         '0';  
  LD1 <= '1' when DS = '1' else
         '0';
  -- LD <= "01" when DS = '0' else
  --       "10";
  
  RA <= regRA;
  RB <= regRB;

end architecture;
