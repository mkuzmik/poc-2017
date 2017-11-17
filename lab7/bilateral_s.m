clc;
clear all;
clear vars;

load MR_data.mat

local_window = [9,9];

img = I_noisy1;

bild = bilateral(I_noisy1, local_window);

figure;
subplot(1,2,1);
imshow(uint8(img), []);
subplot(1,2,2);
imshow(uint8(bild), []);

function Img = bilateral(data, local_window)

    fun = @(data_, local_window_) bilateral_local(data_, local_window_);
    
    Img = colfilt(data, local_window, 'sliding', fun, local_window);
end

function Out = bilateral_local(data, local_window)
 Nx = size(data, 2);
 h = fspecial('gaussian', local_window, 5);
 ro = 15;
 
 for i = 1:Nx
    patch = reshape(data(:, i), local_window);
     
    [rows, cols] = find(patch == patch);
    rows = reshape(rows, local_window);
    cols = reshape(cols, local_window);
    
    Ncy = ceil(local_window(1)/2);
    Ncx = ceil(local_window(2)/2);
    
    dist = sqrt((Ncy - rows).^2 + (Ncx - cols).^2);
    
    dist = dist .* h;
    diff = abs(patch - patch(Ncy,Ncx));
    
    y = exp(((-1)*(diff .* diff))/(2*ro*ro));
    
    Out(i) = sum(sum(dist .* y .* patch)) / sum(sum(dist .* y));

 end
end