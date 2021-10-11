LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;


use ieee.numeric_std.all;



ENTITY ULA2 IS
	GENERIC ( X	: INTEGER := 32);
	PORT ( 
	
	
	controle : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
	C,D : IN STD_LOGIC_VECTOR (0 TO X-1);
	Z_teste,N_teste: OUT STD_LOGIC;
	DATA_OUT : OUT STD_LOGIC_VECTOR (0 TO X-1));
	
	END ULA2;

	
	ARCHITECTURE comportamento OF ULA2 IS
	SIGNAL N,Z: STD_LOGIC;
	
	SIGNAL AUX_SAIDA: STD_LOGIC_VECTOR(0 TO X-1);
	
	BEGIN
	
	PROCESS (controle, C, D)
	BEGIN
	CASE controle IS
		WHEN "00" => AUX_SAIDA <= D;
		WHEN "01" => AUX_SAIDA <= NOT(C);
		WHEN "10" => AUX_SAIDA <= D(1 to X-1) & '0'  ;    
		                         
		WHEN "11" => AUX_SAIDA <= C XOR D;
	
		END CASE;
	END PROCESS;
	
	PROCESS(AUX_SAIDA)
	BEGIN
	
	if AUX_SAIDA(0) = '1' THEN   
		N<= '1';
	ELSE
		N<= '0';
	END IF;	
	if AUX_SAIDA = "00000000000000000000000000000000" THEN  -- (others => '0'
		Z <= '1';
	   ELSE
		Z <= '0';
	END IF;
	end process;
	
	DATA_OUT <=AUX_SAIDA;
	Z_teste<= Z;
	N_teste<= N;
	END comportamento;