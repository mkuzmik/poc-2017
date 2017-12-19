%% 1

close all;
clearvars;
clc;

global minimum;
global threshold;
global index;
global segRes;
global MRes;

%% 2,3
img_org = imread('umbrealla.png');
threshold = 0.08;
minimum = 4;

img_hsv = rgb2hsv(img_org);
img_h = double(img_hsv(:,:,1));

[y, x] = size(img_h);

segRes = zeros(x,y);
MRes = zeros(x,y);
index = -1;

split(img_h,1,1,x,y);

i = 0;

while i <= index
    IB = segRes == i;
    
    if any(IB(:))
        [yF, xF] = find(IB,1,'first');
        dilate = imdilate(IB,strel('square',3));
        absdiff = imabsdiff(dilate,IB);
        multiplied = absdiff.*segRes;
        nonzerosd = nonzeros(multiplied);
        uniques = unique(nonzerosd);
        
        is_joined = 0;
        for k = 1:numel(uniques);
            IBS = segRes == uniques(k);
            [yFS, xFS] = find(IBS,1,'first');
            
            color_diff = abs(MRes(yF,xF) - MRes(yFS, xFS));
            if color_diff < (5/255)
                segRes(IBS) = i;
                is_joined = 1;
            end
        end
        if is_joined == 0
            i = i+1;
        end
        
    else
        i = i+1;
    end
end

figure;
subplot(1,2,1);
imshow(img_org);
subplot(1,2,2);
imshow(segRes, []);

min = 33;
uni = unique(segRes);
for i = 1:numel(uni)
    C = segRes == uni(i);
    if sum(C) < min
        segRes(C) = 0;
    end
end

for i = 1:numel(uni)
    C = segRes == uni(i);
    segRes(C) = i;
end

img_segmented = label2rgb(segRes);

figure;
subplot(1,2,1);
imshow(img_org);
subplot(1,2,2);
imshow(img_segmented);
