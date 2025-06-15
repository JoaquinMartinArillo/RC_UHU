max_lista([X], X).

max_lista([X1, X2|L], Y):-
	X3 is max(X1,X2),
	max_lista([X3|L], Y).