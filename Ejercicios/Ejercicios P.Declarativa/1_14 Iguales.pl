todos_iguales([]).
todos_iguales([_]).

todos_iguales([X,X|L]):-
	todos_iguales([X|L]).