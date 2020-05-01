-- this entity will assemble both a=b and a>b circuits together to get the final comparator 
	Library IEEE ; 
	USE IEEE.STD_LOGIC_1164.ALL ;
	
	
	ENTITY COMPARATOR IS 
		PORT ( a,b : in std_logic_vector (7 downto 0) ; 
		s ,clk : in std_logic ; 
		Greater, Smaller , EQUAL : out std_logic ) ; 
		
	End Entity ; 
	
	
	
	Architecture compare of COMPARATOR is 	
	Signal e : std_logic_vector (7 downto 0 ) ;
	signal lGreater , lSmaller , lEqual : std_logic ; 
	signal la , lb  : std_logic_vector(7 downto 0);
	Begin  
		
		equality : Entity work.AEQUALB(AEQUALB1) port map ( la , lb  , lEQUAL , e) ; 
		comparison : Entity work.ANOTEQUALB(COMPARE) port map (la,lb,s, e ,lGreater , lSmaller) ; 
			
		process (clk) 
		begin 
			if (rising_edge(clk) ) then	
				la <= a ;  
				lb<=b;
				Greater <= lGreater ; 
				Smaller <= lSmaller ; 
				Equal  <= lEqual ; 
				end if ;
			
			End process  ; 
			

		End architecture ; 