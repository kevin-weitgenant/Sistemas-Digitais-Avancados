library IEEE;
use ieee.std_logic_1164.all;


entity DataPath is
port(


data_in : in std_logic_vector(0 to 31);
clock : in std_logic;
reset : in std_logic;
c : in std_logic_vector(28 DOWNTO 0 );
data_out,r0,r1,r2,ULA1_t,ULA2_t,Muxes8pra1_UM_t,Muxes8pra1_DOIS_t,Muxes8pra1_TRES_t : out std_logic_vector(0 to 31);

cout,ov,N,Z : out STD_LOGIC);




end DataPath;




architecture comportamento of DataPath is 

COMPONENT mux2pra1 IS
	GENERIC ( N	: INTEGER := 32);
	PORT ( 
	
	a,b : in std_logic_vector(0 to N-1);
	sel: IN STD_LOGIC;
	saida : OUT std_logic_vector(0 to N-1));
END COMPONENT;


COMPONENT registerNbits IS 
GENERIC ( N	: INTEGER := 32);
PORT(
    
	 d   : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
    ld  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) -- output
);
END COMPONENT;


COMPONENT mux8pra1 IS

PORT ( sel : IN STD_LOGIC_VECTOR (0 TO 2);
		entrada0,entrada1,entrada2,entrada3,entrada4,entrada5,entrada6,entrada7 : IN STD_LOGIC_VECTOR (0 TO 31);
		saida : OUT STD_LOGIC_VECTOR (0 TO 31));

		
END COMPONENT;


COMPONENT ULA1 IS
	GENERIC ( N	: INTEGER := 32);
	PORT ( 
	controle : IN STD_LOGIC_VECTOR (0 TO 1);
	A,B : IN STD_LOGIC_VECTOR (0 TO N-1);
	cout_teste,ov_teste:OUT STD_LOGIC;  
	D : OUT STD_LOGIC_VECTOR (0 TO N-1));
	
	END COMPONENT;
	
COMPONENT ULA2 IS
	GENERIC ( X	: INTEGER := 32);
	PORT ( 
	
	controle : IN STD_LOGIC_VECTOR (0 TO 1);
	C,D : IN STD_LOGIC_VECTOR (0 TO X-1);
	Z_teste,N_teste: OUT STD_LOGIC;
	DATA_OUT : OUT STD_LOGIC_VECTOR (0 TO X-1));
	
	END COMPONENT;


	
type novoTipo is array (0 to 7) of std_logic_vector(0 TO 31);
signal saida_mux2pra1,saida_registrador: novoTipo;

signal DATA_OUT_sinal,   saida_mux8pra1_UM,  saida_mux8pra1_DOIS, saida_mux8pra1_TRES,saida_ULA1: std_logic_vector(0 to 31);
	
	
signal cout_s,ov_S,N_s,Z_s: STD_LOGIC;
	
	
BEGIN





G1_LINHA:  FOR i IN 0 TO 7 GENERATE	
	  

	  BEGIN
	  
		Muxes2pra1: mux2pra1 PORT MAP (
			data_in,DATA_OUT_sinal,c(i), saida_mux2pra1(i));  -- como fazer isso? usar 2 generate?
	  END GENERATE;



		  
G2:  FOR i IN 0 TO 7 GENERATE
		
		Registradores: registerNbits PORT MAP (
		saida_mux2pra1(i),c(i+8),reset,clock,saida_registrador(i));   
	  END GENERATE;
	  
	  r0 <= saida_registrador(0);
	  r1 <= saida_registrador(1);	
	  r2 <= saida_registrador(2);

	    
Muxes8pra1_UM: mux8pra1 PORT MAP (
c(18 DOWNTO 16), saida_registrador(0),
saida_registrador(1),saida_registrador(2),saida_registrador(3),saida_registrador(4),saida_registrador(5),saida_registrador(6),
saida_registrador(7),saida_mux8pra1_UM);

Muxes8pra1_UM_t<= saida_mux8pra1_UM;
Muxes8pra1_DOIS_t<= saida_mux8pra1_DOIS;
Muxes8pra1_TRES_t<= saida_mux8pra1_TRES;

Muxes8pra1_DOIS: mux8pra1 PORT MAP (
c(21 DOWNTO 19), saida_registrador(0),
saida_registrador(1),saida_registrador(2),saida_registrador(3),saida_registrador(4),saida_registrador(5),saida_registrador(6),
saida_registrador(7),saida_mux8pra1_DOIS);

Muxes8pra1_TRES: mux8pra1 PORT MAP (
c(24 DOWNTO 22), saida_registrador(0),
saida_registrador(1),saida_registrador(2),saida_registrador(3),saida_registrador(4),saida_registrador(5),saida_registrador(6),
saida_registrador(7),saida_mux8pra1_TRES);		



PRIMEIRA_ULA: ULA1 PORT MAP (
c(26 DOWNTO 25),saida_mux8pra1_DOIS,saida_mux8pra1_TRES,cout_s,ov_s,saida_ULA1);
ULA1_t<= saida_ULA1;

ULA2_t<= DATA_OUT_sinal;

SEGUNDA_ULA: ULA2 PORT MAP(
c(28 DOWNTO 27),saida_mux8pra1_UM,saida_ULA1,Z_s,N_s,DATA_OUT_sinal 
);

		  
		 	  
PROCESS (clock )
BEGIN
IF rising_edge(clock) then

DATA_OUT <= DATA_OUT_sinal;
cout<= cout_s;
ov<= ov_s;
N<= N_s;
Z<= Z_s; 





END IF ;


END PROCESS ;




end comportamento;














