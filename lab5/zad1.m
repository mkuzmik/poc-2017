%% clear
clc;
close all;
clearvars;

%% read img
img = imread('coins.png');

%% show img
figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imhist(img);

%% binarize
threshold = 85;
bw_img = im2bw(img, threshold/255);

figure;
imshow(bw_img);

%% 4
img = imread('figura.png');
figure;
subplot(4,2,1);
imshow(img);
subplot(4,2,2);
imhist(img);

img = imread('figura2.png');
subplot(4,2,3);
imshow(img);
subplot(4,2,4);
imhist(img);

img = imread('figura3.png');
subplot(4,2,5);
imshow(img);
subplot(4,2,6);
imhist(img);

img = imread('figura4.png');
subplot(4,2,7);
imshow(img);
subplot(4,2,8);
imhist(img);

%% 5,6,7
img = imread('coins.png');

figure;
subplot(1,6,1);

imshow(img);
title('Original image');

subplot(1,6,2);
imhist(img);
title('Histogram');

threshold = graythresh(img);
subplot(1,6,3);
imshow(im2bw(img, threshold));
title('Otsu');

threshold = clusterKittler(img);
subplot(1,6,4);
imshow(im2bw(img, threshold/255));
title('ClusterKittel()');

threshold = entropyYen(img);
subplot(1,6,5);
imshow(im2bw(img, threshold/255));
title('EntropyYen()');

subplot(1,6,6);
imshow(im2bw(img, 85/255));
title('Custom Threshold');

%% 8
img = imread('rice.png');

figure;
subplot(1,6,1);

imshow(img);

subplot(1,6,2);
imhist(img);

threshold = graythresh(img);
subplot(1,6,3);
imshow(im2bw(img, threshold));

threshold = clusterKittler(img);
subplot(1,6,4);
imshow(im2bw(img, threshold/255));

threshold = entropyYen(img);
subplot(1,6,5);
imshow(im2bw(img, threshold/255));

subplot(1,6,6);
imshow(im2bw(img, 120/255));
