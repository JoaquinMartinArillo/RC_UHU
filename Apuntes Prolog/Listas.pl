/*APUNTES SOBRE LISTAS

[Cabeza|Resto] = [1,2,3,4]. Nos da la lista sin el primer elemento
[Cabeza|Resto] = [1]. Cabeza = 1, Resto = lista vacia ([])
[Cabeza|Resto] = []. false
[Cabeza1, Cabeza2 | Resto]. Nos da la lista sin los dos primeros elementos

Ejemplo:
my_Length(List, Num) es cierto si Num unifica con el numero de elementos de List.

Induccion
1) P(n0) = true
2) Si P(n-1) -> P(n) 

P(N):- P(N-1)

Como se resuelve un ejercicio Diap 40 50 creo */

my_length([], 0).
my_length([_|Resto], R2):- 
	my_length(Resto, R), R2 is R + 1. % N-1, que tengo en R? -> EL numero de elementos en Resto
	
/*
elemento_n(+Lista, +N, -R) es cierto cuando R unifica con el elemento de Lista que ocupa la pos N
empezando a contar en 1
Si pones +Son atrib de entrada, si es -Es de salida
*/

elemento_n([Cab|_], 1, Cab).
elemento_n([Cab|Resto], N, R):-
	N > 1,
	N2 is N-1,
	elemento_n(Resto, N2, R).
	
/*
Comprime(Lista, R). Es cierto si R unifica con una lista de la siguiente forma:
	Comprime([a,a,a,b,b,c,a], R). es R=[(a,3),(b,2),(c,1),(a,1)].
*/