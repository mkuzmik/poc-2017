%% 1
clear all;
clearvars;
clc;

%% 2
img = imread('plansza.bmp');

%% 4
avg_f = fspecial('average',3);
conved_img = uint8(conv2(img,avg_f,'same'));
diff = imabsdiff(img,conved_img);

figure;
subplot(1,3,1);
imshow(img);
subplot(1,3,2);
imshow(conved_img);
subplot(1,3,3);
imshow(diff,[]);

%% 6
win_sizes = [3 5 9 15 36 48 96];

figure;
[x, s] = size(win_sizes);
for i = 1:s
    avg_f = fspecial('average',win_sizes(i));
    conved_img = uint8(conv2(img,avg_f,'same'));
    
    subplot(1,s,i);
    imshow(conved_img);
    title(int2str(win_sizes(i)));
end
    
%% 7
img = imread('lena.bmp');
win_sizes = [3 5 9 15 36 48 96];

figure;
[x, s] = size(win_sizes);
for i = 1:s
    avg_f = fspecial('average',win_sizes(i));
    conved_img = uint8(conv2(img,avg_f,'same'));
    
    subplot(1,s,i);
    imshow(conved_img);
    title(int2str(win_sizes(i)));
end

%% 8
mask = [1 2 1;
        2 4 2;
        1 2 1];
 
mask = mask ./ sum(sum(mask));

conved_img = uint8(conv2(img,mask,'same'));
diff = imabsdiff(img,conved_img);

figure;
subplot(1,3,1);
imshow(img);
subplot(1,3,2);
imshow(conved_img);
subplot(1,3,3);
imshow(diff,[]);

%% 10
mask = fspecial('gaussian', 5, 0.5);

figure;
mesh(mask);

%% 11
sizes = [5 5 5 10];
stds = [0.1 0.5 1 0.5];

figure;
[x, s] = size(sizes);
for i = 1:s
    f = fspecial('gaussian',sizes(i),stds(i));
    conved_img = uint8(conv2(img,f,'same'));
    
    subplot(1,s,i);
    imshow(conved_img);
    title(strcat('size: ', int2str(sizes(i)) , ' stddev: ' , int2str(stds(i))));
end
