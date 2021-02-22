LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;


ENTITY dff IS
	PORT (
		d, clk: IN std_logic;
		q: OUT std_logic
	);
END ENTITY dff;


ARCHITECTURE dff_arch OF dff IS
BEGIN
	PROCESS (clk)
	BEGIN 
		IF rising_edge(clk) THEN
			q <= d;
		END IF;
	END PROCESS;
END ARCHITECTURE dff_arch;
