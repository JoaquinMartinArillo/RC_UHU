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
comprime([], []).

comprime([Elem], [(Elem,1)]).

/* Caso de que los 2 primeros sean iguales. Pongo cab1, cab1 para decir que son iguales. Como empezamos
con 2 elementos necesitamos hacer un caso base por si la lista tiene 1 solo elemento*/
comprime([Cab1, Cab1|Resto], [(Cab1,N2)|R]):-
	comprime([Cab1|Resto], [(Cab1,N)|R]), N2 is N+1.  /* Si es cierto en R tengo la solucion final pero en el primer elemento tenemos n-1 repeticiones */

/* Caso cuando los 2 primeros son diferentes */
 comprime([Cab1, Cab2|Resto], [(Cab1,1)|R]):- Cab1 \= Cab2,
	comprime([Cab2|Resto], R).

/*
my_reverse(?Lista, ?Resultado) es cierto si resultado unifica con una lista que contiene  los elementos
	de lista en orden inverso
 my_reverse([1,2,3], R).
 R = [3,2,1]

 Si pones ? en los parametros significa que puede ser una variable libre o instanciada

 *USO DE append/3 -> append ([1,2,3], [4,5], R). -> R = [1,2,3,4,5]. es decir, concatena 2 listas
*/

my_reverse([], []).
my_reverse([Cabeza|Resto], R2):- my_reverse(Resto, R), /* Si fuese cierto en R tendriamos Resto en orden inverso */
	append(R, [Cabeza], R2).

/*
my_append(?Lista1, ?Lista2, ?Resultado)
	es cierto si unifica con la concatenacion de las 2 listas
*/

/* Probemos construyendo la induccion con la primera variable (la 2º siempre igual) */
my_append([], List2, List2).
my_append([Cab|Resto], List2, [Cab|R]):-
	my_append(Resto, List2, R). /* Si fuese verdad en R tenemos concatenado Resto y List2 */
