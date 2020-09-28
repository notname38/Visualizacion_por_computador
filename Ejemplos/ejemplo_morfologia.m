% Clase del 21/09/2020
% Tema: Morfologia no lineal. Erosion y dilatacion. Filtros morfologicos. Strel.

x = imread('martillo10.jpg');
xb = imbinarize(rgb2gray(x));
figure(1); imshow(1 - xb)

%Dilatacion: 
xbD=imdilate((1-xb),ones(5));
figure(2); imshow(xbD)
for i=1:10
    xbD = imdilate((1-xb),ones(5));
    imshow(xbD); drawnow
    %pause
end

%Erosion:
xbE  = imerode((1-xb),ones(5));
figure(2); imshow(xbE)
for i=1:10
    xbE  = imerode((1-xb),ones(5));
    imshow(xbE); drawnow
    %pause
end

% Imclose, imopen, otros filtros morfologicos.
xbO = imopen((1-xb), ones(5));
figure(2); imshow(xbO)

xbO = imclose((1-xb), ones(5));
figure(2); imshow(xbO)

% Ayuda con los objetos estructurales para cosas mas sofisticadas:
help strel;

% Utilizando como Objeto Estructural un disco:
xbS = imopen((1-xb),strel('disk',11));
figure(2); imshow(xbS)



