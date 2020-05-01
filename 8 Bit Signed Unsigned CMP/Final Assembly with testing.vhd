-- this entity has the generator , analyser , and coparator together 

Library IEEE ; 
USE IEEE.STD_logic_1164.ALL ; 

entity fulltest is 
	
	
end ;


architecture testing of fulltest is  
signal clock , expectedequal , expectedgreater ,expectedsmaller , realequal , realgreater , realsmaller , s : std_logic ; 
signal atest,btest : std_logic_vector (7 downto 0 );

begin 
	
	generator : Entity work.Generator1(generation) port map (clock , atest , btest , expectedequal , expectedgreater , expectedsmaller ) ; 
	comparator : Entity work.COMPARATOR(compare) port map (atest,btest , s , clock , realgreater , realsmaller , realequal) ; 
	analyser : Entity work.Analyzer(tb) port map ( expectedgreater , expectedsmaller , expectedequal , realgreater , realsmaller , realequal , clock) ; 
	
	
	end ;



