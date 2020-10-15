flores=imread('flores.jpg');
flores=imresize(flores,0.1);
floresgris=rgb2gray(flores);

h=fspecial('log',45,5);

bordes=edge(floresgris,'Canny',0,5);
bordes=edge(floresgris,'log',0,5);

floresfilt=conv2(double(floresgris),h,'same');
bordes=floresfilt>0;
bordes=bordes-imerode(bordes,ones(3));

% overlay bordes

c3=ind2rgb(bordes*255,gray(256));
c3=uint8(c3*255);
figure; imshow(flores+c3);

% visualizar bordes a trozos

[L,n]=bwlabel(bordes);
for i=1:n
    comp=L==i;
    if sum(sum(comp))>100
        c3=ind2rgb(comp*255,gray(256));
        c3=uint8(c3*255);
        imshow(flores+c3);
        pause
    end
end



