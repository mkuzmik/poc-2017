%% 1 
clear all;
clearvars;
clc;

img = imread('kw.bmp');

load maskiPP;

conved = conv2(img, S2, 'same');

figure;
subplot(1,4,1);
imshow(img);
title('Original img');

subplot(1,4,2);
imshow(abs(conved),[]);
title('abs conved img');

subplot(1,4,3);
imshow(conved + 128, []);
title('+128 conved img');

subplot(1,4,4);
imshow(uint8(imabsdiff(double(img), conved)));
title('Output img');

%% 4
img = imread('jet.bmp');

output = sqrt( conv2(img,S1, 'same') .^ 2 + conv2(img,S2, 'same') .^ 2);
output_simplified = abs(conv2(img,S1, 'same')) + abs(conv2(img,S2, 'same'));

figure;
subplot(1,3,1);
imshow(img);
title('original');

subplot(1,3,2);
imshow(output,[]);
title('comb');

subplot(1,3,3);
imshow(output_simplified,[]);
title('comb_simplified');

