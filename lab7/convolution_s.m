clc;
clear all;
clear vars;

load MR_data.mat

local_window = [9,9];

img = I_noisy1;

convd = convolution(I_noisy1, local_window);

figure;
subplot(1,2,1);
imshow(img, []);
subplot(1,2,2);
imshow(convd, []);

function Img = convolution(data, local_window)

    fun = @(data_, local_window_) convolution_local(data_, local_window_);
    
    Img = colfilt(data, local_window, 'sliding', fun, local_window);
end

function Out = convolution_local(data, local_window)
 Nx = size(data, 2);
 h = fspecial('gaussian', local_window, 0.7);
 
 for i = 1:Nx
     patch = reshape(data(:,i), local_window);
     Out(i) = sum(sum(patch .* h));
 end
end