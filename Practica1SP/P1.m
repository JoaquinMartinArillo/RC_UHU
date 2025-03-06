%Con la instrucción imfinfo de Matlab obtén información de la imagen de la práctica
%(anchura en píxeles, altura en píxeles, profundidad de bit).

imfinfo("P1.jpg");

%Lee la imagen y guárdala en una variable de Matlab (matriz) de nombre Imagen1.
%Para ello, haz uso de la instrucción imread.

Imagen1 = imread("P1.jpg");

%Con la instrucción whos obtén la siguiente información de la variable Matlab
%Imagen1: tipo de dato y rango.

whos Imagen1;

%Calcula el mayor elemento de la variable Imagen1 (máximo nivel de intensidad).
%Utiliza para ello la instrucción max.

Ej4 = max(Imagen1(:));

%Calcula en Matlab la imagen complementaria de Imagen1, denominándola
%Imagen2. Se debe calcular de forma independiente la imagen complementaria de
%cada canal de la Imagen1 y después, componer la Imagen2.

%1. Saco los canales de la imagen (RGB)
Im1R = Imagen1(:,:,1);
Im1G = Imagen1(:,:,2);
Im1B = Imagen1(:,:,3);

%2. Calculo los complementarios de cada uno
CIm1R = 255 - Im1R;
CIm1G = 255 - Im1G;
CIm1B = 255 - Im1B;

%3. Concateno los resultados para formar Imagen2
Imagen2 = cat(3, CIm1R, CIm1G, CIm1B);

%4. Las muestro
figure, imshow(Imagen1);
figure, imshow(Imagen2);

%Crea una matriz, de nombre Imagen3, con los niveles de rojo de la imagen Imagen1.
%Esta nueva matriz es una imagen en niveles de gris. Utiliza la función imadjust con
%la configuración ImagenSalida=imadjust(ImagenEntrada,[],[],gamma)
%para, mediante la modificación del parámetro gamma, obtener una imagen Imagen4
%más clara (gamma = 0.5, por ejemplo) y una imagen Imagen5 más oscura 
% (gamma = 1.5, por ejemplo) que Imagen3. Visualiza estas imágenes. Representa el
%histograma de estas tres imágenes mediante la función Matlab imhist. Interpreta
%cualitativamente los resultados de la operación realizada.

Imagen3 = Imagen1(:,:,1);

%Imagen clara
gamma = 0.5;
Imagen4 = imadjust(Imagen3,[],[],gamma);

%Imagen oscura
gamma = 1.5;
Imagen5 = imadjust(Imagen3,[],[],gamma);

%Mostrar las imagenes por separado
figure('Name', 'Imagen normal'), imshow(Imagen3);
figure('Name', 'Imagen clara'), imshow(Imagen4);
figure('Name', 'Imagen osucura'), imshow(Imagen5);

%Mostrar en una unica ventana (figure)
subplot(2,3,1), imshow(Imagen3);
subplot(2,3,2), imshow(Imagen4);
subplot(2,3,3), imshow(Imagen5);

subplot(2,3,4), imhist(Imagen3);
subplot(2,3,5), imhist(Imagen4);
subplot(2,3,6), imhist(Imagen5);

%Utiliza la función imabsdiff, para crear una nueva imagen Imagen6 que refleje el
%valor absoluto de la diferencia de Imagen4 e Imagen5. Interpreta los resultados.
%Realiza la misma operación sin utilizar la función imabsdiff y comprueba que
%obtienes los mismos resultados. Para ello, implementa y utiliza la siguiente función
%que permite saber si dos matrices son iguales:

%Implementacion
Imagen6 = abs(Imagen4-Imagen5);
%Funcion
Imagen7 = imabsdiff(Imagen4,Imagen5);

%Ejecuto la funcion de igualar matrices
addpath('Funciones');
FuncionEj5(Imagen6,Imagen7);

rmpath('Funciones');

imshow(Imagen6);