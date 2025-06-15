% Balanceado1
arbol1(
	a(1, a(2, a(4, nil, nil), a(5, nil, nil)), a(3, a(6, nil, nil), a(7, a(8, nil, nil), nil)))
).

% Balanceado2
arbol2(
		a(1, a(2, nil, nil), a(3, nil, nil))
).

% Arbol de un nodo
arbol3(
	a(2, nil, nil)
).

% Desbalanceado
arbol4(
	a(1, a(2, a(4, nil, nil), a(5, nil, nil)), a(3, a(6, nil, nil), a(7, a(8, a(9, nil, nil), nil), nil)))
).

/*
Implementar el predicado suma_nodos/2 que sume el contenido de todos los nodos de
un árbol.
*/

suma_nodos(nil, 0).

suma_nodos(A, R):-
	A = a(_, AI, AD),
	suma_nodos(AI, RI),
	suma_nodos(AD, RD),
	etiqueta(A, Et),
	R is RI + RD + Et.
	
etiqueta(a(Et,_,_), Et).

suma_nodos(a(ET,AI,AD), R):-
	