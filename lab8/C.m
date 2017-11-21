%%1
clear all;
clearvars;
clc;

%% 2
img = imread('ferrari.bmp');

se = strel('square', 3);

eroded = imerode(img, se);
dilated = imdilate(img,se);
diff = imabsdiff(eroded, dilated);

figure;
subplot(1,4,1);
imshow(img);
subplot(1,4,2);
imshow(eroded);
subplot(1,4,3);
imshow(dilated);
subplot(1,4,4);
imshow(diff);

%% 3
opened = imopen(img, se);
closed = imclose(img, se);

figure;
subplot(1,3,1);
imshow(img);
subplot(1,3,2);
imshow(opened);
subplot(1,3,3);
imshow(closed);

%% 4
tophat = imtophat(img,se);
bothat = imbothat(img,se);

figure;
subplot(1,3,1);
imshow(img);
subplot(1,3,2);
imshow(bothat);
subplot(1,3,3);
imshow(tophat);

%% 5
img = imread('rice.png');

se = strel('disk',10);

tophat = imtophat(img, se);

figure;
subplot(1,3,1);
imshow(img);
subplot(1,3,2);
imshow(tophat);