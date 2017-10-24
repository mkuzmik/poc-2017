%% clear
clearvars;
close all;
clc;

%% read and show imgs
img = imread('phobos.bmp');

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
histeq(img);

%% load hist
load histogramZadany;
figure;
subplot(1,2,1);
plot(histogramZadany);
subplot(1,2,2);
histeq(img, histogramZadany);

%% adjust
figure;
imshow(imadjust(img));
