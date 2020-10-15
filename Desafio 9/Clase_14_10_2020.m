%% Clase del 14/10/2020, inicio desafio 9
% PRerequisito: Add to path la carpeta de DRIVE_grupo

imds = imageDatastore('DRIVE-grupo-ISI-Utrech\test\images');
while hasdata(imds)
    x=read(imds);
    figure; imshow(x);
end

close all;
x21_training = imread('DRIVE-grupo-ISI-Utrech\training\images\21_training.tif');
figure; imshow(x21_training)
[x, mapa] = rgb2ind(x21_training, 4);
figure; imshow(x, mapa); colorbar

x = rgb2gray(x21_training);
figure; imshow(histeq(x21_training));
figure; imshow(fibermetric(x,5));
figure; imshow(fibermetric(x,5)>0);

B = fibermetric(x,5);
figure; imshow(B>0)
figure; imshow(imbinarize(B))
figure; imshow(B>0.2)
figure; imshow(edge(x, 'Canny',0,5))
borde = ind2rgb(edge(x, 'Canny',0,5), gray);
max(borde(:))
figure; imshow(x21_training+uint8(borde*255))
figure; imshow(x21_training+uint8(edge(x, 'Canny',0,1)*255))

%Hay que jugar con la varianza
