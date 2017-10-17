%% clear
clearvars;
close all;
clc;

%% read and show img
original_img = imread('lena.bmp');

%% load lut functions
load funkcjeLUT;

%% show img after lut

LUT(original_img, odwrotna);

LUT(original_img, kwadratowa);

LUT(original_img, log);

LUT(original_img, odwlog);

LUT(original_img, pierwiastkowa);

LUT(original_img, pila);

LUT(original_img, wykladnicza);
