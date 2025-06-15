% anagram(Word, Candidates, Anagrams).
anagram(_, [], []).

anagram(Palabra, [Cab|Resto], [Cab|R]):-    
    string_length(Palabra, L),
    string_length(Cab, L),
    string_lower(Palabra, Pal), string_codes(Pal, PalC),   
    string_lower(Cab, MinCab), string_codes(MinCab, CabC),
    PalC \= CabC,       
    mismosElementos(PalC, CabC),
    anagram(Palabra, Resto, R).
	
anagram(Palabra, [Cab|Resto], R):-    
    string_length(Palabra, L),
    string_length(Cab, L),
    string_lower(Palabra, Pal), string_codes(Pal, PalC),   
    string_lower(Cab, MinCab), string_codes(MinCab, CabC),
    PalC \= CabC,       
    \+ mismosElementos(PalC, CabC),
    anagram(Palabra, Resto, R).
	
anagram(Palabra, [Cab|Resto], R):-    
    string_length(Palabra, L),
    string_length(Cab, L),
    string_lower(Palabra, Pal), string_codes(Pal, PalC),   
    string_lower(Cab, MinCab), string_codes(MinCab, CabC),
    PalC = CabC,       
    anagram(Palabra, Resto, R).
	
anagram(Palabra, [Cab|Resto], R):-    
    string_length(Palabra, L1),
    string_length(Cab, L2),
    L1 \= L2,      
    anagram(Palabra, Resto, R).
	
comprime([], []).

comprime([E], [(E,1)]).

comprime([Cab, Cab|Resto], [(Cab, N2)|R] ):- 
	comprime([Cab|Resto], [(Cab,N)|R]), N2 is N + 1.
  
comprime([Cab1, Cab2|Resto], [(Cab1,1)|R]):- 
	Cab1 \= Cab2, comprime([Cab2|Resto], R).  

mismosElementos(Pal1, Pal2):- 
	msort(Pal1, Pal1O), 
	comprime(Pal1O, R1),
	msort(Pal2, Pal2O), 
	comprime(Pal2O, R2),
	R1 = R2.