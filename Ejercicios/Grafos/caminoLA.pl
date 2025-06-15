grafo1(
	g([a, b, c, d], [a(a,b), a(a,c), a(c,b), a(c,d)])
).

grafo2(
	g([a,b,c,d,e], [a(a,b), a(a,c), a(b,c), a(b,d), a(d,e), a(e,c), a(d,c), a(b,e)])
).

/* camino de las aristas visitadas grafo no dirigido */

camino(G, Ini, Fin, Visitados, [a(Ini, Fin)]):- 
	\+ member(a(Ini,Fin), Visitados),
	conectados(G, Ini, Fin).

camino(g(Vertices, Aristas), Ini, Fin, Visitados, [a(Ini,TMP)|Cam]):-
	conectados(g(Vertices, Aristas), Ini, TMP),
	\+ member(a(Ini,TMP), Visitados),
	camino(g(Vertices, Aristas), TMP, Fin, [a(Ini,TMP), a(TMP, Ini)|Visitados], Cam).    

conectados(g(_, Aristas), Ini, Fin):-
	member(a(Ini,Fin), Aristas).   
	
conectados(g(_, Aristas), Ini, Fin):-
	member(a(Fin,Ini), Aristas).