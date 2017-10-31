%% clear
clc;
close all;
clearvars;

%% avg local
img = imread('katalog.bmp');
[x,y] = size(img);
bw_img = img;

window_size = 7;

for i = 1:x
    for j = 1:y
        avg = meanLT(i,j,window_size,img,x,y);
        if bw_img(i,j) > avg
            bw_img(i,j) = 255;
        else
            bw_img(i,j) = 0;
        end
    end
end

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(bw_img);

%% squvola local
img = imread('katalog.bmp');
[x,y] = size(img);
bw_img = img;

window_size = 7;
k = 0.15;
R = 128;

for i = 1:x
    for j = 1:y
        avg = meanLT(i,j,window_size,img,x,y);
        std = stddevLT(i,j,window_size,img, avg, x, y);
        
        a = avg * (1 + k * ((std/R) - 1));
        b = avg * (1 - k * ((std/R) - 1));

        
        
        if bw_img(i,j) > threshold
            bw_img(i,j) = 255;
        else
            bw_img(i,j) = 0;
        end
    end
end

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(bw_img);