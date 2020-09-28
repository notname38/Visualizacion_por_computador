 %{ -- 28/09/2020 13:56 -- }


close all;
clc;

load clown
x = ind2gray(X,map);
max(x(:))

% Filtrado sin normalizar
filtro = ones(11);
xF = filter2(filtro, x);
figure; imshow(xF)

% Normalizando
filtro2 = ones(11)/(11^2);
xF2 = filter2(filtro2, x);
figure; imshow(xF2)

filtro3 = ones(25)/(25^2);
xF3 = filter2(filtro3, x);
figure; imshow(xF3)

% special Gausian
filtro4 = fspecial('gaussian', 99,11);
figure; surf(filtro4)

%FIltros pasabajo: todos los coeficientes positivos
xF4 = filter2(filtro4, x);
sum(sum(filtro4))
figure; imshow(xF4)

% Transformadas
filtroTrasnformado = fft2(filtro4);
figure; surf(abs(filtroTrasnformado))
figure; surf(abs(fftshift(filtroTrasnformado)))

mascara = zeros(301,301);
mascara(150 - 15:150 + 15, 150 - 15:150 + 15) = filtro4(49 - 15:49 +15, 49 - 15:49 +15);
surf(mascara)
figure; surf(abs(fftshift(fft2(mascara))))

% Ejemplo  eliminacion de ruido
lena = rgb2gray(imread('lena_std.tif'));
ruido = randn(size(lena));
lena_ruidosa = lena+uint8(ruido*25);

figure; 
subplot(1,2,1); imshow(lena)
subplot(1,2,2); imshow(lena_ruidosa)

nivel_de_ruido = norm(single(lena) - single(lena_ruidosa))
filtroRuido = fspecial('gaussian',9,1);
lena_filtrada = imfilter(lena_ruidosa, filtroRuido);

subplot(01,3,1); imshow(lena)
subplot(1,3,2); imshow(lena_ruidosa)
subplot(1,3,3); imshow(lena_filtrada)

residuo = lena - lena_filtrada;
max(residuo(:))
norm(single(residuo))

    % PREGUNTA: Al hacer imshow(residuo*20) % Porque se ven esas lineas?

residuo2 = single(lena) - single(lena_filtrada);
norm(single(residuo)) % Es PEOR!

    % Al calcular la imagen, los contornos resaltados aparecen porque 
    % estamos restando la imagen y la imagen suavizada.

lena_filtrada_2 = medfilt2(lena_ruidosa, [9 9]); % Filtro de la mediana

figure;
subplot(1,4,1); imshow(lena); title("Original")
subplot(1,4,2); imshow(lena_ruidosa); title("Ruidosa")
subplot(1,4,3); imshow(lena_filtrada); title("Gaussiana")
subplot(1,4,4); imshow(lena_filtrada_2); title("Mediana")

residuo3 = single(lena) - single(lena_filtrada_2);
norm(single(residuo2))

% Filtros Laplacianos
filtro4 = fspecial('laplacian');
figure;
surf(filtro4)

    % Filtros pasaalta resaltan lo no suave o los picos.
lena_filtrada_3 = imfilter(lena_ruidosa, filtro4);
figure; imshow(lena_filtrada_3)

% Filtro Sobel
filtro5 = fspecial('sobel'); % Por columnas
lena_filtrada_4 = imfilter(lena_ruidosa, filtro5);
figure; imshow(lena_filtrada_4)
filtro5_aux = imrotate(filtro5, 90); % Por filas
lena_filtrada_5 = imfilter(lena_ruidosa, filtro5_aux);
figure; imshow(lena_filtrada_5)

