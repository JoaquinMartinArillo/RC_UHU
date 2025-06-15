/* Tu mejor amigo e va ha casar y quiere que le planifique a sus invitado en
mesas redondas y que esten contentos:
Esteban, Gustavo, Jaime, Malena y Valeria
 
- Gustavo es hablador
- Valeria tmb
- A Esteban le gusta Malena
- A Malena le gusta Esteban
- A Gustavo le gusta Valeria (pero no en viceversa)
 
Las personas que se gustan se pueden sentar al lado
La gente que habla se sienta con cualquiera
NO juntar a personas que no se gustan entre si 
*/
/* Regla del hablador */
chatty(gustavo).
chatty(valeria).
/* Regla del gusto */
likes(esteban, malena). /* A Esteban le gusta Malena */
likes(malena, esteban). /* A Malena le gusta Esteban */
likes(gustavo, valeria). /* A Gustavo le gusta Valeria */
/* Regla para juntar en la mesa */
pairing (malena, esteban). /* Podemos juntar a Malena y Esteban */ 
pairing(A, _):- chatty(A). /* Definimos una regla general para emparejar a un hablador con cualquiera */
pairing(_, A):- chatty(A). 
pairing(A, B):- likes(A,B), likes(B,A) /* Regla general para definir emparejamiento entre personas que se gustan */
/* Regla para sentar a todas las personas en la mesa */
seating (A, B, C, D, E):- pairing(A,B), pairing(B,C), pairing(C,D), pairing(D,E), pairing(E,A).
/* 
Procedimiento para resolver los problemas
   1. Declarar las reglas para definir los "estados" de las variables (En este caso quien es hablador, se gusta, etc).
   2. Declarar las reglas generales en las que sean necesarias (En este caso solo en pairing, los otros no lo necesita).
   3. Declarar la solución (seating)
*/
/* SOLUCION BIEN ESCRITA */
chatty(gustavo).
chatty(valeria).
likes(esteban, malena). 
likes(malena, esteban).
likes(gustavo, valeria).   
pairing(A, B):- chatty(A), A \= B.
pairing(B, A):- chatty(A), A \=B.
% a /\ b -> c
pairing(A, B):- likes(A,B), likes(B,A), A \= B. 
seating(A, B, C, D, E):- pairing(A,B), pairing(B,C), pairing(C,D), pairing(D,E), pairing(E,A).
/* DIFERENTES */
chatty(gustavo).
chatty(valeria).
likes(esteban, malena). 
likes(malena, esteban).
likes(gustavo, valeria).   
pairing(A, B):- chatty(A), A \= B.
pairing(B, A):- chatty(A), A \=B.
% a /\ b -> c */
pairing(A, B):- likes(A,B), likes(B,A), A \= B. 
seating(A, B, C, D, E):- pairing(A,B), pairing(B,C), pairing(C,D), pairing(D,E), pairing(E,A), 
	all_dif([A,B,C,D,E]).
/*
all_dif(Lista) es cierto si todos los elementos de Lista son diferentes.
 
Induccion matematica
1) P(n0)
2) Para todo N > n0, P(n-1) -> P(n)
*/
all_dif([]).
all_diff([Cab|Resto]):-  all_dif(Resto), maplist(dif(Cab), Resto).