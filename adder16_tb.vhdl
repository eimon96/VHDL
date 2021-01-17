LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;

ENTITY adder16_tb IS END adder16_tb;


ARCHITECTURE LogicFunc_tb OF adder16_tb IS
	component tbc is
port (
	clk : bit;
	X,Y : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
		S : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
	);
END COMPONENT;

	CONSTANT period : TIME := 50 ns;

	signal clk : BIT := '0';
	signal done : boolean := false;
	signal X, Y : STD_LOGIC_VECTOR(15 DOWNTO 0) := "0000000000000000";
	signal S : STD_LOGIC_VECTOR(15 DOWNTO 0);

begin
	u1 : tbc
	port map(
		clk => clk,
		X => X,
		Y => Y,
		S => S);
		
	clkprocess: process(done, clk)
		begin
			if (not done) then
				clk <= not clk after period / 2;
			end if;
	end process;
	
		
		S <= X + Y;
	
	
	testbench: process
		begin
			wait until (clk = '0');
			X <= "0101010101010101";
			Y <= "1111111111111111";
		    	wait for period;
		    	X <= "1010100001011111";
			Y <= "1111000011111001";
		    	wait for period;

			done <= true;
			wait;
		end process;
end LogicFunc_tb;
