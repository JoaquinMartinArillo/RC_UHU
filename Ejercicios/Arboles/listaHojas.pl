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
lista_hojas(+Arbol_binario, ?Lista_hojas)
es cierto cuando Lista_hojas unifica con una lista que
contiene las etiquetas de las hojas del arbol
*/

lista_hojas(nil, []).

lista_hojas(A, [Et]):- 
	es_hoja(A), 
	etiqueta(A, Et).
	
lista_hojas(A, R):-	
	\+ es_hoja(A),
	A = a(_,AI,AD),
	lista_hojas(AI, RI),
	lista_hojas(AD, RD),
	append(RI, RD, R).
		
es_hoja(a(_, nil, nil)).

etiqueta(a(Et,_,_), Et).