inputImage = imread('21_training.tif');
goundTruth = imread('21_manual1.gif');
figure;
imshow(inputImage)
segIm = vesselSegPC(inputImage);   

figure;
imshow(segIm);

validation(goundTruth,segIm)
