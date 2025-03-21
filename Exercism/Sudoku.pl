:- use module_library(clfd
/*
sudoku(matriz).
  es cierto si matriz unifica con una cuadrícula de 9 x 9 espacios, dividido en 9 bloques
  de 3x3 casillas, con los numeros del 1 al 9, con numeros distintos por filas y columnas y distintos por cada bloque 3x3
*/

sudoku(Rows) :-
        length(Rows, 9),                                /* Creada una fila de 9 */
        maplist(same_length(Rows), Rows),               /* Creada la matriz 9x9 */
        append(Rows, Vs), Vs ins 1..9,                  /* Dandole el rango 1-9 a las casillas en una sola lista */
        maplist(all_distinct, Rows),                    /* Haciendo que todas las filas de la matriz sean distintas */
        transpose(Rows, Columns),                       /* Transpuesta */ 
        maplist(all_distinct, Columns),                 /* Ahora comprueba que cada columna es diferente tmb */
        Rows = [As,Bs,Cs,Ds,Es,Fs,Gs,Hs,Is],
        blocks(As, Bs, Cs),
        blocks(Ds, Es, Fs),
        blocks(Gs, Hs, Is).

blocks([], [], []).
blocks([N1,N2,N3|Ns1], [N4,N5,N6|Ns2], [N7,N8,N9|Ns3]) :-
        all_distinct([N1,N2,N3,N4,N5,N6,N7,N8,N9]),
        blocks(Ns1, Ns2, Ns3).

/*
FUNCIONES USADAS
- length(Lista, x) -> Genera una lista de x elementos.
    length(Lista, 3).
      Lista = [_, _, _].

- same_length(?Lista1, ?Lista2) -> nos da una lista del mismo tamaño que le pasemos como parametro.
    same_length([1,2,3], List2).
      List2 = [_, _, _].

- maplist() -> sirve para aplicar a todos los elementos de una lista algo
    maplist(plus(1), [1,2,3], R).
      R = [2,3,4].
    maplist(plus, [1,1,1], [1,2,3], R).
      R = [2,3,4].

- append\2 -> Concatena una lista de listas (una matriz transformada a una unica lista)

- all_distint -> Todos los elementos de una lista deberan de ser distintos
*/












  
