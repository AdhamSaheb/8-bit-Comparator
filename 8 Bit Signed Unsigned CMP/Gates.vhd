Library IEEE ; 
USE IEEE.STD_logic_1164.ALL ; 

entity MYAND is
	
	port (A , B : in std_logic ; 
	Q : out std_logic ); 

End ; 

ARCHitecture AND1 OF MYAND IS 
BEGIN 	
	
	Q<= A AND B AFTER 	4 NS ;
	
END ; 


------------------------------


Library IEEE ; 
USE IEEE.STD_logic_1164.ALL ; 

entity MYOR is
	
	port (A , B : in std_logic ; 
	 Q: out std_logic ); 

End ;  

ARCHitecture OR1 OF MYOR IS 
BEGIN 	
	
	Q<= A OR B AFTER 4 NS ;
	
END ;	 

---------------------------------	


Library IEEE ; 
USE IEEE.STD_logic_1164.ALL ; 

entity MYXOR is
	
	port (A , B : in std_logic ; 
	 Q: out std_logic ); 

End ;  

ARCHitecture XOR1 OF MYXOR IS 
BEGIN 	
	
	Q<= A XOR B AFTER 7 NS ;
	
END ;	 

---------------------------------	



Library IEEE ; 
USE IEEE.STD_logic_1164.ALL ; 

entity MYXNOR is
	
	port (A , B : in std_logic ; 
	 Q: out std_logic ); 

End ;  

ARCHitecture XNOR1 OF MYXNOR IS 
BEGIN 	
	
	Q<= A XNOR B AFTER 6 NS ;
	
END ;	 

---------------------------------	


Library IEEE ; 
USE IEEE.STD_logic_1164.ALL ; 

entity MYNOR is
	
	port (A , B : in std_logic ; 
	 Q: out std_logic ); 

End ;  

ARCHitecture NOR1 OF MYNOR IS 
BEGIN 	
	
	Q<= A NOR B AFTER 3 NS ;
	
END ;	 

---------------------------------	




Library IEEE ; 
USE IEEE.STD_logic_1164.ALL ; 

entity MYNAND is
	
	port (A , B : in std_logic ; 
	 Q: out std_logic ); 

End ;  

ARCHitecture NAND1 OF MYNAND IS 
BEGIN 	
	
	Q<= A NAND B AFTER 3 NS ;
	
END ;	 

---------------------------------  



Library IEEE ; 
USE IEEE.STD_logic_1164.ALL ; 

entity MYINVERTER is
	
	port (A  : in std_logic ; 
	 Q: out std_logic ); 

End ;  

ARCHitecture INVERT1 OF MYINVERTER IS 
BEGIN 	
	
	Q<= NOT A AFTER 2 NS ;
	
END ;	 

---------------------------------	   



