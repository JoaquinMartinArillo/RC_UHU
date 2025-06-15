my_reverse([], []).
my_reverse([Cabeza|Resto], R2):- my_reverse(Resto, R), 
	append(R, [Cabeza], R2).