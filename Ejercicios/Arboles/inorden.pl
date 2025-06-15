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
inorden(Arbol, Lista) es cierto si la lista unifica con el inorden del arbol.
	1. Izquierda
	2. Raiz
	3. Derecha
*/

inorden(nil, []).

inorden(a(ET,AI,AD), R):-
	inorden(AI, R1),
	inorden(AD, R2),
	append(R1, [ET|R2], R).