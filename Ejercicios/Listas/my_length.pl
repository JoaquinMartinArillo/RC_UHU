my_length([], 0).
my_length([_|Resto], R2):- 
	my_length(Resto, R), R2 is R + 1.