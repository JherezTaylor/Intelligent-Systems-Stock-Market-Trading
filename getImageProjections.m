function[horizontalProjection, verticalProjection, baseline] = getImageProjections(image)
%Vertical and Horizontal Projection


%image = getImage();

verticalProjection = sum(image, 1); %vertical projection
horizontalProjection = sum(image, 2); %horizontal projection
%horizontalProjection = flipud(horizontalProjection);
%verticalProjection = fliplr(verticalProjection);
[val, idx] = min(horizontalProjection);
baseline = [val, idx];

%plot(verticalProjection);
%plot(horizontalProjection);
