% ----------------------------------------------------
% ordena_quick(+Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista que
% contiene los mismos elementos que Lista ordenados
% de menor a mayor.
%
% Usaremos como pivote el primero
% ----------------------------------------------------

ordena_quick([], []).

ordena_quick([Cab|Resto], R):-
	divide(Cab, Resto, Men, May),
	ordena_quick(Men, RMenores),
	ordena_quick(May, RMayores),
	append(RMenores, [Cab|RMayores], R).
	
divide(_, [], [], []).
	
divide(Piv, [Cab|Resto], [Cab|Men], May):-
	divide(Piv, Resto, Men, May),
	Cab =< Piv.
	
divide(Piv, [Cab|Resto], Men, [Cab|May]):-
	divide(Piv, Resto, Men, May),
	Cab > Piv.