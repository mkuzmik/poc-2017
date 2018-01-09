%% 1,2,3
close all;
clearvars;
clc;

img = imread('shapes.png');



indexed = bwlabel(img, 4);

imshow(indexed,[]);

wsp = obliczWspolczynniki(indexed)


r = regionprops(indexed, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end

[YY,XX] = size(img);

for x=1:XX
    for y=1:YY
        px = indexed(x,y);
        if (px ~= 0 && (wsp(px,3) > 5.0 || wsp(px,3) < 4.8))
            indexed(x,y) = 0;
        end
    end
end

figure;
imshow(indexed,[]);

%% 6 
img = imread('shapesReal.png');

originalImg = img;

img = rgb2gray(img);

img = imerode(img, strel('disk',3));

img = uint8(im2bw(img, 0.3));

[XX,YY] = size(img);

for x=1:XX
    for y=1:YY
        if (img(x,y) == 0)
            img(x,y) = 1;
        else
            img(x,y) = 0;
        end
    end
end

indexed = bwlabel(img, 4);

figure;
imshow(indexed,[]);

wsp = obliczWspolczynniki(indexed)

r = regionprops(indexed, 'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end

[XX,YY] = size(img);

for x=1:XX
    for y=1:YY
        px = indexed(x,y);
        if (px ~= 0 && (wsp(px,2) > 0.7 || wsp(px,2) < 0.6 || wsp(px,3) < 5))
            indexed(x,y) = 0;
        end
    end
end

figure;
subplot(1,2,1);
imshow(originalImg);
subplot(1,2,2);
imshow(indexed,[]);


