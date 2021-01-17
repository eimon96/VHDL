LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY demux_1to2 IS
	PORT (x0, sel: IN STD_LOGIC;
			a, b: OUT STD_LOGIC;
			clk : BIT);
END demux_1to2;


ARCHITECTURE LogicFunc OF demux_1to2 IS
	BEGIN
		a <= x0 AND (NOT sel);
		b <= x0 AND sel;
END LogicFunc;


