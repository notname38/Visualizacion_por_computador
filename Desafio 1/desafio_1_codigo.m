close all;
clc;
clear;
addpath("binarizados", "proceso1");
martillo_1 = imread("martillos/martillo1.jpg");
martillo_3 = imread("martillos/martillo3.jpg");
martillo_5 = imread("martillos/martillo5.jpg");
martillo_7 = imread("martillos/martillo7.jpg");
martillo_9 = imread("martillos/martillo9.jpeg");


aux1 = im2bw(martillo_1,0.85); % umbral establecido a mano  75%
aux3 = im2bw(martillo_3,0.85); % umbral establecido a mano  75%
aux5 = im2bw(martillo_5,0.85); % umbral establecido a mano  75%
aux7 = im2bw(martillo_7,0.85); % umbral establecido a mano  75%
aux9 = im2bw(martillo_9,0.85); % umbral establecido a mano  75%

figure;
subplot(2,5,1); imshow(aux1); title("Martillo 1 con umbral del 85%")
subplot(2,5,2); imshow(aux3); title("Martillo 3 con umbral del 85%") 
subplot(2,5,3); imshow(aux5); title("Martillo 5 con umbral del 85%")  
subplot(2,5,4); imshow(aux7); title("Martillo 7 con umbral del 85%")
subplot(2,5,5); imshow(aux9); title("Martillo 9 con umbral del 85%") 
subplot(2,5,6); imshow(martillo_1) 
subplot(2,5,7); imshow(martillo_3) 
subplot(2,5,8); imshow(martillo_5)  
subplot(2,5,9); imshow(martillo_7) 
subplot(2,5,10); imshow(martillo_9) 

aux1 = imbinarize(rgb2gray(martillo_1)); % imagen binaria usando imbinarize
aux3 = imbinarize(rgb2gray(martillo_3)); % imagen binaria usando imbinarize
aux5 = imbinarize(rgb2gray(martillo_5)); % imagen binaria usando imbinarize
aux7 = imbinarize(rgb2gray(martillo_7)); % imagen binaria usando imbinarize
aux9 = imbinarize(rgb2gray(martillo_9)); % imagen binaria usando imbinarize

figure;
subplot(2,5,1); imshow(aux1); title("Martillo 1 con imbinarize")
subplot(2,5,2); imshow(aux3); title("Martillo 3 con imbinarize") 
subplot(2,5,3); imshow(aux5); title("Martillo 5 con imbinarize")  
subplot(2,5,4); imshow(aux7); title("Martillo 7 con imbinarize")
subplot(2,5,5); imshow(aux9); title("Martillo 9 con imbinarize") 
subplot(2,5,6); imshow(martillo_1) 
subplot(2,5,7); imshow(martillo_3) 
subplot(2,5,8); imshow(martillo_5)  
subplot(2,5,9); imshow(martillo_7) 
subplot(2,5,10); imshow(martillo_9) 















