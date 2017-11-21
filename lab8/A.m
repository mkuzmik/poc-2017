%%1
clear all;
clearvars;
clc;

%% 2,3,4
img = imread('ertka.bmp');

eroded = img;

se = strel('square', 3);

for i = 1:3
    eroded = imerode(eroded, se);
end

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(eroded);

%% 7
img = imread('buzka.bmp')

se = [1,0,0;0,1,0;0,0,1];

eroded = imerode(img, se);

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(eroded);

%% 8

img = imread('ertka.bmp');

dilated = img;

se = strel('square', 3);

for i = 1:1
    dilated = imdilate(dilated, se);
end

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(dilated);

%% 9
img = imread('ertka.bmp');

se = strel('square', 3);

dilated = imdilate(img, se);
eroded = imerode(img, se);
closed = imclose(img, se);
opened = imopen(img, se);

figure;
subplot(1,5,1);
imshow(img);
subplot(1,5,2);
imshow(eroded);
subplot(1,5,3);
imshow(dilated);
subplot(1,5,4);
imshow(opened);
subplot(1,5,5);
imshow(closed);

%% 11 close + erode
img = imread('ertka.bmp');

se = strel('square', 2);


cleaned = imclose(img, se);
cleaned = imerode(cleaned, se);

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(cleaned);

%% 13
img = imread('hom.bmp');

se1 = [0,1,0;1,1,1;0,1,0];
se2 = [1,0,1;0,0,0;1,0,1];

bw = bwhitmiss(img,se1,se2);

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(bw);
