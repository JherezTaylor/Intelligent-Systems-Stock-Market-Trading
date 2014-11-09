%Vertical and Horizontal Projection

%Thresholding the image

level = graythresh(image); %Computes the threshold level
imageBW = im2bw(image, level); %This converts grayscale  image to binary given a threshold
xProj = sum(imageBW,1);
YProj = sum(imageBW,2);
plot(xProj);
plot(yProj);
