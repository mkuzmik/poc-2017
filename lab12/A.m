%% 
close all;
clearvars;
clc;

img = imread('dwieFale.bmp');

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

%% 6
figure;

kolo = imread('kolo.bmp');
kwadrat = imread('kwadrat.bmp');
kwadrat45 = imread('kwadrat45.bmp');
trojkat = imread('trojkat.bmp');

img = kolo;

fft2_ = fft2(img);

Am = log10(abs(fft2_) + 1);
F = angle(fft2_ .* (Am>0.0001));

subplot(4,3,1);
imshow(img);
subplot(4,3,2);
imshow(Am,[]);
subplot(4,3,3);
imshow(F);

img = kwadrat;

fft2_ = fft2(img);

Am = log10(abs(fft2_) + 1);
F = angle(fft2_ .* (Am>0.0001));

subplot(4,3,4);
imshow(img);
subplot(4,3,5);
imshow(Am,[]);
subplot(4,3,6);
imshow(F);

img = kwadrat45;

fft2_ = fft2(img);

Am = log10(abs(fft2_) + 1);
F = angle(fft2_ .* (Am>0.0001));

subplot(4,3,7);
imshow(img);
subplot(4,3,8);
imshow(Am,[]);
subplot(4,3,9);
imshow(F);

img = trojkat;

fft2_ = fft2(img);

Am = log10(abs(fft2_) + 1);
F = angle(fft2_ .* (Am>0.0001));

subplot(4,3,10);
imshow(img);
subplot(4,3,11);
imshow(Am,[]);
subplot(4,3,12);
imshow(F);

%%

F1 = fft(img, [], 1);
F2 = fft(F1,[],2);

FFT2 = fft2(img);

figure;
subplot(1,3,1);
imshow(F2);
subplot(1,3,2);
imshow(FFT2);
subplot(1,3,3);
imshow(F2 - FFT2);

