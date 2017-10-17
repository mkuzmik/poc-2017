%% clear
clearvars;
close all;
clc;

%% read and show img
kolo = boolean(imread('kolo.bmp'));
kwadrat = boolean(imread('kwadrat.bmp'));

figure;
imshow(~kolo | kwadrat);
figure;
imshow(kolo & kwadrat);
figure;
imshow(~kolo | ~kwadrat);


