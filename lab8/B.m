%%1
clear all;
clearvars;
clc;

%% 2
img = imread('fingerprint.bmp');

n = 5;

thinned = bwmorph(img, 'thin', n);

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(thinned);

%% 3
img = imread('kosc.bmp');

n = 50;

skelet = bwmorph(img, 'skel', n);

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(skelet);

%% 4,5,6,7
img = imread('text.bmp');

se = ones(51,1);

eroded = imerode(img, se);

reconst = imreconstruct(eroded, img);

filled = imfill(img, 'holes');

cleanborders = imclearborder(img);

figure;
subplot(1,4,1);
imshow(img);
subplot(1,4,2);
imshow(reconst);
subplot(1,4,3);
imshow(filled);
subplot(1,4,4);
imshow(cleanborders);