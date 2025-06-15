/*
Problema de las jarras
Tenemos 2 jarras de 3 y 5 L inicialmente vacias y queremos tener en la jarra de 
5L exactamente 4L.

	1. Definir el estado generico
	2. Definir Ei y Ef
	3. Definir las acciones
	4. Calcular el camino
*/

/* Definicion de estado -> e(L3, L5). */

/* Estado inicial = e(0,0), EstadoF = e(_,4). */

/* Movimientos */
mov(llenar_3, estado(_, L5), estado(3, L5)).
mov(vaciar_3, estado(_, L5), estado(0, L5)).

mov(llenar_5, estado(L3, _), estado(L3, 5)).
mov(vaciar_5, estado(L3, _), estado(L3, 0)).

/* Llenar 3 a 5, 2 casos -> Cabe todo de 3 o no */
mov(pasar_3a5, estado(L3, L5), estado(0, Suma)):- 
	Suma is L3 + L5, Suma =< 5.

mov(pasar_3a5, estado(L3, L5), estado(Resto, 5)):- 
	Suma is L3 + L5, Suma > 5, 
	Resto is Suma - 5.	

/* Llenar 5 a 3, 2 casos -> Cabe todo de 5 o no */
mov(pasar_5a3, estado(L3, L5), estado(Suma, 0)):- 
	Suma is L3 + L5, Suma =< 3.

mov(pasar_5a3, estado(L3, L5), estado(3, Resto)):- 
	Suma is L3 + L5, Suma > 5, 
	Resto is Suma - 3.	

/* Camino -> camino(Ei, Ef, Visitados, Camino). Visitados son los estados (En ESTE CASO no deben repetirse) */

camino(Ei, Ei, _, []).

camino(Ei, Ef, Visitados, [Mov|Camino]):-
	mov(Mov, Ei, ETMP), 
	\+ member(ETMP, Visitados),
	camino(ETMP, Ef, [ETMP|Visitados], Camino).