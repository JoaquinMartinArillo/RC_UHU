% ordena_insercion(+Lista, -ListaR). es cierto cuando ListaR unifica con una lista
% que contiene los mismos elementos que Lista ordenados de menor a mayor

% inserta_en_list_ord(+Elem, +Lista, -ListaR).
% es cierto cuando ListaR unifica con una lista que contiene los elementos de la lista
% ordenada Lista, con el elemento Elem insertado de forma ordenada

ordena_insercion([], []).

ordena_insercion([Cab|Resto], R2):-
	ordena_insercion(Resto, R),
	inserta_en_list_ord(Cab, R, R2).
	
	
inserta_en_list_ord(Elem, [], [Elem]).

inserta_en_list_ord(Elem, [Cab|Resto], [Elem, Cab|Resto]):-
	Elem =< Cab.
	
inserta_en_list_ord(Elem, [Cab|Resto], [Cab|R]):- Elem > Cab,
	inserta_en_list_ord(Elem, Resto, R).
	
% En R tendremos el Elemento insertado en su sitio en Resto

/*
inserta_en_list_ord(Elem, [Cab1|Resto], ListaOrd):-
	sacar_elemento(Resto, Cab2),
	Cab1 < Elem,
	Cab2 > Elem,
	append([Cab1 Elem], [Resto], ListaOrd).
	
sacar_elemento([],[]).

sacar_elemento([Cab2|Resto], Cab2).*/