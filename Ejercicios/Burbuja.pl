/* Ordenacion por burbuja
ordena_burbuja(+Lista, -ListaR).
Es cierto cuando ListaR unifica con una lista que contiene los mismos elementos que 
Lista ordenados de menor a mayor.

En este caso la induccion se centrara en el numero de movimientos que quedan para tener
la lista ordenada.

*/

/*
ordenada(Lista) es cierto si los elementos estan ordenados de menor a mayor
No estamos ordenando sino viendo si la lista ya esta ordenada
*/

%Lista vacia
ordenada([]).
%Lista de un elemento
ordenada([_]).
%Lista de dos elementos o mas
ordenada([Cab1, Cab2|Resto]) :- 
	Cab1<Cab2, 
	ordenada([Cab2|Resto]).
