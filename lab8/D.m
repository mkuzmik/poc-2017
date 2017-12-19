%% 1
clear all;
clearvars;
clc;

%% 2
img = imread('calculator.bmp');

%% 3

eroded = imerode(img, ones(1,71));
reconstructed = imreconstruct(eroded, img);
opened = imopen(img, ones(1,71));

figure;
subplot(1,2,1);
imshow(reconstructed);
title('reconstructed');
subplot(1,2,2);
imshow(opened);
title('opened');

%% 4

cleaned = imabsdiff(img, reconstructed);

figure;
subplot(1,2,1);
imshow(cleaned);
title('cleaned');
subplot(1,2,2);
imshow(imtophat(img, strel('square', 3)));
title('tophat');

%% 5
eroded = imerode(cleaned, ones(1,11));
cleaned = imreconstruct(eroded, cleaned);

%% 6
dilated = imdilate(cleaned, ones(1,21));
cleaned = imreconstruct(min(dilated, reconstructed), reconstructed);
cleaned = imabsdiff(img, cleaned);

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(cleaned);
