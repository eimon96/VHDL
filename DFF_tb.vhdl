LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

ENTITY dff_tb IS END dff_tb;


ARCHITECTURE dff_arch_tb OF dff_tb IS
	component tbc is
port (
	d, clk : IN STD_LOGIC;
	q : OUT STD_LOGIC);
END COMPONENT;

	CONSTANT period : TIME := 50 ns;

	signal done : boolean := false;
	signal d, clk : STD_LOGIC := '0';
	signal q : STD_LOGIC;

begin
	u1 : tbc
	port map(
		clk => clk,
		d => d,
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
			q <= d;
		END IF;
	END PROCESS;
	
	
	testbench: process
		begin
			wait until (clk = '0');
			d <= '0';
			wait for period;
			d <= '1';
			wait for period;
			d <= '0';
			wait for period;
			d <= '0';
			wait for period;
			d <= '1';
			wait for period;
			d <= '0';
			wait for period;
			
			done <= true;
			wait;
		end process;
end dff_arch_tb;


