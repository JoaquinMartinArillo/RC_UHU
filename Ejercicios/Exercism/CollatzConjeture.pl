% collatz_steps(N, Steps).

collatz_steps(1, 0).

collatz_steps(N, Pasos):-
    N > 1,
    par(N),
    N2 is N div 2,    
    collatz_steps(N2, P),
    Pasos is P + 1.
	
collatz_steps(N, Pasos):-
    N > 1,
    impar(N),
    NX is N * 3,
    N2 is NX + 1,
    collatz_steps(N2, P),
    Pasos is P + 1.
	
par(N):- 
    X is N mod 2,
    X = 0.
	
impar(N):- 
    X is N mod 2,
    X = 1.