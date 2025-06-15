inversa([], []).

inversa([Cab|Resto], Sol):-
	inversa(Resto, R),
	append(R, [Cab], Sol).