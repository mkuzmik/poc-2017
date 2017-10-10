%% clear
clearvars;
close all;
clc;

%% read img
parrot_bmp = imread('clock.bmp');

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

rescaledImage = double(zeros(newHeight, newWidth));
parrot_bmp = double(parrot_bmp);

for x = 0:newWidth-1
    for y = 0:newHeight-1
        
        xNeighbour = floor(x * xStep);
        yNeighbour = floor(y * yStep);
        
        A = [floor(0 - xNeighbour) + 1, floor(0 - yNeighbour) + 1];
        B = [floor(1 - xNeighbour) + 1, floor(0 - yNeighbour) + 1];
        C = [floor(0 - xNeighbour) + 1, floor(1 - yNeighbour) + 1];
        D = [floor(1 - xNeighbour) + 1, floor(1 - yNeighbour) + 1];
        
       
%         if (xNeighbour > actualWidth) 
%             xNeighbour = actualWidth;
%         end;
%         if (yNeighbour > actualHeight) 
%             yNeighbour = actualHeight;
%         end;
%        
        rescaledImg(y + 1,x + 1) = [1-x, x] * ...
            [parrot_bmp(A(1), A(2)), parrot_bmp(D(1), D(2)); ...
            parrot_bmp(B(1), B(2)), parrot_bmp(C(1), C(2))] * ...
            [1-y; y];
    end
end

%% show rescaled Img
figure(2);
imshow(uint8(rescaledImg));