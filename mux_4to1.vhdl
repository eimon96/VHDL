LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY mux_4to1 IS
	PORT (x0, x1, x2, x3: IN STD_LOGIC;
		 	s1, s0: IN STD_LOGIC;
			f: OUT STD_LOGIC;
			clk : BIT);
END mux_4to1;


ARCHITECTURE LogicFunc OF mux_4to1 IS
	BEGIN
		f <= ( (NOT s1) AND (NOT s0) AND x0 ) OR ( (NOT s1) AND s0 AND x1 ) OR ( s1 AND (NOT s0) AND x2 ) OR ( s1 AND s0 AND x3 );
END LogicFunc;

