%% clear
clearvars;
close all;
clc;

%% read img
parrot_bmp = imread('parrot.bmp');

%% show img
figure(1);
imshow(parrot_bmp);

%% define scales
xReScale = 3;
yReScale = 3;

%% compute new res
[actualHeight, actualWidth] = size(parrot_bmp);
newHeight = floor(yReScale * actualHeight);
newWidth = floor(xReScale * actualWidth);

%% iterate through image
xStep = actualWidth / newWidth;
yStep = actualHeight / newHeight;

for x = 0:newWidth-1
    for y = 0:newHeight-1
        
        xNeighbour = floor(x * xStep);
        yNeighbour = floor(y * yStep);
        
        if (xNeighbour > actualWidth) 
            xNeighbour = actualWidth;
        end;
        if (yNeighbour > actualHeight) 
            yNeighbour = actualHeight;
        end;
       
        rescaledImg(x + 1,y + 1) = parrot_bmp(xNeighbour + 1, yNeighbour + 1);
    end
end

%% show rescaled Img
figure(2);
imshow(rescaledImg);
