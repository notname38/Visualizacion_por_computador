%% DESAFIO 7: Deteccion de bordes.
clc; close all; clear;

%% Carga e inicializaciones.
flores=imread('flores.jpg');
flores=imresize(flores,0.1);

% Separamos las capas.
flores_r = flores(:,:,1);
flores_g = flores(:,:,2);
flores_b = flores(:,:,3);

% Valores para el Filtro:
a = 45; 
b = 5; 

%% Deteccion de bordes:
funcion=fspecial('log',a,b);

bordes_r = conv2(double(flores_r), funcion,'same');
bordes_g = conv2(double(flores_g), funcion,'same');
bordes_b = conv2(double(flores_b), funcion,'same');

bordes_por_max = bordes_r + bordes_b + bordes_g;
bordes_por_max=bordes_por_max > 0;
bordes_por_max=bordes_por_max-imerode(bordes_por_max,ones(3));
%%%bordes_por_max = sum(sum(bordes_por_max)) > 100; %%% Tonteria

%% Overlay:
c3=uint8(ind2rgb(bordes_por_max*255,gray(256)))*255;
% c3=uint8(bwdist(flores))+uint8(c3*255); % Buen intento xd

%% Visualizacion:
figure; 
subplot(1,2,1); imshow(flores+c3); title("Bordes obtenidos:");
subplot(1,2,2); imshow(imread('resultado.png')); title("Bordes objetivo: ");

