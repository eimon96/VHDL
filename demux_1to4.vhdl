LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY demux_1to4 IS
	PORT (x0, s1, s0: IN STD_LOGIC;
			a, b, c, d: OUT STD_LOGIC;
			clk : BIT);
END demux_1to4;


ARCHITECTURE LogicFunc OF demux_1to4 IS
	BEGIN
		a <= (NOT s1) AND (NOT s0) AND x0;
		b <= (NOT s1) AND s0 AND x0;
		c <= s1 AND (NOT s0) AND x0;
		d <= s1 AND s0 AND x0;
END LogicFunc;


