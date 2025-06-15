/*latest(Scores, Latest).
personal_best(Scores, Best).
personal_top_three(Scores, TopThree).*/

latest([Cab|Resto], Ult):-
    reverse([Cab|Resto], [Ult|R2]).
	
personal_best([X], X).

personal_best([X1, X2|L], Y):-
	X3 is max(X1,X2),
	personal_best([X3|L], Y).
	
personal_top_three([], []).

personal_top_three([E], [E]).

personal_top_three(Score, [S1, S2, S3]):-
    length(Score, L),
    L >= 3,
    personal_best(Score, S1),
    select(S1, Score, ScoreS1),
    personal_best(ScoreS1, S2),
    select(S2, ScoreS1, ScoreS2),
    personal_best(ScoreS2, S3).
	
personal_top_three(Score, [S1, S2]):-
    length(Score, L),
    L = 2,
    personal_best(Score, S1),
    select(S1, Score, ScoreS1),
    personal_best(ScoreS1, S2).