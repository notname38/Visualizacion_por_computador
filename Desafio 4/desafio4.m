%% -- Desafio 4 --
%% Objetivos: 
% tratar de adivinar el kernel de convolución 
% que produce las imágenes tras las rotaciones . 
% tratar de adivinar el kernel de convolución que 
% produce las imágenes tras las rotaciones . 
%% Pistas:
% Suma de los coeficientes tiene que ser 0 en pasaalta
% Asegurar que x es un int8
%% Codigo:
close all;
x = imread("lena_std.tif");
x = im2gray(x);



%f=[-1 -1 -1;-1 8 -1; -1 -1 -1];
f = imrotate(fspecial('sobel'),90);
sum(f)
%%% definir f como un filtro pasa-alta, hint: es una linea de codigo



figure;

subplot(2,5,1)
imshow("lena_std.tif")
subplot(2,5,6)
imshow("lena_std.tif")

subplot(2,5,2)
imshow(conv2(single(x),f)+100,gray(256))  
f45=imrotate(f,45,'crop');
subplot(2,5,7)
imshow("lena_res_45.png")

subplot(2,5,3)
imshow(conv2(single(x),f45)+100,gray(256))
f90=imrotate(f,90,'crop');
subplot(2,5,8)
imshow("lena_res_90.png")

subplot(2,5,4)
imshow(conv2(single(x),f90)+100,gray(256))
f135=imrotate(f,135,'crop');
subplot(2,5,9)
imshow("lena_res_135.png")

subplot(2,5,5)
imshow(conv2(single(x),f135)+100,gray(256))
f180=imrotate(f,180,'crop');
subplot(2,5,10)
imshow("lena_res_180.png")

%{
imshow(conv2(single(x),f180)+100,gray(256))
f215=imrotate(f,215,'crop');
figure
imshow(conv2(single(x),f215)+100,gray(256))
%}