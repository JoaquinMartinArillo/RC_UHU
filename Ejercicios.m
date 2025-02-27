
% Ejercicio1: 
% a) Crea un vector V de 10 elementos con números enteros aleatorios entre 0 y 10.

V = round(10*rand(1,10))

% b) Genera un vector binario donde el 1 binario señala a los elementos
% del vector que son menores o iguales a 5.

Vb = V <= 5

% c) Encuentra con la función find las posiciones en el vector de esos elementos

find(Vb) %Find te da las posiciones de un vector binario cuyo valor = 1
find(V <= 5)

% d) Encuentra la posición del valor máximo de V

[Vmax, posVMax] = max(V) %Nos devuelve el valor mas alto en un vector (en matriz es diferente)
posVmax = find(V==max(V)) % Al hacer V==max(V) estas creando un vector con las pos que tienen el valor maximo

% e) Ordena los elmentos del vector, de mayor a menor, obteniendo las
% posiciones donde se encuentran en V
sort(V) %Ordenado de menor a mayor
sort(V, 'ascend')

[Vord, posVord] = sort(V, 'descend') %Ordenado de mayor a menor
[V; Vord; posVord] %Muestro el vector normal, ordenado y las posiciones de cada numero del V original

[V;sort(V, 'descend')] %Solucion mostrando del vector normal y ordenado


% Ejercicio2: 
% a) Crea una matriz M de 2 filas y 3 columnas con números enteros aleatorios
% entre 0 y 10.

M = round(10*rand(2,3));

% b) Genera una matriz binaria de las mismas dimensiones, que indique los 
% valores en M que tienen valores entre 3 y 8

%1º Le damos las dimensiones de la matriz M a otra matriz nueva
[nF, nC] = size(M);
Mb = false(nF,nC);
%2º Recorremos por fila/columna la matriz para comprobar sus valores
%(programacion normal)
for f = 1: nF
    for c = 1: nC
        if (M(f,c) >= 3 && M(f,c) <= 8)
            Mb(f,c) = true;
        end
    end
end   
%2º Recorremos por fila/columna la matriz para comprobar sus valores
%(programacion matlab)
Mb = M>= 3 & M<=8;

%3º Usamos find para buscar los valores que han cumplido la condicion
[f, c] = find(Mb); %Esta vez al tratarse de una matriz le pedimos 2 cosas: fila y columna (dos matrices de 1 columna)
%RECUERDA: Find busca en las mastrices por columnas


% c) Calcula la media de esos elementos

%Programacion normal

[f, c] = find(Mb);
num1Binarios = length(f);
media = 0;
for i=1:length(f)
    media = media + M(f(i), c(i));    
end

media = media/num1Binarios;

%Programacion en Matlab

M(Mb) %Si le pasamos una matriz binaria de las mismas direcciones accederá a las posiciones que tengan valor = 1
media = mean(M(Mb));
media = mean(M( M>= 3 & M <= 8 )); 

% d) Reemplaza el valor de esos elementos, asignándoles un valor -1

M(Mb) = -1;

% Ejercicio3:
% a) Genera dos matrices A y B, 5x5, de números enteros aleatorios entre 0 y 10

A = round(10*rand(5,5));
B = round(10*rand(5,5));

% b) Calcula la media de los valores de A en aquellos puntos donde B es > 5

Ab = mean(A(B > 5)) %Se puede hacer porque A y B TIENEN LA MISMA DIMENSIÓN


% Ejercicio4:
% a) Generar una matriz A, 10x10, de números enteros aleatorios entre 0 y 5 

A = round(5*rand(10,10));

% b) Guarda en un vector fila, llamado valoresA, los valores distintos
% que aparecen en A 

valoresA = unique(A); %Unique nos da un vector COLUMNA de los valores sin repetir 
valoresA = (unique(A))'; %Asi nos lo da en un vector fila, haciendo la transpuesta usando el apostrofe

% c) Inicializa con ceros un vector fila, llamado conteoValores,
% de tantos elementos como valores distintos haya en A

conteoValores = zeros(size(valoresA)); %Matriz solución

% d) Guarda en las posiciones de conteoValores el número de veces que
% aparece en A cada uno de sus posiles valores

for i=1:length(valoresA) %O i = valoresA y recorrera el vector A
    valorA_i = valoresA(i);
    Mb = A == valorA_i;
    conteoValores(i) = sum(Mb(:));
end

conteoValores

% e) Representa con stem, valoresA frente a conteoValores

stem(valoresA, conteoValores, '.r'); %Es igual que plot
xlabel('Valores posibles de A');
ylabel('Numero de veces que aparece cada valor en A');
xticks(valoresA) %Solo aparece en el eje x los valores de A
yticks(unique(conteoValores)) % Que solo se vea los valores de conteoValores
grid on %Activo la cuadricula
title('Histograma de valores de A')

g = imhist(A); %Funcion del histograma


% Ejercicio5:

% Función: varLogica = funcion_compara_matrices(m1,m2)

% Diseñar una función que reciba como entradas dos matrices de la misma
% dimensión. La función debe devolver una variable lógica, con true si las
% matrices son iguales y false  en caso contrario.
% Para ello la función deberá:
% - Calcular una matriz diferencias (resta de las dos matrices de entrada)
% - Calcula el valor máximo y mínimo de esta matriz diferencias
% - Si el valor máximo es igual al valor mínimo y cualquiera de ellos tiene
% el valor 0, entonces las matrices de entrada son iguales

% Observación: si las matrices no tienen la misma dimensión la función
% únicamente debe advertir por el command window este hecho (para ello,
% puedes utilizar la función instrucción: disp('cadena de texto a mostrar').

% Guardar la función en un directorio llamado funciones, y, añadiendo el
% path a este directorio, llámala en distintas situaciones para comprobar
% su correcto funcionamiento.