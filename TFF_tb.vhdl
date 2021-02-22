LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY tff_tb IS END tff_tb;


ARCHITECTURE tff_arch_tb OF tff_tb IS
	component tbc is
port (
	t, clk : IN STD_LOGIC;
	q : INOUT STD_LOGIC);
END COMPONENT;

	CONSTANT period : TIME := 50 ns;

	signal done : boolean := false;
	signal t, clk, q : STD_LOGIC := '0';

begin
	u1 : tbc
	port map(
		clk => clk,
		t => t,
		q => q
		);
		
	clkprocess: process(done, clk)
		begin
			if (not done) then
				clk <= not clk after period / 2;
			end if;
	end process;
	
		
	PROCESS (clk)
	BEGIN 
		IF rising_edge(clk) THEN
			IF t = '1' THEN
				q <= NOT q;
			END IF;
		END IF;
	END PROCESS;
	
	
	testbench: process
		begin
			wait until (clk = '0');
			t <= '0';
			wait for period;
			t <= '1';
			wait for period;
			t <= '0';
			wait for period;
			t <= '1';
			wait for period;
			t <= '1';
			wait for period;
			t <= '0';
			wait for period;
			
			done <= true;
			wait;
		end process;
end tff_arch_tb;



