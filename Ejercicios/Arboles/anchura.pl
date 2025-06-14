/*
anchura(Arbol, R) es cierto si R unifica con el orden en anchura del arbol

Para este ejercicio primero pasaremos el arbol a generico con ayuda de cuentaNodosG
*/

cuenta_nodos(a(_, ListaHijos), R):-
	cuenta_nodos(ListaHijos, RLH),
	R is RLH + 1.
	
cuenta_nodos([], 0).

cuenta_nodos([Cab|Resto], R):-
	cuenta_nodos(Cab, R1),
	cuenta_nodos(Resto, R2),
	R is R1 + R2.


anchura(nil, []).

anchura(a(_,AI,AD), ):-
	