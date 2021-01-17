LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY demux_1to2_tb IS END demux_1to2_tb;


ARCHITECTURE LogicFunc_tb OF demux_1to2_tb IS
	component tbc is
port (
	clk : bit;
	x0, sel : IN STD_LOGIC;
	a, b : OUT STD_LOGIC);
END COMPONENT;

	CONSTANT period : TIME := 50 ns;

	signal clk : BIT := '0';
	signal done : boolean := false;
	signal x0, sel : STD_LOGIC := '0';
	signal a, b: STD_LOGIC;

begin
	u1 : tbc
	port map(
		clk => clk,
		x0 => x0,
		a => a,
		b => b,
		sel => sel);
		
	clkprocess: process(done, clk)
		begin
			if (not done) then
				clk <= not clk after period / 2;
			end if;
	end process;
	
		
			a <= x0 AND (NOT sel);
			b <= x0 AND sel;
	
	
	testbench: process
		begin
			wait until (clk = '0');
			sel <= '0';
			x0 <= '0';
			wait for period;
			sel <= '0';
			x0 <= '1';
			wait for period;
			sel <= '1';
			x0 <= '0';
			wait for period;
			sel <= '1';
			x0 <= '1';
			wait for period;
	
			wait for period;
			
			done <= true;
			wait;
		end process;
end LogicFunc_tb;


