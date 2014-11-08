function[finalImage] = getImage()

%Image Aquisition
image = imread('image.jpg'); %getting the image

%Pre-processing

%Thresholding the image
level = graythresh(image); %computes the threshold level
imageBW = im2bw(image, level); %this converts grayscale  image to binary given a threshold

%the image is converted to binary format to be manipulated by matlab functions
finalImage = imageBW;

%imshow(finalImage);