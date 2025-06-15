suma_lista([], 0).

suma_lista([Cab|Resto], R):-
	suma_lista(Resto, Sol),
	R is Cab + Sol.