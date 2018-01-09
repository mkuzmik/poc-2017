%% 1 
close all;
clearvars;
clc;

img = imread('ccl1.png');

imshow(img);
result = img;
%% 2

[YY,XX] = size(img);
L = 1;
N = 256;
id = 1:N;

for x=2:YY-1
    for y=2:XX-1
        if (img(x,y) ~= 0)
            neighbours = [result(x-1,y-1) result(x-1,y) result(x-1,y+1) result(x,y-1)];
            if (sum(neighbours) == 0)
                % a
                result(x,y) = L;
                L = L + 1;
            else
                nonz = nonzeros(neighbours);
                min_ = min(nonz);
                max_ = max(nonz);
                if (min_ == max_)
                    % b
                    result(x,y) = max_;
                else
                    % c
                    result(x,y) = min_;

                    id = union(id, min_, max_);
                end
            end
        end
    end
end

%% 3

figure;
subplot(1,3,1);
imshow(img);
title('original img');
subplot(1,3,2);
imshow(label2rgb(result));
title('actual result');
subplot(1,3,3);
imshow(imread('ccl1Result.png'));
title('expected result');

%% drugi przebieg

lut = zeros(N,1);

for i = 1:N
    lut(i) = root(id,i);
end

for x=2:YY-1
    for y=2:XX-1
        if result(x,y) > 0
            result(x,y) = lut(result(x,y));
        end
    end
end

figure;
imshow(label2rgb(result));


function index = root(arr,index)
    while index ~= arr(index)
        index = arr(index);
    end
end

function res = union(tab,start,end_)

id_start = start;
id_end = end_;
res = tab;

if id_start > id_end
    id_start = q;
    id_end = p;
end

res(root(tab,id_start)) = root(tab,id_end);

end