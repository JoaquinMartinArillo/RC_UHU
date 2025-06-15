:- use_module(library(clpfd)).
:- use_module(library(lists)).
isogram("").
isogram(String):-
    string_lower(String, Minus),
    string_codes(Minus, Codigos),
    delete(Codigos, 45, Guiones),
    delete(Guiones, 32, Espacios),
    all_distinct(Espacios).