%% 1
clear all;
clearvars;
clc;

img = imread('moon.tif');

%% 2
mask = [0 1 0;
        1 -4 1;
        0 1 0];
    
%% 3
[x, y] = size(mask);
mask = mask ./ (x * y);

%% 4
conved = conv2(img, mask, 'same');

figure;
subplot(1,3,1);
imshow(img);
title('Original img');

subplot(1,3,2);
imshow(abs(conved),[]);
title('abs conved img');

subplot(1,3,3);
imshow(conved + 128, []);
title('+128 conved img');

%% 5
mask = fspecial('laplacian');

conved = conv2(img, mask, 'same');

figure;
subplot(1,3,1);
imshow(img);
title('Original img');

subplot(1,3,2);
imshow(conved,[]);
title('conved');

subplot(1,3,3);
imshow(uint8(imabsdiff(double(img), conved)));
title('Output img');
