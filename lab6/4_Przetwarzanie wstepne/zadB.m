%% 1
clear all;
clearvars;
clc;

img = imread('lenaSzum.bmp');

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(medfilt2(img));

%% 2
img = imread('lena.bmp');

figure;
subplot(2,3,1);
imshow(img);
subplot(2,3,2);
imshow(medfilt2(img));
subplot(2,3,3);
imshow(imabsdiff(img,medfilt2(img)),[]);

subplot(2,3,4);
imshow(img);
subplot(2,3,5);
imshow(uint8(conv2(img,fspecial('average'),'same')));
subplot(2,3,6);
imshow(imabsdiff(img,uint8(conv2(img,fspecial('average'),'same'))),[]);

%% 3
med_img = img;

for i = 1:300
   med_img = medfilt2(med_img); 
end
figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(med_img);

%% 4 
