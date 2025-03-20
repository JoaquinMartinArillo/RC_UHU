/*
isogram(String) es cierto si la cadena String es un isograma excluyendo
guiones y espacios en blanco. (Isograma -> Palabra/Frase que no repite letras).
*/

/*
quitar_blancos(Lista, R). es cierto si R unifica con una lista con los caracteres de 
Lista sin espacios ni guiones.
*/
blanco(' ').
blanco('-').

quitar_blancos([], []).

quitar_blancos([Cabeza|Resto], R):-
  quitar_blancos(Resto, R), blanco(Cab).  

quitar_blancos([Cabeza|Resto], [Cab|R]):-
  quitar_blancos(Resto, R), \+ blanco(Cab).  

/*
lower_case(Lista, R). es cierto si R unifica con una lista con los caracteres de 
Lista en minusculas.
*/

lower_case([], []).

lower_case([Cab|Resto], [I|R]):-
  lower_case(Resto, R), downcase_atom(Cab, I). /* Si es cierto tenemos toda la lista en minusculas */

















