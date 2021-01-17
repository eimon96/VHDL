LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY mux_2to1 IS
	PORT (x0, x1, sel: IN STD_LOGIC;
			f: OUT STD_LOGIC;
			clk : BIT);
END mux_2to1;


ARCHITECTURE LogicFunc OF mux_2to1 IS
	BEGIN
		f <= (x0 AND (NOT sel)) OR (x1 AND sel);
END LogicFunc;

