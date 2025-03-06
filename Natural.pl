/*
natural(N)
	Es cierto si N es un numero natural.
	
Principio de Inducción Matemática
	Queremos demostrar que una propiedad P es cierta para todos los elementos
	del conjunto S. (Aplicable a un programa con un conjunto de datos de entrada)
	
	- Los elementos de S tienen que ser ordenables (Tendré un elemento n0 que será
	  el más pequeño).
	  
	1) P(n0) es cierto. Lo que quiero demostrar es verdad para el primer obj.
	
	2) Si la propiedad para P(n-1) es cierta, entonces también lo es para P(n). (Siendo n > n0). 
	   Si P(n) es cierta, entonces P(n+1) también.

TODOS NUESTROS EJERCICIOS ESTAN BASADOS EN ESTE PRINCIPIO
*/

/* 
COSAS DE PROLOG

- Variables en MAYUSCULAS
 
- En prolog le damos la vuelta a las reglas 
	Si A -> B. En prolog ponemos B:- A. (NO PONGAS ESPACIO JUSTO ANTES DEL ":-"). 
	Las reglas acaban en "."
	
- El ambito de una variable es solo la linea en la que está
	Si tengo uso N en la linea 2 y una N en la 3, estas variables N son diferentes
	
- Para hacer operaciones aritmeticas debemos "declararlo", no se puede poner directamente
	Si quiero poner N-1, "N-1" no lo entiende, hay que poner "N2 is N-1" y usar la variable N2
	
- .pl es la extension de Prolog
- SWI-Prolog es el interprete de Prolog -> Para abrir un archivo: File -> Consult
*/

% Primer elemento
natural(1).

% Si natural(N-1) -> natural(N)
natural(N):- N > 1, N2 is N-1, natural(N2).


/* SECUENCIA DEL PROGRAMA
natural(5).
  5? -> 4? -> 3? -> 2? -> 1?
  Si <- Si <- Si <- Si <- Si
  Primero le preguntamos al 5 y como la regla nos dice que si el anterior lo es n tmb lo sera, le preguntamos al anterior.
  Esto se repite hasta llegar al primero (1) que si es, por lo que el siguiente tmb (asi hasta el 5).

natural(4.5)
  4.5? -> 3.5? -> 2.5? -> 1.5? -> 0.5?
  No   <- No   <- No   <- No   <- No
  Vuelve a pasar lo mismo solo que al llegar al 0.5, ni es el primero ni es mayor al primero => No




