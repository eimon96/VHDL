LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY dec_2to4 IS
	PORT (e, s1, s0: IN STD_LOGIC;
		y0, y1, y2, y3: OUT STD_LOGIC;
			clk : BIT);
END dec_2to4;


ARCHITECTURE LogicFunc OF dec_2to4 IS
	BEGIN
		y0 <= (NOT s1) AND (NOT s0) AND e;
		y1 <= (NOT s1) AND s0 AND e;
		y2 <= s1 AND (NOT s0) AND e;
		y3 <= s1 AND s0 AND e;
END LogicFunc;

