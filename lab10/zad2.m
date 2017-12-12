%% 1
global minimum;
global threshold;

close all;
clearvars;
clc;

%% 2,3
img_org = imread('umbrealla.png');
threshold = 0.05;
minimum = 8;

img = rgb2hsv(img_org);
img = double(img(:,:,1));

[x,y] = size(img);

segmented = split(img,0,0,x,y);

figure;
subplot(1,2,1);
imshow(img_org);
subplot(1,2,2);
imshow(segmented, []);
