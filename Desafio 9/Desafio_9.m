%% DESAFIO 9

close all; clc; clear all;

inputImage 		= imread('DRIVE-grupo-ISI-Utrech/training/images/26_training.tif');
objectiveOutput = imread('DRIVE-grupo-ISI-Utrech/training/1st_manual/26_manual1.gif');
mask 			= imread('DRIVE-grupo-ISI-Utrech/training/mask/26_training_mask.gif');

% Ecualizacion 
% Tenemos que preparar la imagen para fibermetric.
% -> con histeq hacemos que los vasos se noten MAS
% -> con las mascara podemos eliminar el fondo NEGRO
%    Hacemos esto porque fibermetric puede buscar formas
%    tubulares OSCURAS en el fondo de la imagen.
%    Tambien necesita la imagen en grayscale (mas razon para quitar el negro)
img_Ecu = (histeq(inputImage).*(mask./max(mask))) + (255 - mask);


for ciclo = 10:20
	img_result = fibermetric(rgb2gray(img_Ecu),ciclo,'ObjectPolarity','dark');
	img_result_binaria = imbinarize(img_result);

	outputError = sum(sum(abs(imbinarize(objectiveOutput) - img_result_binaria)));
	figure;
	subplot(1,2,1), imshow(img_result_binaria), title(sprintf('Grosor: %d',ciclo)); 
    subplot(1,2,2), imshow(labeloverlay(inputImage,img_result_binaria)), title(sprintf('Error cometido: %d',outputError)); 
end