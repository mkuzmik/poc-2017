%% 1,2
close all;
clearvars;
clc;

%% 2
img = imread('lab112.png');
cleared = im2bw(img, 0.2);

cleared = imdilate(cleared, ones(3,10));
imshow(cleared);

%% 
figure;
subplot(1,2,1);
imshow(img);
edges = edge(cleared, 'sobel', []);
subplot(1,2,2);
imshow(edges);

%% 3
[H, theta, rho] = hough(edges);

peaks = houghpeaks(H, 8);
lines = houghlines(edges, theta, rho, peaks);


figure, imshow(img), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
hold off;

%% 4
img = imread('dom.png');
[H, theta, rho] = hough(img);

peaks = houghpeaks(H, 50);

figure();
imshow(H, []);
hold on;
plot(peaks(:,2), peaks(:,1), 'o');
hold off;