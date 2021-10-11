LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY mux2pra1 IS
	GENERIC ( N	: INTEGER := 32);
	PORT ( 
	
	a,b : in std_logic_vector(0 to N-1);
	sel: IN STD_LOGIC;
	saida : OUT std_logic_vector(0 to N-1));
END mux2pra1;


ARCHITECTURE comportamento OF mux2pra1 IS

BEGIN
	
	WITH sel SELECT
		saida<= a WHEN '0',
		b WHEN OTHERS;
	
	
END comportamento;