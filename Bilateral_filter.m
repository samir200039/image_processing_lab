clc
clear 
close all


%Read the Image
a = imread('attacked.jpg');
b = size(a);

% Convert to grayscale incase it is color
if size(b,2)==3
a1 = rgb2gray(a);
end

% Plot the Original and Attacked Image
figure;
subplot(1,3,1)
imshow('original.jpg');
title('Original Image')
subplot(1,3,2)
imshow(a);
title('Attacked Image')

a = double(a);

%Initialize the parameters
n = 11;                             %Filter Size
n1=ceil(n/2);
vars =50;                           %Spacial Variance
varr = 25;                          %Pixel Value Variance
c=0;
c1=0;
msg = 'Reducing Noise';
x = 0;
f = waitbar(x,msg);

%Bilateral Filter loop
for i=n1:b(1)-n1
    for j=n1:b(2)-n1
        for k=1:n
            for l=1:n
            c=c+gs(sqrt((-n1+k)^2+(-n1+l)^2),0,vars)*gs(a(i-n1+k,j-n1+l),a(i,j),varr)*a(i-n1+k,j-n1+l);
            c1=c1+gs(sqrt((-n1+k)^2+(-n1+l)^2),0,vars)*gs(a(i-n1+k,j-n1+l),a(i,j),varr);
            end
        end
        
        d(i-n1+1,j-n1+1)=c/c1;
        c=0;
        c1=0;
    end
    x = i/(b(1)-n1);
    waitbar(x,f)  
end

%Convert Output image To uint8
d1 = uint8(d);
close(f)

% Plot the restored image
subplot(1,3,3)
imshow(d1);
title('Restored Image using Bilateral Filter')

