permutacion([],[]).
permutacion(L1, [X|L2]):-
	select(X, L1, L3),
	permutacion(L3, L2).
	
% permutation(L2,L1)