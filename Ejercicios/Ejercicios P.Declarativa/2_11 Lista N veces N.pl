lista(N,L):-
	lista_aux(N,N,L).
	
lista_aux(_, 0, []).

lista_aux(N, M, [N|Resto]):-
	M > 0,
	M1 is M-1,
	lista_aux(N, M1, Resto).