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
preorden(Arbol, Lista) es cierto si la lista unifica con el preorden del arbol.
	1. Raiz
	2. Izq
	3. Der
*/

preorden(nil, []).

preorden(a(ET,AI,AD), R):-
	preorden(AI, R1),
	preorden(AD, R2),
	append([ET|R1], R2, R).