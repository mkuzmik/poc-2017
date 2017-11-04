%% clear and setup
clc;
close all;
clearvars;

img = imread('tekstReczny.png');

%% imshow
figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imhist(img);

%% try to bin Otsu
threshold = graythresh(img);
figure;
imshow(im2bw(img, threshold));

%% impl
[x,y] = size(img);

N = 20;
a = 0.5;

