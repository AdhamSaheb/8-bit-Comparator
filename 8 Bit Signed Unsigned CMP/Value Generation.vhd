-- This entity will generate values for the testing operation 

Library IEEE ; 
USE IEEE.STd_logic_1164.ALL ;
use IEEE.std_logic_arith.all; 

Entity Generator1 is 
	port ( clock : in std_logic ; 
	atest , btest : out std_logic_vector(7 downto 0 )  ;
	expectedequal , expectedgreater , expectedsmaller : out std_logic ); 
	
end ;


ARCHitecture generation of Generator1 is
signal ga, gb  : std_logic_vector(7 downto 0 );
signal lexpectedequal , lexpectedgreater , lexpectedsmaller : std_logic ; 
begin 

PROCESS
BEGIN
  FOR I IN 0 TO 255 LOOP
    FOR J IN 0 TO 255 LOOP
      -- Set the inputs to the adder
	  	    ga <= conv_std_logic_vector(i,8);
      		gb <= CONV_STD_LOGIC_VECTOR(j,8);
	  		atest<= ga; 
	  		btest<=gb ;
      -- Calculate what the output of the adder should be
	  if (ga>gb) then 
		  expectedgreater <= '1'  after 60 ns ;
		  expectedsmaller<= '0'  after 60 ns;
		  expectedequal <= '0'    after 60 ns;
	elsif(ga<gb) then 
		  expectedgreater <= '0'  after 60 ns;
		  expectedsmaller<= '1'  after 60 ns;
		  expectedequal <= '0'   after 60 ns;
	elsif(ga=gb) then
		    expectedgreater <= '0'  after 60 ns;
		  	expectedsmaller<= '1'  after 60 ns;
		  	expectedequal <= '0'   after 60 ns;
	end if ;

       
      -- Wait until adder output has settled
      WAIT until rising_edge(clock);
    END LOOP;
  END LOOP;

  
  WAIT;
END PROCESS;


	
	
end ; 
