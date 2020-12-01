%% DESAFIO 9 - Script the generalizacion.

close all; clc; clear all;

% Cambiar el numero en estos links.
numero = 26; % Por defecto
inputImage 		= imread('DRIVE-grupo-ISI-Utrech/training/images/'+numero+'_training.tif');
objectiveOutput = imread('DRIVE-grupo-ISI-Utrech/training/1st_manual/'+numero+'_manual1.gif');
mask 			= imread('DRIVE-grupo-ISI-Utrech/training/mask/'+numero+'_training_mask.gif');

img_Ecu = (histeq(inputImage).*(mask./max(mask))) + (255 - mask);

img_result = fibermetric(rgb2gray(img_Ecu),ciclo,'ObjectPolarity','dark');
img_result_binaria = imbinarize(img_result);

outputError = sum(sum(abs(imbinarize(objectiveOutput) - img_result_binaria)));
figure;
subplot(1,2,1), imshow(img_result_binaria), title("Grosor = 12"); 
subplot(1,2,2), imshow(labeloverlay(inputImage,img_result_binaria)), title(sprintf('Error cometido: %d',outputError)); 
