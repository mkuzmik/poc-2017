%% clear
clearvars;
close all;
clc;

%% read img
original_img = imread('clock.bmp');

%% show img
figure(1);
imshow(original_img);

%% define scales
xReScale = 3;
yReScale = 3;

%% compute new res
[actualHeight, actualWidth] = size(original_img);
newHeight = floor(yReScale * actualHeight);
newWidth = floor(xReScale * actualWidth);

%% iterate through image
xStep = actualWidth / newWidth;
yStep = actualHeight / newHeight;

rescaledImage = uint8(zeros(newHeight, newWidth));

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
       
        rescaledImg(y + 1,x + 1) = original_img(yNeighbour + 1, xNeighbour + 1);
    end
end

%% show rescaled Img
figure(2);
imshow(rescaledImg);
