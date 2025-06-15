% Balanceado1
arbol1(
	a(1, a(2, a(4, nil, nil), a(5, nil, nil)), a(3, a(6, nil, nil), a(7, a(8, nil, nil), nil)))
).

% Un solo nodo
arbol2(
	a(1, nil, nil)
).

arbol3(
		a(1, a(2, nil, nil), a(3, nil, nil))
).

/*
Escribir el predicado miembro/2 que indique si un elemento X, pertenece a un árbol.
*/

miembro(Elem, a(Elem,_,_)).

miembro(Elem, a(_,AI,_)):-
	miembro(Elem, AI).
	
miembro(Elem, a(_,_,AD)):-
	miembro(Elem, AD).