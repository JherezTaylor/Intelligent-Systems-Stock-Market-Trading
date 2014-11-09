function[horizontalProjection, verticalProjection] = getImageProjections(image)
%Vertical and Horizontal Projection


%image = getImage();

verticalProjection = sum(image, 1); %vertical projection
horizontalProjection = sum(image, 2); %horizontal projection

%plot(verticalProjection);
%plot(horizontalProjection);
