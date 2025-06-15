% binary(Str, Dec).
binary(Str, Dec):- 
    string_chars(Str, List), % Pasamos a char
    maplist(binary, List), % Comprobamos si es binaria la lista
    chars2dec(List, Dec). % Transformamos a decimal
chars2dec([], 0).
chars2dec([Head|Tail], R):-
    chars2dec(Tail, Dec),
    number_chars(N, [Head]), 
    length(Tail, L), 
    R is Dec + N * 2 ^ L.
binary('0').
binary('1').