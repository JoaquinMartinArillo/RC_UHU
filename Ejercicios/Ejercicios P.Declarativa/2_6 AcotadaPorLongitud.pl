lista_acotada(L):-
	length(L,N),
	lista_acotada_aux(L,N).
	
lista_acotada_aux([], _).

lista_acotada_aux([Cab|Resto], N):-
	Cab < N,
	lista_acotada_aux(Resto, N).