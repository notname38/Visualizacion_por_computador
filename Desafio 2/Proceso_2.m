% Desafio 2 proceso 2
close all;
clc;
% Inicializaciones.
addpath("binarizados", "proceso2");
binario_1 = imread("binarizados/martillo1.jpg");
procesado_1 = imread("proceso2/martillo1.jpg");
binario_2 = imread("binarizados/martillo2.jpg");
procesado_2 = imread("proceso2/martillo2.jpg");
binario_3 = imread("binarizados/martillo3.jpg");
procesado_3 = imread("proceso2/martillo3.jpg");
binario_4 = imread("binarizados/martillo4.jpg");
procesado_4 = imread("proceso2/martillo4.jpg");
binario_5 = imread("binarizados/martillo5.jpg");
procesado_5 = imread("proceso2/martillo5.jpg");
binario_6 = imread("binarizados/martillo6.jpg");
procesado_6 = imread("proceso2/martillo6.jpg");
binario_7 = imread("binarizados/martillo7.jpg");
procesado_7 = imread("proceso2/martillo7.jpg");
binario_8 = imread("binarizados/martillo8.jpg");
procesado_8 = imread("proceso2/martillo8.jpg");
binario_9 = imread("binarizados/martillo9.jpeg");
procesado_9 = imread("proceso2/martillo9.jpeg");


% Visualizacion inicial:
figure(1);
subplot(6,3,1); imshow(binario_1);
subplot(6,3,2); imshow(binario_2);  
subplot(6,3,3); imshow(binario_3); 
subplot(6,3,4); imshow(procesado_1)
subplot(6,3,5); imshow(procesado_2)  
subplot(6,3,6); imshow(procesado_3) 

subplot(6,3,7); imshow(binario_4);
subplot(6,3,8); imshow(binario_5);
subplot(6,3,9); imshow(binario_6);
subplot(6,3,10); imshow(procesado_4)
subplot(6,3,11); imshow(procesado_5)  
subplot(6,3,12); imshow(procesado_6) 

subplot(6,3,13); imshow(binario_7);
subplot(6,3,14); imshow(binario_8); 
subplot(6,3,15); imshow(binario_9);
subplot(6,3,16); imshow(procesado_7)
subplot(6,3,17); imshow(procesado_8)  
subplot(6,3,18); imshow(procesado_9) 

aux = imclose((1-imbinarize(binario_1)),strel('square',9));
figure(2); 
subplot(1,2,1); imshow(1 - aux)
subplot(1,2,2); imshow(procesado_1)

