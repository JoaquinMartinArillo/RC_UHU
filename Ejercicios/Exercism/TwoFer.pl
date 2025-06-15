two_fer(Name, Dialogue) :-
    string_codes("One for ", Uno),
    string_codes(", one for me.", Dos),
    string_codes(Name, Nom),
    append(Uno, Nom, Temp),
    append(Temp, Dos, R),
    string_codes(Dialogue, R).
	
two_fer(Dialogue) :-
    two_fer("you", Dialogue).