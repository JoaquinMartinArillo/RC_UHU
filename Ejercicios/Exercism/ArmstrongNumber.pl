% armstrong_number(N).

armstrong_number(N):-
    number_string(N, Str),
    string_length(Str, L),
	numero_a_digitos(N, List),
    calcular(List, L, R),
    N = R.
	
calcular([], _, 0). 

calcular([Cab|Resto], Long, R) :-
    SolP is Cab ^ Long,
    calcular(Resto, Long, R1),
    R is R1 + SolP.
	
numero_a_digitos(Numero, Digitos) :-
    number_chars(Numero, Chars),            
    maplist(char_code, Chars, Codes),      
    maplist(codigo_a_digito, Codes, Digitos).
	
codigo_a_digito(Code, Digit) :-
    Digit is Code - 48. 