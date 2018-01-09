%% 1 
close all;
clearvars;
clc;

img = imread('ccl2.png');

figure;
imshow(img);

%% 2

ind4 = bwlabel(img, 4);
ind8 = bwlabel(img, 8);

figure;
subplot(1,2,1);
imshow(label2rgb(ind4));
subplot(1,2,2);
imshow(label2rgb(ind8));
