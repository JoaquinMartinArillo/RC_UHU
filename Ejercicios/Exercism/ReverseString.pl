% string_reverse(S, Reversed).

string_reverse("","").

string_reverse(Str, Reversed):-
    string_codes(Str, Codes),
    my_reverse(Codes, R),
    string_codes(Reversed, R).
	
my_reverse([], []).

my_reverse([Cabeza|Resto], R2):- 
    my_reverse(Resto, R), 
	append(R, [Cabeza], R2).