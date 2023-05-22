% Matlab program for Inverse filtering/Deconvolution
clc;
clear all;
close all;
% Read the image 
% a = imread('Maulik.png');
% a = rgb2gray(a);
a=imread('Cameraman.tif');
subplot(1,3,1);
imshow(a);
title('Original Image')

a = im2double(a);
PSF = fspecial('motion',21,11);
a_blurred = imfilter(a,PSF,'conv','circular');
% a_blurred = imnoise(a_blurred, 'gaussian');
subplot(1,3,2);
imshow(a_blurred);
title('Blurred Image');

DD = deconvreg(a_blurred,PSF);
subplot(1,3,3)
imshow(DD);
title('Restored Image');