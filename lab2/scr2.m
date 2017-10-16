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

rescaledImage = double(zeros(newHeight, newWidth));

for x = 0:newWidth-1
    for y = 0:newHeight-1
        
        xN = floor(x * xStep);
        yN = floor(y * yStep);
        
        if (xN > actualWidth-2) 
            xN = actualWidth-2;
        end;
        if (yN > actualHeight-2) 
            yN = actualHeight-2;
        end;
        
        A = double(original_img(yN+1,xN+1));
        B = double(original_img(yN+1,xN+2));
        C = double(original_img(yN+2,xN+1));
        D = double(original_img(yN+2,xN+2));
        
         
        rescaledImage(y + 1,x + 1) = ...
            [1-x, x] * ...
            [A, D; ...
             B, C] * ...
            [1-y; y];
    end
end

%% show rescaled Img
figure(2);
imshow(uint8(rescaledImage));