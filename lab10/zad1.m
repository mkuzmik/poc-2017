%% 1 
close all;
clearvars;
clc;

%% 2
img = imread('knee.png');

figure;
imshow(img);

%[x,y] = ginput(1);
x = 280;
y = 320;

x = floor(x);
y = floor(y);
img = double(img);

%% 3,4,5,6,7
threshold = 41
ctx = 1

mV = img(x,y)
nS = 1

[size_x size_y] = size(img);
visited = zeros(size(img));
segmented = zeros(size(img));
stack = zeros(2,10000);

stack_ptr = 1;
stack(1,stack_ptr) = x;
stack(2,stack_ptr) = y;

%Icopy = img;

%figure;
%imshow(Icopy, []);

while stack_ptr > 0
    p_x = stack(1,stack_ptr);
    p_y = stack(2,stack_ptr);
    stack_ptr = stack_ptr - 1;
    
    nS = nS + 1;
    mV = (mV * (nS - 1) + img(p_x,p_y)) / nS;
    
    if (p_x < ctx + 1 || p_x > size_x - ctx) 
        continue;
    end;
    if (p_y < ctx + 1 || p_y > size_y - ctx) 
        continue;
    end;
    
    for i = (p_x - ctx):(p_x + ctx)
        for j = (p_y - ctx):(p_y + ctx)
            if visited(i,j) == 1
                continue;
            end
            visited(i,j) = 1;
          
            diff = abs(img(p_x,p_y) - mV);
            
            if diff < threshold
                stack_ptr = stack_ptr + 1;
                stack(1,stack_ptr) = i;
                stack(2,stack_ptr) = j;
                segmented(i,j) = 1;
            end
        end
    end
    
    %Icopy(segmented > 0) = 255;
    %drawnow
end

h = fspecial('gaussian', [5 5], 4);
filtered = imfilter(segmented, h);

figure;
subplot(1,2,1);
imshow(img, []);
subplot(1,2,2);
imshow(filtered, []);