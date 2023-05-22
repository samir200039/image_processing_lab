% Matlab program for Wiener filtering
clc;
clear all;
close all;
% Read the image 
a=imread('box.png');
subplot(1,3,1);
imshow(a);
title('Original Image')

a = im2double(a);
PSF = fspecial('motion',21,11);
a_blurred = imfilter(a,PSF,'conv','circular');
noise_mean = 0;
noise_var = 0.0001;
signal_var = var(a(:));
NSR = noise_var / signal_var;
a_blurred = imnoise(a_blurred, 'gaussian',noise_mean,noise_var);
subplot(1,3,2);
imshow(a_blurred);
title('attacked image');

%NSR=0.01;  if we take value 0.01 then we get closed image
DD = deconvwnr(a_blurred,PSF,NSR);
subplot(1,3,3)
imshow(DD);
title('Restored Image');


