arbol1(
	a(1, [a(2, [a(5, [])]), a(3, []), a(4, [])])
).

/*
lista_hojasG(Arbol_Generico, R)
*/

lista_hojasG(nil, 0).

lista_hojasG(A, [Et]):-
	es_hoja(A),
	A = a(Et, _).

lista_hojasG(A, R):-
	\+ es_hoja(A),
	A = a(_, ListaHijos),
	lista_hojasG(ListaHijos, R).
	
lista_hojasG([], []).

lista_hojasG([Cab|Resto], R):-
	lista_hojasG(Cab, R1),
	lista_hojasG(Resto, R2),
	append(R1, R2, R).
	
es_hoja(a(_, [])).
	
etiqueta(a(Et, _), Et).