%-------------------------------------------------------------
%---------------------Ejemplo des 1---------------------------
%-------------------------------------------------------------

% Reset:
clear; clc;

%Inicializaciones:
martillo_ejemplo = imread('martillo.jpg');

% ------------- Ejemplo de binarización:---------------------

size(martillo_ejemplo)
imhist(martillo_ejemplo) 
%A convertido la imagen a grises y ha calculado el histograma sobre los grises.

%Tenemos que definir un umbral para la binarizacion.
%help im2bw; % Ayuda sobre el comando de imagen a binaria
%{
    BW = im2bw(I,level)
    BW = im2bw(X,cmap,level)
    BW = im2bw(RGB,level)

%}

martillo_ejemplo_binario = im2bw(martillo_ejemplo, 0.7);
figure; imshow(martillo_ejemplo)
figure; imshow(martillo_ejemplo_binario)
figure; imshow(1 - martillo_ejemplo_binario)

% Podemos ver que el umbral puede variar de imagen a imagen, lo cual hace
% que para cada imagen pueda cambiar significativamente la binarizacion.
% Otsu intenta dar una forma sistematica para cualquier imagen.

martillo_ejemplo_binario = im2bw(martillo_ejemplo, graythresh(martillo_ejemplo));
figure; imshow(martillo_ejemplo)
figure; imshow(martillo_ejemplo_binario)

% Metodo (x > z)

martillo_ejemplo_binario = rgb2gray(martillo_ejemplo);
figure; imshow(martillo_ejemplo_binario<50)
figure; imshow(martillo_ejemplo_binario>50)

% Otros metodos.

[martillo_ejemplo_binario,map] = rgb2ind(martillo_ejemplo,20);
figure; imshow(martillo_ejemplo_binario, map); colorbar

% Metodo poco generalizable.

[martillo_ejemplo_binario_aux,map] = rgb2ind(martillo_ejemplo,20);
martillo_ejemplo_binario =  (martillo_ejemplo_binario_aux ==0) | (martillo_ejemplo_binario_aux ==2) | (martillo_ejemplo_binario_aux == 7);
figure; imshow(martillo_ejemplo_binario)

%--------------------------Fin del Ejemplo -------------------------