LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY implement_basic_gates_using_nand IS
	PORT (a, b: IN STD_LOGIC;
			And2, Or2, Nota: OUT STD_LOGIC;
			clk : BIT);
END implement_basic_gates_using_nand;


ARCHITECTURE LogicFunc OF implement_basic_gates_using_nand IS
	BEGIN
		And2 <= (a NAND b) NAND (a NAND b);
		Or2  <= (a NAND a) NAND (b NAND b);
		Nota <=  a NAND a;
END LogicFunc;
