lista(N, N, [N]).

lista(N, M, [N|L]):-
	N < M,
	N1 is N+1,
	lista(N1, M, L).