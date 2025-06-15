% leap(0).

leap(Num):-
    divisible(Num, 4),
    \+ divisible(Num, 100).
	
leap(Num):- 
    divisible(Num, 100),
    divisible(Num, 400).
	
divisible(Num, Div):-
    R is Num mod Div,
    R is 0.