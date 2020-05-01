-- this entity will check if the expected value is the same as the output of the comparator 
	
	Library IEEE ;
	USE IEEE.STD_logic_1164.ALL;
	
	
	ENTity Analyzer is 	 
		
	port ( expectedG ,expectedS , expectedE , G , S ,E , clock: IN STD_logic ); 
	
		
	end ; 
	
	ARCHITECTURE tb OF Analyzer IS 
	
  BEGIN
    PROCESS(clock)
    BEGIN
      IF rising_edge(clock) THEN
	
        -- Check whether comparator output matches expectation 
        ASSERT   expectedG = G and expectedS = S and expectedE = E   
        REPORT   "Comparison Faild" 
        SEVERITY WARNING; 
		
      END IF;
    END PROCESS;
  END ARCHITECTURE tb;

	
	