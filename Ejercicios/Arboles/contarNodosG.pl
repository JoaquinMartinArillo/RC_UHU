arbol1(
	a(1, [a(2, [a(5, [])]), a(3, []), a(4, [])])
).

/*
contar_nodosG(+Arbol_generico, ?Num_nodos)
		es cierto cuando Num_nodos unifica con el numero de nodos del arbol
*/

cuenta_nodos(a(_, ListaHijos), R):-
	cuenta_nodos(ListaHijos, RLH),
	R is RLH + 1.
	
cuenta_nodos([], 0).

cuenta_nodos([Cab|Resto], R):-
	cuenta_nodos(Cab, R1),
	cuenta_nodos(Resto, R2),
	R is R1 + R2.