%% clear
clearvars;
close all;
clc;

%% 1
RGB = imread('jezioro.jpg');

red = RGB(:,:,1);
green = RGB(:,:,2);
blue = RGB(:,:,3);

figure;
subplot(1,4,1);
imshow(RGB);
subplot(1,4,2);
imshow(red);
subplot(1,4,3);
imshow(green);
subplot(1,4,4);
imshow(blue);

%% 2
eq(:,:,1) = histeq(red, 256);
eq(:,:,2) = histeq(green, 256);
eq(:,:,3) = histeq(blue, 256);

figure;
subplot(1,2,1);
imshow(RGB);
subplot(1,2,2);
imshow(eq);

%% 3
HSV = rgb2hsv(RGB);
hsv_eq(:,:,1) = histeq(HSV(:,:,1), 256);
hsv_eq(:,:,2) = histeq(HSV(:,:,2), 256);
hsv_eq(:,:,3) = histeq(HSV(:,:,3), 256);

figure;
subplot(1,2,1);
imshow(RGB);
subplot(1,2,2);
imshow(hsv2rgb(hsv_eq));
