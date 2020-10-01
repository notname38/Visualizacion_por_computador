%% Desafio 2 Proceso 3
% Set de imagenes: 1,3,5,7,9
% Operaciones realizadas: 
%   Strel de un tamaño n con un disco.
%   imerode con el strel. --> Las imagenes parecen "vacias".
%   Si nos fijamos, tenemos el interior con el erode que les faltan a las 
%   imagenes.
%   Asique solo hay que restar.

%% Inicializaciones:
close all;
clc;
clear;
addpath("binarizados", "proceso1");
binario_1 = imread("binarizados/martillo1.jpg");
procesado_1 = imread("proceso4/martillo1.jpg");
binario_3 = imread("binarizados/martillo3.jpg");
procesado_3 = imread("proceso4/martillo3.jpg");
binario_5 = imread("binarizados/martillo5.jpg");
procesado_5 = imread("proceso4/martillo5.jpg");
binario_7 = imread("binarizados/martillo7.jpg");
procesado_7 = imread("proceso4/martillo7.jpg");
binario_9 = imread("binarizados/martillo9.jpeg");
procesado_9 = imread("proceso4/martillo9.jpeg");

% Valor de n:
n = 6; % Rangos en los que hay una n buena = [5,..,10]

%% Calculo:

aux1 = binario_1 - imerode(binario_1, strel("disk", n));
aux3 = binario_3 - imerode(binario_3, strel("disk", n));
aux5 = binario_5 - imerode(binario_5, strel("disk", n));
aux7 = binario_7 - imerode(binario_7, strel("disk", n));
aux9 = binario_9 - imerode(binario_9, strel("disk", n));

%% Calculo del error:
error1 = sum(sum(1-(aux1 == procesado_1))); 
error3 = sum(sum(1-(aux3 == procesado_3))); 
error5 = sum(sum(1-(aux5 == procesado_5))); 
error7 = sum(sum(1-(aux7 == procesado_7))); 
error9 = sum(sum(1-(aux9 == procesado_9)));

%% Visualizacion de resultados:

figure(1);
subplot(2,5,1); imshow(aux1); title(error1)
subplot(2,5,2); imshow(aux3); title(error3) 
subplot(2,5,3); imshow(aux5); title(error5)  
subplot(2,5,4); imshow(aux7); title(error7)
subplot(2,5,5); imshow(aux9); title(error9) 
subplot(2,5,6); imshow(procesado_1) 
subplot(2,5,7); imshow(procesado_3) 
subplot(2,5,8); imshow(procesado_5)  
subplot(2,5,9); imshow(procesado_7) 
subplot(2,5,10); imshow(procesado_9) 