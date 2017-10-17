%% clear
clearvars;
close all;
clc;

%% read and show img
original_img = imread('lena.bmp');
figure;
imshow(original_img);

%% load lut functions
load funkcjeLUT;

figure;
plot(odwrotna);

%% show img after lut
figure;
LUT(original_img, odwrotna);
figure;
LUT(original_img, kwadratowa);
figure;
LUT(original_img, log);
figure;
LUT(original_img, odwlog);
figure;
LUT(original_img, pierwiastkowa);
figure;
LUT(original_img, pila);
figure;
LUT(original_img, wykladnicza);
