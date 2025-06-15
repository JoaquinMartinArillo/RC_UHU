my_append([], List2, List2).
my_append([Cab|Resto], List2, [Cab|R]):-
	my_append(Resto, List2, R).