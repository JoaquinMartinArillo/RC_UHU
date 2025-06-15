% convert(N, Sounds).

convert(Num, Str):-
    divisible3(Num, R3),
    divisible5(Num, R5),
    divisible7(Num, R7),
    append(R3, R5, RR),
    append(RR, R7, R),
    R \= [],
    string_codes(Str, R).
	
convert(Num, Str):-
    divisible3(Num, R3),
    divisible5(Num, R5),
    divisible7(Num, R7),
    append(R3, R5, RR),
    append(RR, R7, R),
    R = [],
    number_string(Num, Str).
    
divisible3(Num, []):-
    N is Num mod 3,
    N \= 0.
    
divisible3(Num, R):-
    N is Num mod 3,
    N = 0,
    string_codes("Pling", R).
	
divisible5(Num, []):-
    N is Num mod 5,
    N \= 0.
	
divisible5(Num, R):-
    N is Num mod 5,
    N = 0,
    string_codes("Plang", R).
	
divisible7(Num, []):-
    N is Num mod 7,
    N \= 0.
	
divisible7(Num, R):-
    N is Num mod 7,
    N = 0,
    string_codes("Plong", R).