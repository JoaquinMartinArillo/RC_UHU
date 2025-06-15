%Lista vacia
ordenada([]).
%Lista de un elemento
ordenada([_]).
%Lista de dos elementos o mas
ordenada([Cab1, Cab2|Resto]) :- 
	Cab1<Cab2, 
	ordenada([Cab2|Resto]).

%Caso base - Lista ya ordenada
burbuja(Lista, Lista):- ordenada(Lista).

%Caso de una lista desordenada
burbuja(Lista, R):- 
	append(L1, [E1,E2|L2], Lista), E1 > E2,
	append(L1, [E2,E1|L2], Lista2),
	burbuja(Lista2, R).
 
%Caso de una lista ya ordenada
burbuja(Lista, R):- 
	append(L1, [E1,E2|L2], Lista), E1 =< E2,	
	burbuja(Lista2, R).