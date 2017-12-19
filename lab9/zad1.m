%% 1
close all;
clearvars;
clc;

%% a
img = imread('dom.png');
edged = edge(img, 'log');

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(edged);

%% b
img = imread('dom.png');
edged = edge(img, 'canny');

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(edged);

%% d
edged_log = edge(img, 'log', 0.005, 2.3);
edged_canny = edge(img, 'canny', [], 2);
edged_sobel = edge(img, 'sobel', []);

figure;
subplot(1,4,1);
imshow(img);
subplot(1,4,2);
imshow(edged_log);
title('log');
subplot(1,4,3);
imshow(edged_canny);
title('canny');
subplot(1,4,4);
imshow(edged_sobel);
title('sobel');