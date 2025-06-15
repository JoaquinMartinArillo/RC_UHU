grafo1(
	g([a, b, c, d], [a(a,b), a(a,c), a(c,d), a(c,b)])
).

camino(_, Ini, Ini, _, [Ini]).

camino(g(Vertices, Aristas), Ini, Fin, Visitados, [Ini|Cam]):-
	conectados(g(Vertices, Aristas), Ini, TMP),
	\+ member(TMP, Visitados),
	camino(g(Vertices, Aristas), TMP, Fin, [TMP|Visitados], Cam).    

conectados(g(_, Aristas), Ini, Fin):-
	member(a(Ini,Fin), Aristas).   
	
conectados(g(_, Aristas), Ini, Fin):-
	member(a(Fin,Ini), Aristas).