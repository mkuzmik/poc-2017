%% 1 
close all;
clearvars;
clc;

img = imread('lena.bmp');

fft2_ = fftshift(fft2(img));

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
r = sqrt(f1.^2 + f2.^2);
Hd1 = ones(512);
Hd1((((r>0.95)|(r<0.05)))) = 0;

after = fft2_ .* Hd1;

iffsh = ifftshift(after);
ifft2_ = ifft2(iffsh);

figure;
subplot(1,2,1);
colormap(jet(64));
mesh(f1,f2,Hd1);
subplot(1,2,2);
imshow(ifft2_);

Hd1 = ones(512);
Hd1((((r<0.1)))) = 0;

after = fft2_ .* Hd1;

iffsh = ifftshift(after);
ifft2_ = ifft2(iffsh);

figure;
subplot(1,2,1);
colormap(jet(64));
mesh(f1,f2,Hd1);
subplot(1,2,2);
imshow(ifft2_);

Hd1 = ones(512);
Hd1((((r<0.5)))) = 0;

after = fft2_ .* Hd1;

iffsh = ifftshift(after);
ifft2_ = ifft2(iffsh);

figure;
subplot(1,2,1);
colormap(jet(64));
mesh(f1,f2,Hd1);
subplot(1,2,2);
imshow(ifft2_);

%% 8
h = fwind1(Hd1, hanning(21));
[H,f1,f2] = freqz2(h,512,512);

after = fft2_ .* H;

iffsh = ifftshift(after);
ifft2_ = ifft2(iffsh);

figure;
subplot(1,2,1);
mesh(f1,f2,H);
subplot(1,2,2);
imshow(ifft2_);
