%Image Aquisition

image = imread('image.jpg'); %getting the image

%Pre-processing

%Thresholding the image
level = graythresh(image); %computes the threshold level
imageBW = im2bw(image, level); %this converts grayscale  image to binary given a threshold

%Noise Removal
invBW = ~imageBW;
sq = ones(3,3);
invBWop = imopen(invBW, sq);
invBWcl = imclose(invBWop, sq);

%Medical Axis transformation to Thin the Binary images
imgBWdis = bwdist(~invBWcl); %distance transform
%Medical Axis transform
[h w] = size(imgBWdis);
imgBWmat = zeros(h,w);

for i=2:h-2
    for j=2:w-2
        if((imgBWdis(i,j)>imgBWdis(i+1,j)) && (imgBWdis(i,j)>imgBWdis(i-1,j)))
            imgBWmat(i,j)=imgBWdis(i,j);
        elseif((imgBWdis(i,j)>imgBWdis(i,j+1)) && (imgBWdis(i,j)>imgBWdis(i,j-1)))
            imgBWmat(i,j)=imgBWdis(i,j);
        elseif((imgBWdis(i,j)>imgBWdis(i-1,j)) && (imgBWdis(i,j)==imgBWdis(i+1,j)) && (imgBWdis(i+1,j)>imgBWdis(i+2,j)))
            imgBWmat(i,j)=imgBWdis(i,j);
        elseif((imgBWdis(i,j)>imgBWdis(i,j-1)) && (imgBWdis(i,j)==imgBWdis(i,j+1)) && (imgBWdis(i,j+1)>imgBWdis(i,j+2)))
            imgBWmat(i,j)=imgBWdis(i,j);
        end
    end
end

%2-Step Thining
[H,W] = size(invBWcl); % height, width of imageBW
BWbuffer = invBWcl; % BWbuffer = image buffer 
BWchanged = invBWcl; % BWchanged = changed image in thinning process
N=0; % N = number of non-zero neighbors
T=0; % T = 0-1 patterns
ChangeCount = 1; % number of pixels changed over iteration
PixelValue = zeros(8); % store the 8-neighborhood values (P)

% loop till no more pixel to change
while (ChangeCount ~= 0)
    ChangeCount =0;

    % first step
    for r=2:H-1 
        for c=2:W-1 
            if(BWbuffer(r,c)==1)
                % 8 neighborhood of pixel
                PixelValue(9) = BWbuffer(r-1,c-1); PixelValue(2) = BWbuffer(r-1,c); PixelValue(3) = BWbuffer(r-1,c+1);
                PixelValue(8) = BWbuffer(r,c-1); PixelValue(4) = BWbuffer(r,c+1);
                PixelValue(7) = BWbuffer(r+1,c-1); PixelValue(6) = BWbuffer(r+1,c); PixelValue(5) = BWbuffer(r+1,c+1);
                % calculate N
                N = PixelValue(2)+PixelValue(3)+PixelValue(4)+PixelValue(5)+PixelValue(6)+PixelValue(7)+PixelValue(8)+PixelValue(9);
                % compute T
                T=0;
                for i=2:8
                    if ( PixelValue(i)<PixelValue(i+1) ) % test whether PixelValue(i)=0 and PixelValue(i+1)=1
                        T=T+1; 
                    end 
                end
                if ( PixelValue(9)<PixelValue(2) )
                    T=T+1; 
                end
                % pixel deletion decision
                if( (N>=2) & (N<=6) & (T==1) & ((PixelValue(6)==0) | (PixelValue(4)==0) | (PixelValue(2)==0 & PixelValue(8)==0) ) )
                    BWchanged(r,c)=0;
                    ChangeCount=ChangeCount+1;
                end
            end
        end
    end

    % second step
    BWbuffer=BWchanged;
    for r=2:H-1 
        for c=2:W-1 
            if(BWbuffer(r,c)==1)
                % 8 neighborhood of pixel
                PixelValue(9) = BWbuffer(r-1,c-1); PixelValue(2) = BWbuffer(r-1,c); PixelValue(3) = BWbuffer(r-1,c+1);
                PixelValue(8) = BWbuffer(r,c-1); PixelValue(4) = BWbuffer(r,c+1);
                PixelValue(7) = BWbuffer(r+1,c-1); PixelValue(6) = BWbuffer(r+1,c); PixelValue(5) = BWbuffer(r+1,c+1);
                % calculate N
                N = PixelValue(2)+PixelValue(3)+PixelValue(4)+PixelValue(5)+PixelValue(6)+PixelValue(7)+PixelValue(8)+PixelValue(9);
                % co T
                T=0;
                for i=2:8
                    if ( PixelValue(i)< PixelValue(i+1) )
                        T=T+1; 
                    end
                end
                if ( PixelValue(9)<PixelValue(2) )
                    T=T+1; 
                end
                % Dpixel deletion decision
                if( (N>=2) & (N<=6) & (T==1) & ((PixelValue(2)==0) | (PixelValue(8)==0) | (PixelValue(4)==0 & PixelValue(6)==0) ) )
                    BWchanged(r,c)=0;
                    ChangeCount=ChangeCount+1;
                end
            end
        end
    end
    ChangeCount % output # of changes this iteration
    % swap BWbuffer with BWchanged
    BWbuffer=BWchanged;
end % end outer loop

%change image from black background to white background
BW2step=BWbuffer;

%show image
imshow(BW2step);
