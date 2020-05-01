Library Ieee ; 
use ieee.std_logic_1164.all ; 	  

-- entity for the equality Circuit
entity AEQUALB is 

	PORT ( a , b : IN std_logic_vector(7 downto 0) ; 	 
	C: OUT std_logic ;
	e: out std_logic_Vector(7 downto 0 )); -- e is an output because i will use it in the next circuit 
	
end entity ; 	

 -- Architecture for the equality  

Architecture  AEQUALB1 of AEQUALB is 

SIGNAL h,f : STD_logic_VEctor (7 DOWNTO 0 ) ; 

begin 	   
	-- Generation for all xnor gates in the equality circuit XNOR checks equality
 	XNORS: for i in 0 to 7 generate 
	 
	 XNOR1 : entity work.MYXNOR(XNOR1) PORT MAP (a(i),b(i),h(i));
		 
	 end generate XNORS ; 
	 
	-- the and gates in the equality circuit 
	and7 :entity work.MYAND(AND1) port map (h(7) , h(6) , f(6)) ;
	and6 :entity work.MYAND(AND1) port map (f(6) , h(5) , f(5))  ;
	and5 :entity work.MYAND(AND1) port map (f(5) , h(4) , f(4)) ; 
	and4 :entity work.MYAND(AND1) port map (f(4) , h(3) , f(3))	;
	and3 :entity work.MYAND(AND1) port map (f(3) , h(2) , f(2)) ; 
	and2 :entity work.MYAND(AND1) port map (f(2) , h(1) , f(1)) ; 
	and1 :entity work.MYAND(AND1) port map (f(1) , h(0) , f(0)) ;
		-- driving the final output 	
	f(7) <= h(7) ; 
	e<= f ; 
	C <=f(0);
		
		
	
	
End architecture AEQUALB1;