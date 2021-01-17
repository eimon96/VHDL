LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY demux_1to4_tb IS END demux_1to4_tb;


ARCHITECTURE LogicFunc_tb OF demux_1to4_tb IS
	component tbc is
port (
	clk : bit;
	x0, s1, s0 : IN STD_LOGIC;
	a, b, c, d : OUT STD_LOGIC);
END COMPONENT;

	CONSTANT period : TIME := 50 ns;

	signal clk : BIT := '0';
	signal done : boolean := false;
	signal x0, s1, s0 : STD_LOGIC := '0';
	signal a, b, c, d: STD_LOGIC;

begin
	u1 : tbc
	port map(
		clk => clk,
		x0 => x0,
		a => a,
		b => b,
		c => c,
		d => d,
		s1 => s1,
		s0 => s0);
		
	clkprocess: process(done, clk)
		begin
			if (not done) then
				clk <= not clk after period / 2;
			end if;
	end process;
	
		
		a <= (NOT s1) AND (NOT s0) AND x0;
		b <= (NOT s1) AND s0 AND x0;
		c <= s1 AND (NOT s0) AND x0;
		d <= s1 AND s0 AND x0;
	
	
	testbench: process
		begin
			wait until (clk = '0');
			s1 <= '0';
			s0 <= '0';
			x0 <= '0';
			wait for period;
			s1 <= '0';
			s0 <= '0';
			x0 <= '1';
			wait for period;
			s1 <= '0';
			s0 <= '1';
			x0 <= '0';
			wait for period;
			s1 <= '0';
			s0 <= '1';
			x0 <= '1';
			wait for period;
			s1 <= '1';
			s0 <= '0';
			x0 <= '0';
			wait for period;
			s1 <= '1';
			s0 <= '0';
			x0 <= '1';
			wait for period;
			s1 <= '1';
			s0 <= '1';
			x0 <= '0';
			wait for period;
			s1 <= '1';
			s0 <= '1';
			x0 <= '1';
			wait for period;
			
			done <= true;
			wait;
		end process;
end LogicFunc_tb;


