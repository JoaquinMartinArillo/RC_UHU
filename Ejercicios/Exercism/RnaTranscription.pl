% rna_transcription(Rna, Dna).
rna_trans_code(67, 71).
rna_trans_code(71, 67).
rna_trans_code(84, 65).
rna_trans_code(65, 85).

rna_transcription("C", "G").
rna_transcription("G", "C").
rna_transcription("T", "A").
rna_transcription("A", "U").

rna_transcription(String, Solution):- 
    string_length(String, L), L > 1,
    string_codes(String, Codes), rna_trans_list(Codes, R),
    string_codes(Solution, R).
	
rna_trans_list([], []).

rna_trans_list([Cab|Resto], [RCab|RResto]):- 
    rna_trans_list(Resto, RResto), 
    rna_trans_code(Cab,RCab). 