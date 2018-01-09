%% 1 
close all;
clearvars;
clc;

img = imread('lena.bmp');

fft2_ = fft2(img);

Am = log10(abs(fft2_) + 1);
F = angle(fft2_ .* (Am>0.0001));

figure;
subplot(1,3,1);
imshow(img);
subplot(1,3,2);
imshow(Am,[]);
subplot(1,3,3);
imshow(F);

%% 3
[f1,f2] = freqspace(512,'meshgrid');
Hd = ones(512);
r = sqrt(f1.^2 + f2.^2);
Hd((r>0.1)) = 0;

colormap(jet(64));
mesh(f1,f2,Hd);

after = img .* uint8(Hd);

iffsh = ifftshift(after);
ifft2_ = ifft2(iffsh);

figure;
subplot(1,2,1);
imshow(after);
subplot(1,2,2);
imshow(ifft2_);

%% 8
h = fwind1(Hd, hanning(21));
[H f1 f2] = freqz(h,512,512);

mesh(f1,f2,H);