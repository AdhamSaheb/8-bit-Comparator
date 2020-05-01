LIBRARY IEEE ; 
Use Ieee.std_logic_1164.all; 

-- entity for the a>b or a<b Circuit 
Entity ANOTEQUALB is 
	
 PORT ( A , B : IN STD_LOGIc_vector(7 DOWNTO 0 ) ; 
 S : IN STD_logic; 
 e : IN STd_logic_VEctor(7 DOWNTO 0) ; --A=B
 
 ABIGGER , ASMALLER : OUT STD_logic ); 	-- A>B , A<B
	
END ENTITY ; 


ARCHItecture COMPARE OF ANOTEQUALB IS 

SIGNAL AS , BS : STD_logic:= '0' ; -- COMPARING THE SIGN 
SIGNAL q : STD_logic_vector(7 DOWNTO 0 ); 
SIGNal Y : STD_logic_vector(7 DOWNTO 0 ) ; 
SIGNal L : STD_logic_vector(7 DOWNTO 0 ) ; 
SIGNAL LB : STD_logic_vector(7 DOWNTO 0) ; -- A COPY OF B  

BEGIN  
	
	-- I WILL FOLLOW THE GATES SHOWN IN THE STRUCTURE SUBMITTED WITH THE PROJECT REPORT WITH THE SAME NAMES
	NOTB : FOR I IN 0 TO 6 GENErate  -- TAKING THE NEGATION FOR B
		not1: entity work.MYINVERTER(INVERT1) PORT MAP(B(I) , LB(I));
	END GENerate NOTB ; 
	LB(7) <= B(7) ; -- last bit is not negated 
	
	
	ANDS : for i in 0 to 6 generate -- a and not b loop 
		ands:  entity work.MYAND(AND1) PORT MAP (A(i) , LB(i) ,L(i) ) ; 
		END GENERate ANDS ; 	
		
		ANDS2 : for i in 0 to 6 generate 
		ands2:  entity work.MYAND(AND1) PORT MAP (e(i+1) , L(I) ,q(i) ) ; 
		  END GENERate ANDS2 ; 
	
	 -- the following 3 lines compare the sign of a and b 
	 
	xor1 : ENTITy WORK.MYXOR(XOR1) PORT MAP (A(7) , s , AS) ;	
	xnor1: ENTITy WORK.MYXNOR(XNOR1) PORT MAP (B(7) , s , BS) ;

	AND2 : ENTITy WORK.MYAND(AND1) PORT MAP (AS , BS , q(7)) ;	
		
		-- THE FOLLOWING LINES ARE THE REMAINING GATES IN THE STRUCTURE 
		OR1 : ENTity WORK.MYOR(OR1) PORT MAP (q(7) , q(6), Y(3)) ;
		OR2 : ENTity WORK.MYOR(OR1) PORT MAP (q(5) , q(4) , Y(2)) ; 
		OR3 : ENTity WORK.MYOR(OR1) PORT MAP (q(3) , q(2) , Y(1)) ; 
		OR4 : ENTity WORK.MYOR(OR1) PORT MAP (q(1) , q(0) , Y(0 )) ; 
		OR5 : ENTity WORK.MYOR(OR1) PORT MAP (Y(0) , Y(1) , Y(4)) ; 
		OR6 : ENTity WORK.MYOR(OR1) PORT MAP (Y(2), Y(3) ,Y(5)) ; 
		OR7 : ENTity WORK.MYOR(OR1) PORT MAP (Y(4) , Y(5) , Y(6)) ;
			
		NOR1 : ENTITy WORK.MYNOR(NOR1) PORT MAP (e(0) , Y(6) , y(7)); -- A is smaller than b if not bigger nor equal to it 
			
		ASMALLER <= Y(7) ; 
		ABIGGER <= Y(6)  ; 
		
		
	END ARCHitecture ; 
	
	