selecciona(_, [], []).

selecciona(V, [V|Resto], Resto).

selecciona(V, [Y|Resto], [Y|R]):-
	selecciona(V, Resto, R).
	