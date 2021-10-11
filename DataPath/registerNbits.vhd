LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY registerNbits IS 
GENERIC ( N	: INTEGER := 32);
PORT(
    
	 d   : IN STD_LOGIC_VECTOR(N-1 DOWNTO 0);
    ld  : IN STD_LOGIC; -- load/enable.
    clr : IN STD_LOGIC; -- async. clear.
    clk : IN STD_LOGIC; -- clock.
    q   : OUT STD_LOGIC_VECTOR(N-1 DOWNTO 0) -- output
);
END registerNbits;

ARCHITECTURE description OF registerNbits IS

BEGIN
    process(clk, clr)
    begin
        if clr = '1' then
            q <= "00000000000000000000000000000000";
        elsif rising_edge(clk) then
            if ld = '1' then
                q <= d;
            end if;
        end if;
    end process;
END description;