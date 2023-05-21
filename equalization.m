%Write a program to implement histogram equalization without using inbuilt
%function. in matlab 

% Load an image
image = imread('girl.jpg');
image = rgb2gray(image);

% Compute histogram
histogram = zeros(256, 1);
[height, width] = size(image);
for y = 1:height
    for x = 1:width
        intensity = image(y, x);
        histogram(intensity + 1) = histogram(intensity + 1) + 1;
    end
end

% Compute cumulative distribution function (CDF)
cdf = zeros(256, 1);
cdf(1) = histogram(1) / (height * width);
for i = 2:256
    cdf(i) = cdf(i - 1) + histogram(i) / (height * width);
end

% Scale CDF values to 0-255
cdf_scaled = uint8(cdf * 255);

% Apply equalization
equalized_image = zeros(size(image), 'uint8');
for y = 1:height
    for x = 1:width
        intensity = image(y, x);
        equalized_image(y, x) = cdf_scaled(intensity + 1);
    end
end

% Display the original and equalized images
subplot(1, 2, 1), imshow(image), title('Original Image');
subplot(1, 2, 2), imshow(equalized_image), title('Equalized Image');
