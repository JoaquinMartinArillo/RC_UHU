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
postorden(Arbol, Lista) es cierto si la lista unifica con el postorden del arbol.
	1. Der
	2. Izq
	3. Raiz
*/

postorden(nil, []).

postorden(a(ET,AI,AD), R):-
	postorden(AI, R1),
	postorden(AD, R2),
	append(R1, [ET], RX),
	append(R2, RX, R).