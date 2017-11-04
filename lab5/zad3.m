%% clear and setup
clc;
close all;
clearvars;

img = imread('bart.bmp');

%% imshow
figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imhist(img);

%% bin
lowerThreshold = 190;
upperThreshold = 210;

imgBw = img > lowerThreshold & img < upperThreshold;
imgBw = uint8(imgBw) * 255;
imshow(imgBw);