% flatten_list(Xs, XsFlattened).

flatten_list([], []).

flatten_list([Lista|Resto], R):-
    flatten_list(Resto, RR),
    flatten_list(Lista, CabF),
    append(CabF, RR, R).
	
flatten_list([Cab|Resto], [Cab|R]):-
    Cab \= null,
    Cab \= nil,
    flatten_list(Resto, R).
    
flatten_list([null|Resto], R):-    
    flatten_list(Resto, R).
flatten_list([nil|Resto], R):-    
    flatten_list(Resto, R).