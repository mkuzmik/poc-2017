%% 1 
close all;
clearvars;
clc;

figure;

img = imread('kolo.bmp');

fft2_ = fft2(img);

ifftsh = ifftshift(fft2_);

ifft_ = uint8(ifft2(ifftsh));

% diff = img - ifft_;

subplot(1,3,1);
imshow(img);
title('original img');
subplot(1,3,2);
imshow(fft2_);
title('after fft2');
subplot(1,3,3);
imshow(ifft_);
title('after ifft2');