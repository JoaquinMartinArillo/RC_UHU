/*cuenta_nodos(+Arbol_binario, ?Num_nodos)
es cierto cuando Num_nodos unifica con el numero de nodos del arbol

En el principio de induccion matematica:

1) Caso base es nil (Arbol nulo)
2) Para n-1 sera una rama entera (Coger la rama izq-der del nodo actual)*/

arbol1(
		a(1, a(2, nil, nil), a(3, nil, nil))
).

arbol2(
	a(1, a(2, a(4, nil, nil), a(5, nil, nil)), a(3, a(6, nil, nil), a(7, a(8, nil, nil), nil)))
).

cuenta_nodos(nil, 0).

cuenta_nodos(a(_,AI,AD), R):-
	cuenta_nodos(AI, RI),
	cuenta_nodos(AD, RD),
	R is RI + RD + 1.

