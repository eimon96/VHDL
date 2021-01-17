LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY mux_2to1_tb IS END mux_2to1_tb;


ARCHITECTURE LogicFunc_tb OF mux_2to1_tb IS
	component tbc is
port (
	clk : bit;
	x0, x1, sel : IN STD_LOGIC;
	f : OUT STD_LOGIC);
END COMPONENT;

	CONSTANT period : TIME := 50 ns;

	signal clk : BIT := '0';
	signal done : boolean := false;
	signal x0, x1, sel : STD_LOGIC := '0';
	signal f: STD_LOGIC;

begin
	u1 : tbc
	port map(
		clk => clk,
		x0 => x0,
		x1 => x1,
		sel => sel,
		f => f);
		
	clkprocess: process(done, clk)
		begin
			if (not done) then
				clk <= not clk after period / 2;
			end if;
	end process;
	
		
	f <= (x0 AND (NOT sel)) OR (x1 AND sel);
	
	
	testbench: process
		begin
			wait until (clk = '0');
			sel <= '0';
			x0 <= '0';
			x1 <= '0';
			wait for period;
			sel <= '1';
			x0 <= '0';
			x1 <= '0';
			wait for period;
			sel <= '0';
			x0 <= '1';
			x1 <= '0';
			wait for period;
			sel <= '0';
			x0 <= '0';
			x1 <= '1';
			wait for period;
			sel <= '1';
			x0 <= '1';
			x1 <= '0';
			wait for period;
			sel <= '0';
			x0 <= '1';
			x1 <= '1';
			wait for period;
			sel <= '1';
			x0 <= '0';
			x1 <= '1';
			wait for period;
			sel <= '1';
			x0 <= '1';
			x1 <= '1';
			wait for period;
			
			done <= true;
			wait;
		end process;
end LogicFunc_tb;

