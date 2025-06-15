elemento_n([Cab|_], 1, Cab).
elemento_n([Cab|Resto], N, R):-
	N > 1,
	N2 is N-1,
	elemento_n(Resto, N2, R). 