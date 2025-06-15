% hamming_distance(Str1, Str2, Dist).

hamming_distance("A","A", 0).
hamming_distance("C","C", 0).
hamming_distance("G","G", 0).
hamming_distance("T","T", 0).

hamming_distance(Str1, Str2, R):-
    string_length(Str1, L1),
    string_length(Str2, L2),
    L1 =:= L2,
    string_codes(Str1, Codes1),
    string_codes(Str2, Codes2),
    hamming_distance_list(Codes1, Codes2, R).
	
hamming_distance_list([],[],0).

hamming_distance_list([Cab1|Resto1], [Cab2|Resto2], Sol):-
    iguales(Cab1, Cab2, Sum),
    hamming_distance_list(Resto1, Resto2, R),
    Sol is Sum+R.
	
iguales(Cab1, Cab2, 0):-
    Cab1 =:= Cab2.
	
iguales(Cab1, Cab2, 1):-
    Cab1 =\= Cab2.