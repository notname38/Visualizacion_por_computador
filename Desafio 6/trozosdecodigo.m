%% Clustering en RGB

%% Inicializaciones.
load clown
x=ind2rgb(X,map);

%% Self-organizing map.
pixels=reshape(x,[size(x,1)*size(x,2),3]); 		% Convierte la imagen en 3 columnas rgb donde todos los pixeles van en una columna.
pixels=pixels';
net = selforgmap([3 3]);
net=train(net,pixels);
y=net(pixels);
classes = vec2ind(y);
segm=reshape(classes,[size(x,1),size(x,2)]);
figure; imshow(segm,gray(9))

%% Con k-Means 
pixels=reshape(x,[size(x,1)*size(x,2),3]);
classes = kmeans (pixels,9); 					% Directamente aplicar el kmeans a los pixeles.
segm=reshape(classes,[size(x,1),size(x,2)]); 	% Convierte el resultado en imagen
figure; imshow(segm,gray(9)) 					% Imagen con 9 niveles de gris

% BW1 = segm==3; 								% La segmentacion obtenida con el cluster 3
% BW1 = segm==n; 								% La segmentacion obtenida con el cluster n
% BW1 = segm==3 | segm == 6 					% La segmentacion obtenida con los clusters 3 y 6

% True positives => TP = BW & BW1 % TP = BW .* BW1
% False positives => FP = BW1 - TP

%% Spectral Clustering [!--COSTOSO--!]
%x=imresize(x,0.5);  		% En caso de que el sistema no permita el tamaño original.
pixels=reshape(x,[size(x,1)*size(x,2),3]);
classes = spectralcluster (pixels,9);
segm=reshape(classes,[size(x,1),size(x,2)]);
segm=uint8(segm);
%segm=imresize(segm,2);  	% Puede creaer efectos como clases con valor mayor que el numero de clases especificado
figure; imshow(segm,gray(9))
%x=imresize(x,2);


%% Aglomerativo [!--Extremadamente Costoso--!]
x=imresize(x,0.1);
pixels=reshape(x,[size(x,1)*size(x,2),3]);
classes = clusterdata(double(pixels),9);
segm=reshape(classes,[size(x,1),size(x,2)]);
segm=uint8(segm);

%visualizacion de la segmentacion
cmap = jet(9);
B = labeloverlay(x,segm,'Transparency',0.5,'Colormap',cmap);
figure; imshow(B); colorbar

%%%%%%%%%% pasando a Lab
xlab=rgb2lab(x);
pixels=reshape(xlab,[size(x,1)*size(x,2),3]);
pixels=pixels(:,2:3);
% con kmeans

classes = kmeans (pixels,9);
segm=reshape(classes,[size(x,1),size(x,2)]);
figure; imshow(segm,gray(9))

% con selforganizing map

pixels=pixels';
net = selforgmap([3 3]);
net=train(net,pixels);
y=net(pixels);
classes = vec2ind(y);
segm=reshape(classes,[size(x,1),size(x,2)]);
figure; imshow(segm,gray(9))

%%% con espectral.....


%%%%%%%%%%% evaluar el numero de clusters "optimo"

eva = evalclusters(pixels,'kmeans','CalinskiHarabasz','KList',1:10)