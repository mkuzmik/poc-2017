%% clear
clearvars;
close all;
clc;

%% read and show img
lena_img = imread('lena.bmp');
jet_img = imread('jet.bmp');
figure;
imshow(lena_img);
figure;
imshow(jet_img);

%% adding images
added_imgs = imadd(lena_img, jet_img, 'uint16');
figure;
imshow(added_imgs, []);

%% linear combination
imshow(imlincomb(0.45,lena_img, 0.9, jet_img));

%% subtraction
lena_img16 = uint16(lena_img);
jet_img16 = uint16(jet_img);
img = imsubtract(lena_img16, jet_img16);
figure;
imshow(img,[]);

%% abs diff
lena_img16 = uint16(lena_img);
jet_img16 = uint16(jet_img);
img = imabsdiff(lena_img16, jet_img16);
figure;
imshow(img, []);

%% multiply
mask = boolean(imread('kolo.bmp'));
figure;
imshow(immultiply(mask,lena_img));

%% imcomplement
img = imcomplement(lena_img);
figure;
imshow(img);




