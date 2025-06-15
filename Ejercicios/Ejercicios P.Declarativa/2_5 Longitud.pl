longitud([], 0).

longitud([_|Resto], R2):-
	longitud(Resto, R),
	R2 is R + 1.