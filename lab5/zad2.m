%% clear
clc;
close all;
clearvars;

%% avg local
img = imread('katalog.bmp');
[x,y] = size(img);
bw_img = img;

% properties
window_size = 15;

for i = 1:x
    for j = 1:y
        
        avg = meanLT(i,j,floor(window_size/2),img,x,y);
        
        threshold = avg;
        
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

%% squvola local
img = imread('katalog.bmp');
[x,y] = size(img);
bw_img = img;

% properties
window_size = 20;
k = 0.05;
R = 128;

for i = 1:x
    for j = 1:y
        avg = meanLT(i,j,floor(window_size/2),img,x,y);
        std = stddevLT(i,j,floor(window_size/2),img, avg, x, y);
        
        a = avg * (1 + k * ((std/R) - 1));
        b = avg * (1 - k * ((std/R) - 1));

        % TODO (a or b)
        threshold = a;
        
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