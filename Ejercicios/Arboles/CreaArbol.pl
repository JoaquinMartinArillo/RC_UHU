arbol1(
	a(1, a(2, a(4, nil, nil), a(5, nil, nil)), a(3, a(6, nil, nil), a(7, a(8, a(9, nil, nil), nil), nil)))
).

arbol2(
		a(1, a(2, nil, nil), a(3, nil, nil))
).

arbol3(
	a(2, nil, nil)
).

/*
crea_arbol(Lista, ArbolBinario)
	es cierto si ArbolBinario unifica con un arbol binario
	balanceado que contiene todas las etiquetas de la lista
*/

crea_arbol([], nil).

crea_arbol([Cab|Resto], a(Cab, A1, A2)):-
	length(Resto, L),
	Med is L div 2,
	length(L1, Med),
	append(L1, L2, Resto),
	crea_arbol(L1, A1),
	crea_arbol(L2, A2).


/*
balanceado(Arbol)
	es cierto si para TODO NODO del Arbol la diferencia de
	altura del subIzq y subDer es MAXIMO 1.
	
Necesitaremos la altura de un arbol:
altura(ArbolB, Alt)
	es cierto si Alt unifica con la altura de ArbolB
*/

balanceado(nil).

balanceado(a(_,AI,AD)):-
	altura(AI, A1),
	altura(AD, A2),
	Dif is abs(A1 - A2),
	Dif =< 1.

altura(nil, 0).

altura(a(_,AI,AD), R):-
	altura(AI, A1),
	altura(AD, A2),
	R is max(A1, A2) + 1.