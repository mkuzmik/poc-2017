
clc;
clear all;
clear vars;

load MR_data.mat

local_window = [10,10];

convolution(I_noisy1, local_window);

function Img = convolution(data, local_window)

    fun = @(data_, local_window_) convolution_local(data_, local_window_);
    
    Img = colfilt(data, local_window, 'sliding', fun, local_window);
end

function Out = convolution_local(data_, local_window_)
size(data_)
Out = data_;
end