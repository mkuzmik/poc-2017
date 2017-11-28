%% 1
close all;
clearvars;
clc;

%% 2
img = zeros(11,11);

%% 3
img(5,8) = 1;

%% 4
[H, theta, ro] = hough(img, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

%% 5
figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(H, []);

%% 6
img(3,5) = 1;

[H, theta, ro] = hough(img, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(H, []);

%% 7
img(1,2) = 1;
img(5,5) = 1;

[H, theta, ro] = hough(img, 'RhoResolution', 0.1, 'ThetaResolution', 0.5);

figure;
subplot(1,2,1);
imshow(img);
subplot(1,2,2);
imshow(H, []);

%% 8,9
x_ = theta(360);
y_ = ro(184);

x = 0:0.1:10;
y = ((y_ - x*cos(x_))/sin(x_));

%% 10
figure;
subplot(1,2,1);
imshow(img);
hold on;
plot(x+1, y+1);
