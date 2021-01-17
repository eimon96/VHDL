#include <stdio.h>


int main()
{
	int x0, x1, x2, x3, s1, s0; 
	int waits = 0;
	
	for (s1 = 0; s1 <= 1; s1++)
			for (s0 = 0; s0 <= 1; s0++)
					for (x0 = 0; x0 <= 1; x0++)
							for (x1 = 0; x1 <= 1; x1++)
									for (x2 = 0; x2 <= 1; x2++)
											for (x3 = 0; x3 <= 1; x3++)
											{
												printf("\n\
														s1 <= \'%d\';\n\
														s0 <= \'%d\';\n\
														x0 <= \'%d\';\n\
														x1 <= \'%d\';\n\
														x2 <= \'%d\';\n\
														x3 <= \'%d\';\n\
														wait for period;", s1, s0, x0, x1, x2, x3);
														
														waits++;
											}
		
	
	printf("\n\nWaits: %d", waits);
	
	
	
	return 0;
}
