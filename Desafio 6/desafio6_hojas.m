% Desafio 6: Flores.
clc; close all; clear;
rng(1) % Porsi os cambia mucho entre ejeccuciones

%% Inicializaciones:
x = imread('hojas.jpg');
xa = rgb2lab(x);
pixels=reshape(xa,[size(xa,1)*size(xa,2),3]);
pixels=pixels(:,2:3); % Esto esta sacado de internet


%% Clustering
% No: tarda una burrada
% net = selforgmap([3 3]);

% Con K-Means
classes = kmeans (pixels,5);
% This is an awfull way of doing it. Too bad!
classes(classes == 1) = 0;
classes(classes == 2) = 1;
classes(classes == 3) = 0;
classes(classes == 4) = 0;
classes(classes == 5) = 0;


segm=reshape(classes,[size(x,1),size(x,2)]); 	% Convierte el resultado en imagen

%% Visualizacion
resultado = x;
resultado_enmascarado = resultado.*uint8(segm);
figure; imshow(resultado_enmascarado);
% Se ve mierda pero no se como quitarla. Too bad!