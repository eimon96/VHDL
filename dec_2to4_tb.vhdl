LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY dec_2to4_tb IS END dec_2to4_tb;


ARCHITECTURE LogicFunc_tb OF dec_2to4_tb IS
	component tbc is
port (
	clk : bit;
	e, s1, s0: IN STD_LOGIC;
		y0, y1, y2, y3: OUT STD_LOGIC);
END COMPONENT;

	CONSTANT period : TIME := 50 ns;

	signal clk : BIT := '0';
	signal done : boolean := false;
	signal e, s1, s0 : STD_LOGIC := '0';
	signal y0, y1, y2, y3: STD_LOGIC;

begin
	u1 : tbc
	port map(
		clk => clk,
		y0 => y0,
		y1 => y1,
		y2 => y2,
		y3 => y3,
		s1 => s1,
		s0 => s0,
		e => e);
		
	clkprocess: process(done, clk)
		begin
			if (not done) then
				clk <= not clk after period / 2;
			end if;
	end process;
	
		
		y0 <= (NOT s1) AND (NOT s0) AND e;
		y1 <= (NOT s1) AND s0 AND e;
		y2 <= s1 AND (NOT s0) AND e;
		y3 <= s1 AND s0 AND e;
	
	
	testbench: process
		begin
			wait until (clk = '0');
			s1 <= '0';
			s0 <= '0';
			e <= '0';
		    	wait for period;
		    	s1 <= '1';
			s0 <= '0';
			e <= '0';
		    	wait for period;
		    	s1 <= '0';
			s0 <= '1';
			e <= '0';
		    	wait for period;
		    	s1 <= '1';
			s0 <= '1';
			e <= '0';
		    	wait for period;
		    	s1 <= '0';
			s0 <= '0';
			e <= '1';
		    	wait for period;
		    	s1 <= '1';
			s0 <= '0';
			e <= '1';
		    	wait for period;
		    	s1 <= '0';
			s0 <= '1';
			e <= '1';
		    	wait for period;
		    	s1 <= '1';
			s0 <= '1';
			e <= '1';
		    	wait for period;
			
			done <= true;
			wait;
		end process;
end LogicFunc_tb;
