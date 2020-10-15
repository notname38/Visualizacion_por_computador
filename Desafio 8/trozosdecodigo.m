

I=rgb2gray(imresize(camiseta,0.1));

gaborArray = gabor([4 8],[0:30:90]);
gaborMag = imgaborfilt(I,gaborArray);

figure;
subplot(4,2,1)
for p = 1:length(gaborArray)
    subplot(4,2,p);
    imshow(real(gaborArray(p).SpatialKernel),[]);
    lambda = gaborArray(p).Wavelength;
    theta  = gaborArray(p).Orientation;
    title(sprintf('Re[h(x,y)], \\lambda = %d, \\theta = %d',lambda,theta));
end

X= reorganizar los datos en gaborMag para que puedan ser clusterizados
c= resultado de clustering X

B = labeloverlay(I,reshape(c,[300,400]),'Transparency',0.8,'Colormap',jet(4));