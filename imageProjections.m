%Vertical and Horizontal Projection

%Thresholding the image

level = graythresh(image); %Computes the threshold level
imageBW = im2bw(image, level); %This converts grayscale  image to binary given a threshold
xProj = sum(imageBW, 1); %vertical projection
yProj = sum(imageBW, 2); %horizontal projection

plot(xProj);
plot(yProj);
