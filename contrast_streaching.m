% Read the input image
inputImage = imread('input_image.jpg');

% Convert the image to grayscale if needed
grayImage = rgb2gray(inputImage);

% Compute the minimum and maximum pixel values
minValue = min(grayImage(:));
maxValue = max(grayImage(:));

% Define the desired range for the output image
outputMin = 0;  % desired minimum value
outputMax = 255;  % desired maximum value

% Perform contrast stretching
outputImage = (double(grayImage) - minValue) * ((outputMax - outputMin) / (maxValue - minValue)) + outputMin;
outputImage = uint8(outputImage);

% Display the original and enhanced images
subplot(1, 2, 1);
imshow(grayImage);
title('Original Image');

subplot(1, 2, 2);
imshow(outputImage);
title('Enhanced Image');

% Save the enhanced image
imwrite(outputImage, 'enhanced_image.jpg');
