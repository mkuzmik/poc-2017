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

%% cumulated histogram
figure;
[x1, cum1, hist1] = cumulatedHist(hist1_img);
[x2, cum2, hist2] = cumulatedHist(hist_adjusted);

figure;
subplot(2,2,1);
imshow(hist1_img);

subplot(2,2,2);
plot(x1, hist1);
hold on;
plot(x1,cum1);

subplot(2,2,3);
imshow(hist_adjusted);

subplot(2,2,4);
plot(x2, hist2);
hold on;
plot(x2, cum2);

%% HE
cum_lut = uint8(cum1 .* 255/max(cum1));

he_algo(hist1_img);

%% matlab builtin funs for hists


I = histeq(hist1_img, 256);
Iclahe = adapthisteq(hist1_img);
figure;
subplot(3,1,1);
imshow(hist1_img);
subplot(3,1,2);
imshow(I);
subplot(3,1,3);
imshow(Iclahe);

%% present other images
img1 = imread('hist2.bmp');
img2 = imread('hist3.bmp');
img3 = imread('hist4.bmp');

figure;
subplot(3,3,1);
imshow(img1);
subplot(3,3,2);
imshow(histeq(img1,256));
subplot(3,3,3);
imshow(adapthisteq(img1));

subplot(3,3,4);
imshow(img2);
subplot(3,3,5);
imshow(histeq(img2,256));
subplot(3,3,6);
imshow(adapthisteq(img2));

subplot(3,3,7);
imshow(img3);
subplot(3,3,8);
imshow(histeq(img3,256));
subplot(3,3,9);
imshow(adapthisteq(img3));

%% functions

function [x_axis, cumulated_normalized_hist, hist] = cumulatedHist(img)
    [hist, x_axis] = imhist(img);
    cumulated_hist = cumsum(hist);
    k = max(cumulated_hist)/max(hist);
    cumulated_normalized_hist = cumulated_hist./k;
end

function he_img = he_algo(img)
    [~, cum, ~] = cumulatedHist(img);
    cum_lut = uint8(cum .* 255/max(cum));
    he_img = intlut(img, cum_lut);
    
    figure;
    subplot(1,2,1);
    title('Obraz przekształcony algorytmem wyrównanania histogramu');
    imshow(img);
    subplot(1,2,2);
    imshow(he_img);
end
