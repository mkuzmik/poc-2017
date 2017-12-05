%% 1 
close all;
clearvars;
clc;

%% 2
img = imread('knee.png');

figure;
imshow(img);

% [x,y] = ginput(1);
x = 289
y = 315

x = floor(x);
y = floor(y);
img = double(img);

%% 3
threshold = 2

[size_x size_y] = size(img);
visited = zeros(size(img));
segmented = zeros(size(img));
stack = zeros(2,10000);

stack_ptr = 1;
stack(1,stack_ptr) = x;
stack(2,stack_ptr) = y;

while stack_ptr > 0
    p_x = stack(1,stack_ptr);
    p_y = stack(2,stack_ptr);
    stack_ptr = stack_ptr - 1;
    
    if (p_x < 2 || p_x > size_x - 1) 
        continue;
    end;
    if (p_y < 2 || p_y > size_y - 1) 
        continue;
    end;
    
    for i = 1:size_x
        for j = 1:size_y
            if visited(i,j) == 1
                continue;
            end
            visited(i,j) = 1;
          
            diff = abs(img(p_x,p_y) - img(i,j));
            
            if diff < threshold
                stack_ptr = stack_ptr + 1;
                stack(1,stack_ptr) = i;
                stack(2,stack_ptr) = j;
                segmented(i,j) = 1;
              
            end
        end
    end
end

%% 
imshow(segmented, []);