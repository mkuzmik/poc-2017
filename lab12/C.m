%% 1 
close all;
clearvars;
clc;

figure;

img = imread('kolo.bmp');

fft2_ = fft2(img);


ifftsh = ifftshift(fft2_);

ifft_ = uint8(ifft2(ifftsh));

diff = img - ifft_;

subplot(1,4,1);
imshow(img);
subplot(1,4,2);
imshow(fft2_);
subplot(1,4,3);
imshow(ifft_);
subplot(1,4,4);
imshow(diff);