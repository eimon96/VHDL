LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY basic_gates_using_NOR IS
	PORT (a, b: IN STD_LOGIC;
			And2, Or2, Nota: OUT STD_LOGIC;
			clk : BIT);
END basic_gates_using_NOR;


ARCHITECTURE LogicFunc OF basic_gates_using_NOR IS
	BEGIN
		And2 <= (a NOR a) NOR (b NOR b);
		Or2  <= (a NOR b) NOR (a NOR b);
		Nota <= a NOR a;
END LogicFunc;
