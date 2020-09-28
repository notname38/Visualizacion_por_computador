% Desafio 2 proceso 1


% Inicializaciones.
addpath("binarizados", "proceso1");
binario_1 = imread("binarizados/martillo1.jpg");
procesado_1 = imread("proceso1/martillo1.jpg");
binario_2 = imread("binarizados/martillo2.jpg");
procesado_2 = imread("proceso1/martillo2.jpg");
binario_3 = imread("binarizados/martillo3.jpg");
procesado_3 = imread("proceso1/martillo3.jpg");
binario_4 = imread("binarizados/martillo4.jpg");
procesado_4 = imread("proceso1/martillo4.jpg");
binario_5 = imread("binarizados/martillo5.jpg");
procesado_5 = imread("proceso1/martillo5.jpg");
binario_6 = imread("binarizados/martillo6.jpg");
procesado_6 = imread("proceso1/martillo6.jpg");
binario_7 = imread("binarizados/martillo7.jpg");
procesado_7 = imread("proceso1/martillo7.jpg");
binario_8 = imread("binarizados/martillo8.jpg");
procesado_8 = imread("proceso1/martillo8.jpg");
binario_9 = imread("binarizados/martillo9.jpeg");
procesado_9 = imread("proceso1/martillo9.jpeg");

% Programa (Calculo)

aux1 = imclose(binario_1, strel("cube", 12));
aux2 = imclose(binario_2, strel("cube", 12));
aux3 = imclose(binario_3, strel("cube", 12));
aux4 = imclose(binario_4, strel("cube", 12));
aux5 = imclose(binario_5, strel("cube", 12));
aux6 = imclose(binario_6, strel("cube", 12));
aux7 = imclose(binario_7, strel("cube", 12));
aux8 = imclose(binario_8, strel("cube", 12));
aux9 = imclose(binario_9, strel("cube", 12));
error1 = sum(sum(1-(aux1 == procesado_1))); 
error2 = sum(sum(1-(aux2 == procesado_2))); 
error3 = sum(sum(1-(aux3 == procesado_3))); 
error4 = sum(sum(1-(aux4 == procesado_4))); 
error5 = sum(sum(1-(aux5 == procesado_5))); 
error6 = sum(sum(1-(aux6 == procesado_6)));
error7 = sum(sum(1-(aux7 == procesado_7))); 
error8 = sum(sum(1-(aux8 == procesado_8))); 
error9 = sum(sum(1-(aux9 == procesado_9)));

%{
v1 = 0:50;
v2 = 0:50;
v3 = 0:50;
inx = 1;
for n = 0:50

    v1(inx) = sum(sum(1-(procesado_1 == imclose(binario_1, strel("cube", n))))); 
    v2(inx) = sum(sum(1-(procesado_2 == imclose(binario_2, strel("cube", n))))); 
    v3(inx) = sum(sum(1-(procesado_3 == imclose(binario_3, strel("cube", n))))); 
    inx = inx + 1;
    
end
%}

% Figuritas y graficos, demostraciones

figure(1);
subplot(6,3,1); imshow(aux1); title(error1)
subplot(6,3,2); imshow(aux2); title(error2)  
subplot(6,3,3); imshow(aux3); title(error3) 
subplot(6,3,4); imshow(procesado_1)
subplot(6,3,5); imshow(procesado_2)  
subplot(6,3,6); imshow(procesado_3) 

subplot(6,3,7); imshow(aux4); title(error4)
subplot(6,3,8); imshow(aux5); title(error5)  
subplot(6,3,9); imshow(aux6); title(error6) 
subplot(6,3,10); imshow(procesado_4)
subplot(6,3,11); imshow(procesado_5)  
subplot(6,3,12); imshow(procesado_6) 

subplot(6,3,13); imshow(aux7); title(error7)
subplot(6,3,14); imshow(aux8); title(error8)  
subplot(6,3,15); imshow(aux9); title(error9) 
subplot(6,3,16); imshow(procesado_7)
subplot(6,3,17); imshow(procesado_8)  
subplot(6,3,18); imshow(procesado_9) 


%{
figure(2);
subplot(1,3,1); stem(0:50,v1,'b'); title("Funcion de error 1")
subplot(1,3,2); stem(0:50,v2,'r'); title("Funcion de error 2")  
subplot(1,3,3); stem(0:50,v3,'g'); title("Funcion de error 2")
%}




