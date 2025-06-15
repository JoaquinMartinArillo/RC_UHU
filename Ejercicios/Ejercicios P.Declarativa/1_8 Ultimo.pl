ultimo([], []).

ultimo(V, [Cab|Resto]):-
	reverse([Cab|Resto], [V|_]).

ultimo(X, Lista):- 
	append(_,[X], Lista).