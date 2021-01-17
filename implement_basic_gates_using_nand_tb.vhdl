LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY implement_basic_gates_using_nand_tb IS END implement_basic_gates_using_nand_tb;


ARCHITECTURE LogicFunc_tb OF implement_basic_gates_using_nand_tb IS
	component tbc is
port (
	clk : bit;
	a, b : IN STD_LOGIC;
	And2, Or2, Nota : OUT STD_LOGIC);
END COMPONENT;

	CONSTANT period : TIME := 50 ns;

	signal clk : BIT := '0';
	signal done : boolean := false;
	signal a, b : STD_LOGIC := '0';
	signal And2, Or2, Nota: STD_LOGIC;

begin
	u1 : tbc
	port map(
		clk => clk,
		a => a,
		b => b,
		And2 => And2,
		Or2 => Or2,
		Nota => Nota);
		
	clkprocess: process(done, clk)
		begin
			if (not done) then
				clk <= not clk after period / 2;
			end if;
	end process;
	
	
		And2 <= (a NAND b) NAND (a NAND b);
		Or2  <= (a NAND a) NAND (b NAND b);
		Nota <=  a NAND a;
		
	
	
	testbench: process
		begin
			wait until (clk = '0');
			a <= '0';
			b <= '0';
			wait for period;
			a <= '0';
			b <= '1';
			wait for period;
			a <= '1';
			b <= '0';
			wait for period;
			a <= '1';
			b <= '1';
			wait for period;
	
			done <= true;
			wait;
		end process;
end LogicFunc_tb;


