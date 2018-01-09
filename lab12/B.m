%% 1 
close all;
clearvars;
clc;

figure;

img = imread('kwadratT.bmp');

fft2_ = fft2(img);

Am = log10(abs(fft2_) + 1);
F = angle(fft2_ .* (Am>0.0001));

subplot(2,3,1);
imshow(img);
subplot(2,3,2);
imshow(Am,[]);
subplot(2,3,3);
imshow(F);

img = imtranslate(img, [25 25]);

fft2_ = fft2(img);

Am = log10(abs(fft2_) + 1);
F = angle(fft2_ .* (Am>0.0001));

subplot(2,3,4);
imshow(img);
subplot(2,3,5);
imshow(Am,[]);
subplot(2,3,6);
imshow(F);

%% 2
figure;

img = imread('kwadratS.bmp');

fft2_ = fft2(img);

Am = log10(abs(fft2_) + 1);
F = angle(fft2_ .* (Am>0.0001));

subplot(2,3,1);
imshow(img);
subplot(2,3,2);
imshow(Am,[]);
subplot(2,3,3);
imshow(F);

img = imrotate(img, 20);

fft2_ = fft2(img);

Am = log10(abs(fft2_) + 1);
F = angle(fft2_ .* (Am>0.0001));

subplot(2,3,4);
imshow(img);
subplot(2,3,5);
imshow(Am,[]);
subplot(2,3,6);
imshow(F);

%% 3

figure;

img = imread('kwadratS.bmp');

fft2_ = fft2(img);

Am = log10(abs(fft2_) + 1);
F = angle(fft2_ .* (Am>0.0001));

subplot(2,3,1);
imshow(img);
subplot(2,3,2);
imshow(Am,[]);
subplot(2,3,3);
imshow(F);

img = imresize(img, [1000 1500]);

fft2_ = fft2(img);

Am = log10(abs(fft2_) + 1);
F = angle(fft2_ .* (Am>0.0001));

subplot(2,3,4);
imshow(img);
subplot(2,3,5);
imshow(Am,[]);
subplot(2,3,6);
imshow(F);

%% 4

figure;

img = imread('kwadratKL.bmp');

fft2_ = fft2(img);

Am = log10(abs(fft2_) + 1);
F = angle(fft2_ .* (Am>0.0001));

subplot(2,3,1);
imshow(img);
subplot(2,3,2);
imshow(Am,[]);
subplot(2,3,3);
imshow(F);

img = imlincomb(5,img);

fft2_ = fft2(img);

Am = log10(abs(fft2_) + 1);
F = angle(fft2_ .* (Am>0.0001));

subplot(2,3,4);
imshow(img);
subplot(2,3,5);
imshow(Am,[]);
subplot(2,3,6);
imshow(F);

