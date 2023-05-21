% Write a program to eliminate the high frequency component of an image.

%To eliminate the high-frequency components of an image in MATLAB, you can apply a low-pass filter.
%Here's an example code that uses a Gaussian filter to remove the high-frequency components:

% Load the image
image = imread('girl.jpg');

% Convert the image to grayscale if it's a color image
if size(image, 3) == 3
    grayscale_image = rgb2gray(image);
else
    grayscale_image = image;
end

% Convert the image to double for filtering
grayscale_image = im2double(grayscale_image);

% Apply Gaussian low-pass filter to eliminate high-frequency components
sigma = 5; % Standard deviation of the Gaussian filter
filtered_image = imgaussfilt(grayscale_image, sigma);

% Display the original and filtered images
subplot(1, 2, 1), imshow(grayscale_image), title('Original Image');
subplot(1, 2, 2), imshow(filtered_image), title('Filtered Image');
