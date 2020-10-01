%% -- Desafio 3 --
%% Objetivos: 
% Probar distintos valores de P y N y distintas configuraciones
% Ver: Proceso de intoduccion del ruido.
% Conseguir el mismo Error 
%% Pistas:
% O aplicas 1 O aplicas los 4 de introduccion de ruido
% Espectro_2 tiene 4
%% Codigo:
close all;
img_objetivo = imread("lena_desafio_3_3.png");
espectro_objetivo = imread("espectro_3.png");

x=rgb2gray(imread('lena_std.tif')); 
x=double(x);
x=x/max(x(:)); %Pasada al intervalo [0,1]

xt=fft2(x); % Transformada de furier
p=75.5; n=2; % P es la posicion y N es la anchura
ruido=1e5;  % Amplitud del ruido
xtr=xt;


% posicion(es) donde se encuentra(n) la(s) interferencia(s): descomentar
% Cuanto mas me acerque al centro estoy tocando las mas altas frecuencias
xtr(512-(p+n):512-p,512-(p+n):512-p)=ruido; 
xtr(p:p+n,512-(p+n):512-p)=ruido;
xtr(512-(p+n):512-p, p: p+n)=ruido;
xtr(p:(p+n),p:(p+n))=ruido;
%figure; imshow(fftshift(log(abs(xtr))),gray(12))
xr=abs(ifft2(xtr)); % Calcular el valos absoluto de 
                    % la inversa de la trasnformada

% % % % % % % imwrite(xr,'lena_desafio_3.png')

nx=img_objetivo; % x es el numero del ejemplo
nx=double(nx);
nx=nx/max(nx(:));

%% Visualizacion:
max(xr(:))
nxt=fft2(nx); 
xrt=fft2(xr);

figure;
subplot(2,2,1);
imshow(abs(xr)); title("Lena")
subplot(2,2,2);
imshow(img_objetivo); title("Lena objetivo")
subplot(2,2,3); 
imshow(fftshift(log(abs(xrt))),gray(12))
subplot(2,2,4);
imshow(espectro_objetivo)

%% Resultados:
%{
Lena 0:

p=200; n=2;
filtros 1, 0, 0, 0

Lena 1:

p=20; n=2;
filtros 1, 0, 0, 0

Lena 3:

p=50; n=2;
filtros 1, 1, 1, 1

Lena 4:

p=75.5; n=2;
filtros 1, 1, 1, 1



%}

 