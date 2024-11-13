library ieee;
use ieee.std_logic_1164.all;

entity Q14 is
    port(   
        clock, reset, inA, inB: in std_logic;
        found: out std_logic;
    );
end entity;

architecture bhv of Q14 is
  type stateA is (sStart, s0, s01, s011, s0110);
  type stateB is (sStart, s1, s11, s110, s1101, s11011);

  signal EA_A, PE_A: stateA;
  signal EA_B, PE_B: stateB;

begin

    //PROCESSO EA_A 
    process(clock, reset)
    begin
        if(reset = '1') then
            EA_A <= s0;
        elsif(rising_edge(clock)) then
            EA_A <= PE_A;
        end if;
    end process;

    //PROCESSO CALCULO DE PROXIMO ESTADO PE_A
    process(EA_A, inA)
    begin
        case EA_A is
            when sStart =>
                if(inA = '1') then
                    PE_A <= sStart;
                else
                    PE_A <= s0;
                end if;
            when s0 =>
                if(inA = '1') then
                    PE_A <= s01;
                else
                    PE_A <= s0;
                end if;
            when s01 =>
                if(inA = '1') then
                    PE_A <= s011;
                else
                    PE_A <= s0;
                end if;
            when s011 =>
                if(inA = '1') then
                    PE_A <= sStart;
                else    
                    PE_A <= s0110;
                end if;
            when s0110 =>
                if(inA = '1) then   
                    PE_A <= s01;
                else    
                    PE_A <= s0;
                end if;
        end case;
    end process

    //PROCESSO EA_B
    process(clock, reset)
    begin
        if(reset = '1') then
            EA_B <= sStart;
        elsif (rising_edge(clock)) then
            EA_B <= PE_B;
        end if;
    end process;

    //PROCESSO CALCULO DE PROXIMO ESTADO PE_B
    process(EA_B, inB)
    begin
        --type stateB is (sStart, s1, s11, s110, s1101, s11011);
        case EA_B is
            when sStart =>
                if(inB = '1') then
                    PE_B <= s1;
                else
                    PE_B <= sStart;
                end if;
            when s1 =>
                if(inB = '1') then
                    PE_B <= s11;
                else
                    PE_B <= sStart;
                end if;
            when s11 =>
                if(inB = '1') then
                    PE_B <= s11;
                else    
                    PE_B <= s110;
                end if;
            when s110 =>
                if(inB = '1') then
                    PE_B <= s1101;
                else
                    PE_B <= sStart;
                end if;
            when s1101 =>
                if(inB = '1') then
                    PE_B <= s11011;
                else    
                    PE_B <= s110;
                end if;
            when s11011 =>
                if(inB = '1') then
                    PE_B <= s11;
                else
                    PE_B <= sStart;
                end if;
        end case;
    end process;

    //PROCESSO SAIDA
    process(EA_A, EA_B)
    begin
        if(EA_A = s0110 and EA_B = s11011) then
            found <= '1';
        else
            found <= '0';
        end if;
    end process;

    // FORMA ALTERNATIVA DE ESCREVER O PROCESSO DE SAIDA
    -- found <= '1' when (EA_A = s0110 and EA_B = s11011) else '0';

end architecture;