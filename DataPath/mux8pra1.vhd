LIBRARY ieee;
USE ieee.std_logic_1164.all;
ENTITY mux8pra1 IS



PORT ( sel : IN STD_LOGIC_VECTOR (0 TO 2);
		entrada0,entrada1,entrada2,entrada3,entrada4,entrada5,entrada6,entrada7 : IN STD_LOGIC_VECTOR (0 TO 31);
		saida : OUT STD_LOGIC_VECTOR (0 TO 31));

		
END mux8pra1;



ARCHITECTURE comportamento OF mux8pra1 IS
BEGIN
	PROCESS (entrada0,entrada1,entrada2,entrada3,entrada4,entrada5,entrada6,entrada7, sel) -- lista de sensibilização
	BEGIN
		case sel is 
			when "000" => saida<= entrada0;
			when "001" => saida<= entrada1;
			when "010" => saida<= entrada2;
			when "011" => saida<= entrada3;
			when "100" => saida<= entrada4;
			when "101" => saida<= entrada5;
			when "110" => saida<= entrada6;
			when "111" => saida<= entrada7;
			
		END case;
	
	END PROCESS;
	
END comportamento;




