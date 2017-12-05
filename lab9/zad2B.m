%% 1,2
close all;
clearvars;
clc;

img = imread('kwadraty.png');
figure;
subplot(1,2,1);
imshow(img);
edges = edge(img, 'sobel');
subplot(1,2,2);
imshow(edges);

%% 3,4
[H, theta, ro] = hough(edges);

figure;
imshow(H, []);

%% 5,6,7
peaks = houghpeaks(H, 8);

imshow(H, []); title('Hough');
hold on;
plot(peaks(:,2), peaks(:,1), 'o');
hold off;

%% 9
lines = houghlines(edges, theta, ro, peaks);

%% 10
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
