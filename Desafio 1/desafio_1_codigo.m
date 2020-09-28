%-------------------------------------------------------------
%-------------------------DESAFIO 1---------------------------
%-------------------------------------------------------------

% Reset:
clear; clc; close all;

%Inicializaciones:
martillo_10 = imread('martillo10.jpg');
martillo_11 = imread('martillo11.jpg');
martillo_12 = imread('martillo12.jpg');

% Metodo de operaciones directas (x<z):
martillo_10_binario = rgb2gray(martillo_10);
martillo_11_binario = rgb2gray(martillo_11);
martillo_12_binario = rgb2gray(martillo_12);

umbral = (200-100).*rand(1,1) + 100 %Estamos eligiendo un umbral aleatorio entre 100 y 200.

figure(1); imshow(martillo_10_binario < umbral)
figure(2); imshow(martillo_11_binario < umbral)
figure(3); imshow(martillo_12_binario < umbral)

% Esto demuestra como este metodo varia mucho dependiendo de la
% imagen y del umbral, dado un umbral aleatorio.

% Con otzu:

martillo_10_umbral = graythresh(martillo_10)
martillo_11_umbral = graythresh(martillo_11)
martillo_12_umbral = graythresh(martillo_12)

figure(1); imshow(im2bw(martillo_10, martillo_10_umbral))
figure(2); imshow(im2bw(martillo_11, martillo_11_umbral))
figure(3); imshow(im2bw(martillo_12, martillo_12_umbral))

% Si nos fijamos bien, otzu normaliza los umbrales entre [0,1]










