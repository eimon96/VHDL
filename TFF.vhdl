LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;


ENTITY tff IS
	PORT (
		t, clk: IN std_logic;
		q: INOUT std_logic
	);
END ENTITY tff;


ARCHITECTURE tff_arch OF tff IS
BEGIN
	PROCESS (clk)
	BEGIN 
		IF rising_edge(clk) THEN
			IF t = '1' THEN
				q <= NOT q;
			END IF;
		END IF;
	END PROCESS;
END ARCHITECTURE tff_arch;

