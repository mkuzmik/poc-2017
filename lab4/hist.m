%% clear
clearvars;
close all;
clc;

%% read and show imgs
lena1 = imread('lena1.bmp');
lena2 = imread('lena2.bmp');
lena3 = imread('lena3.bmp');
lena4 = imread('lena4.bmp');

%% histograms of lena
figure;

subplot(4,2,1);
imshow(lena1);
subplot(4,2,2);
imhist(lena1,256);

subplot(4,2,3);
imshow(lena2);
subplot(4,2,4);
imhist(lena2,256);

subplot(4,2,5);
imshow(lena3);
subplot(4,2,6);
imhist(lena3,256);

subplot(4,2,7);
imshow(lena4);
subplot(4,2,8);
imhist(lena4,256);

%% read and show hist1.bmp
hist1_img = imread('hist1.bmp'); 

figure;
subplot(1,2,1);
imshow(hist1_img);
subplot(1,2,2);
imhist(hist1_img,256);

%% adjust and show hist1_img
hist_adjusted = imadjust(hist1_img);

figure;
subplot(1,2,1);
imshow(hist_adjusted);
subplot(1,2,2);
imhist(hist_adjusted,256);

%% cumsum
[H, x] = imhist(hist1_img);
C = cumsum(H);
k = max(C)/max(H);
C2 = C./k;

figure;
plot(x,H);
hold on;
plot(x,C2);

%% HE

for i = 1:256
   C_n(i) = C2(floor((136-81)*i/256 + 81));
end

C_norm = uint8(C_n .* 255/max(C_n));

plot(C_norm);

[x,y] = size(hist1_img);

for i = 1:x
    for j = 1:y
        img(i,j) = C_norm(hist1_img(i,j));
    end
end

imshow(img);

%histeq(hist1_img);
%% dokoncz to