nucleotide_count('', [('A', 0)]).

nucleotide_count(Cadena, CadR):-
    atom_codes(Cadena, CadC),
    msort(CadC, Ord),
    comprime(Ord, CadCompr),
    nucleotideC(CadCompr),
    comp2Cad(CadCompr, CadR).
    
nucleotide(65).
nucleotide(67).
nucleotide(71).
nucleotide(84).

nucleotideC([]).

nucleotideC([(Cab, _)|Resto]):-
    nucleotide(Cab),
    nucleotideC(Resto).
	
comprime([], []).

comprime([Elem], [(Elem,1)]).

comprime([Cab1, Cab1|Resto], [(Cab1,N2)|R]):-
	comprime([Cab1|Resto], [(Cab1,N)|R]), N2 is N+1. 
	
 comprime([Cab1, Cab2|Resto], [(Cab1,1)|R]):- Cab1 \= Cab2,
	comprime([Cab2|Resto], R).
	
comp2Cad([], []).

comp2Cad([(Cab, N)|Resto], [(CabA, N)|R]):-
    atom_codes(CabA, [Cab]),
    comp2Cad(Resto, R).