triangle(A,B,C, "equilateral"):-
    esTriangulo(A,B,C),
    Lados = [A,B,C],
    msort(Lados, LadosOrd),
    comprime(LadosOrd, R),
    length(R, 1).  
triangle(A,B,C, "isosceles"):-
    esTriangulo(A,B,C),
    Lados = [A,B,C],
    msort(Lados, LadosOrd),
    comprime(LadosOrd, R),
    length(R, 1).  
triangle(A,B,C, "isosceles"):-
    esTriangulo(A,B,C),
    Lados = [A,B,C],
    msort(Lados, LadosOrd),
    comprime(LadosOrd, R),
    length(R, 2).
triangle(A,B,C, "scalene"):-
    esTriangulo(A,B,C),
    Lados = [A,B,C],
    msort(Lados, LadosOrd),
    comprime(LadosOrd, R),
    length(R, 3).
esTriangulo(A, B, C):-
    A > 0, B > 0, C > 0,
    A + B >= C,
    A + C >= B,
    B + C >= A.
comprime([], []).
comprime([Elem], [(Elem,1)]).
comprime([Cab1, Cab1|Resto], [(Cab1,N2)|R]):-
	comprime([Cab1|Resto], [(Cab1,N)|R]), N2 is N+1.  
 comprime([Cab1, Cab2|Resto], [(Cab1,1)|R]):- Cab1 \= Cab2,
	comprime([Cab2|Resto], R).