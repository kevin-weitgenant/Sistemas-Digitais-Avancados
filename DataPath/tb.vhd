-- TRABALHO DE SDA : Testbenches
-- Heitor Matozo
-- Kevin Weitgenant
-- Outubro de 2021

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.numeric_std.ALL;
USE std.textio.ALL;

ENTITY tb IS
        GENERIC (M   : INTEGER := 32;  -- registradores de M bits
                 inB : INTEGER := 29); -- instruções de entrada com inB bits
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
				
			-- files --
			FILE inFile, outFile : text;
	
			-- functions --
			FUNCTION str_to_stdvec(inp: string) return std_logic_vector is
				variable temp: std_logic_vector(inp'range);
			begin
				for i in inp'range loop
					if (inp(i) = '1') then
						temp(i) := '1';
					elsif (inp(i) = '0') then
						temp(i) := '0';
					end if;
				end loop;
				return temp;
			END FUNCTION str_to_stdvec;
			
			
			FUNCTION stdvec_to_str(inp: std_logic_vector) return string is
				variable temp: string(inp'left+1 downto 1);
			begin
				for i in inp'reverse_range loop
					if (inp(i) = '1') then
						temp(i+1) := '1';
					elsif (inp(i) = '0') then
						temp(i+1) := '0';
					end if;
				end loop;
				return temp;
			END FUNCTION stdvec_to_str;
			
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
				
	TB : PROCESS
             -- var para leitura de arquivo --
              variable inType   : std_logic_vector(inB-1 downto 0);
              variable strType  : string(inB downto 1);
              variable lineType : line;
            
              -- var para escrita de arquivo --
              variable out1    : std_logic_vector(M-1 downto 0);
              variable strOut1 : string(M downto 1);
              variable outLine : line;
    
         BEGIN
            
          FILE_OPEN(inFile, "arquivo_entrada.txt", READ_MODE);
          FILE_OPEN(outFile, "arquivo_saida.txt", WRITE_MODE);
                
            WHILE (not endfile(inFile)) LOOP
              
                wait until (rising_edge(s_clock));
                  
                readline(inFile, lineType);
                read(lineType, strType);
                inType := str_to_stdvec(strType);  
                 
                s_c <= inType(28 downto 0);
                  
                wait until (falling_edge(s_clock));
                  
                out1 := (s_data_out);
                strOut1 := stdvec_to_str(out1);
                write(outLine, strOut1);
                writeline(outFile, outLine);
                  
             END LOOP;
            
           FILE_CLOSE(inFile);
           FILE_CLOSE(outFile);
            
           wait;
            
        END PROCESS;

END ARCHITECTURE;