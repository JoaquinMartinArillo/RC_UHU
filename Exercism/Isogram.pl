/*
isogram(String) es cierto si la cadena String es un isograma excluyendo
guiones y espacios en blanco. (Isograma -> Palabra/Frase que no repite letras).
*/

/*
quitar_blancos(Lista, R). es cierto si R unifica con una lista con los caracteres de 
Lista sin espacios ni guiones.
*/
blanco(' ').
blanco('_').

quitar_blancos([], []).

quitar_blancos([Cabeza|Resto], ):-
  quitar_blancos(Resto, R), blanco(Cab).  

quitar_blancos([Cabeza|Resto], ):-
  quitar_blancos(Resto, R), \+ blanco(Cab).  

/*
quitar_guiones(Lista, R). es cierto si R unifica con una lista con los caracteres de 
Lista sin guiones.
*/
/*
lower_case(Lista, R).
*/
