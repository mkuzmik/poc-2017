%% clear
clearvars;
close all;
clc;

%% read img
original_img = imread('lena.bmp');

%% show img
figure(1);
imshow(original_img);

%% resize and show
newSize = 1024;
resizedLena = imresize(original_img, newSize/512, 'bicubic');
figure(2);
imshow(resizedLena, 'InitialMagnification', 200);

% adjust and show
adjust = 31;
imshow(imadjust(original_img,0:adjust));