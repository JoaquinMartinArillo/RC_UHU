comprime([], []).

comprime([Elem], [(Elem,1)]).

comprime([Cab1, Cab1|Resto], [(Cab1,N2)|R]):-
	comprime([Cab1|Resto], [(Cab1,N)|R]), N2 is N+1.  

 comprime([Cab1, Cab2|Resto], [(Cab1,1)|R]):- Cab1 \= Cab2,
	comprime([Cab2|Resto], R).