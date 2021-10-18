-- TRABALHO DE SDA : Testbenches
-- Heitor Matozo
-- Kevin Weitgenant
-- Outubro de 2021

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;

ENTITY tb IS
        GENERIC (M   : INTEGER := 32;  -- registradores de M bits
                 inB : INTEGER := 32); -- instruções de entrada com inB bits
END tb;

ARCHITECTURE comportament OF tb IS

        COMPONENT DataPath IS   
                PORT (data_in : in std_logic_vector(0 TO 31);
                      clock   : in std_logic;
                      reset   : in std_logic;
                      c       : in std_logic_vector(28 DOWNTO 0);
                      data_out, r0, r1, r2, ULA1_t, ULA2_t, Muxes8pra1_UM_t, Muxes8pra1_DOIS_t, Muxes8pra1_TRES_t : out std_logic_vector(0 to 31);
                      cout, ov, N, Z : out STD_LOGIC);
        END COMPONENT;
        
        -- inputs --
        SIGNAL s_data_in : STD_LOGIC_VECTOR (0 TO 31) := (others=>'0');
        
        SIGNAL s_clock,
               s_reset   : STD_LOGIC := '0';
                         
        SIGNAL s_c       : STD_LOGIC_VECTOR (28 DOWNTO 0) := (others=>'0');
        
        -- outputs --
        SIGNAL s_data_out,
               s_r0,
               s_r1,
               s_r2,
               s_ULA1_t,
               s_ULA2_t,
					s_Muxes8pra1_UM_t,
               s_Muxes8pra1_DOIS_t,
               s_Muxes8pra1_TRES_t : STD_LOGIC_VECTOR (0 TO 31);
        
        SIGNAL s_cout,
               s_ov,
               s_N,
               s_Z : STD_LOGIC;

BEGIN
        
    Dut : DataPath PORT MAP (data_in           => s_data_in,
                             clock             => s_clock,
                             reset             => s_reset,
                             c                 => s_c,
                             data_out          => s_data_out,
                             r0                => s_r0,
                             r1                => s_r1,
                             r2                => s_r2,
                             ULA1_t            => s_ULA1_t,
                             ULA2_t            => s_ULA2_t,
                             Muxes8pra1_UM_t   => s_Muxes8pra1_UM_t,
                             Muxes8pra1_DOIS_t => s_Muxes8pra1_DOIS_t,
                             Muxes8pra1_TRES_t => s_Muxes8pra1_TRES_t,
                             cout              => s_cout,
                             ov                => s_ov,
                             N                 => s_N,
                             Z                 => s_Z);
        
    s_reset <= '0', '1' after 10 ps,
                    '0' after 20 ps;
        
    Clock : PROCESS
              BEGIN
                s_clock <= '1', '0' after 5 ps;
                wait for 10 ps;
            END PROCESS;

END ARCHITECTURE;