%% DESAFIO 9

% Nota rapida: ( Otra "Herramienta" )
% Remover la variacion suave de intensidad(?)
% figure; imshow(x); 
% xb = imgaussfilt(x,20);     
% xx=double(x)./double(xb);
% ¿ que hago yo con esto ? xd 
% figure; imshow(xx/max(xx(:)))
% La imagen esta "homogeneizada" ahora 


%% Inicializaciones:
close all; clc;
%path_test = 'DRIVE-grupo-ISI-Utrech\test\images';
path_train = 'DRIVE-grupo-ISI-Utrech\training\images';
path_train_objective = 'DRIVE-grupo-ISI-Utrech\training\1st_manual';

%images_test = imageDatastore( path_test );
images_train = imageDatastore( path_train );
obj_train = imageDatastore( path_train_objective );

%vrz = 5 % Varianza

%% Test:
while hasdata(images_train)
	x_og = read(images_train);
	x_obj = read(obj_train);
	x = rgb2gray(x_og);

	fbe_x = fibermetric(x,round(maxhessiannorm(x)),'ObjectPolarity','dark');

	figure; 
	subplot(1,3,1); imshow(x_og + uint8(fbe_x*255)); title("Fibemetric RGB:");
	subplot(1,3,2); imshow(fbe_x); title("Fibemetric MASK:");
	subplot(1,3,3); imshow(x_obj); title("Objetive MASK:");
end



