/* Ordenacion por burbuja
ordena_burbuja(+Lista, -ListaR).
Es cierto cuando ListaR unifica con una lista que contiene los mismos elementos que 
Lista ordenados de menor a mayor.

En este caso la induccion se centrara en el numero de movimientos que quedan para tener
la lista ordenada.

ordenada(Lista) es cierto si los elementos estan ordenados de menor a mayor
No estamos ordenando, sino viendo si la lista ya esta ordenada.

TRUCO: Obtener todos los pares consecutivos de una lista
append(_, [E1,E2|_), [8,4,3,1,7,2,5,6]).

*/

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














  
