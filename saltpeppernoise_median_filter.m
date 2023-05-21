% Write a program to remove Salt and Pepper noise using median filter.

% Load the noisy image
noisy_image = imread('noisy_img.png');

% Convert the image to grayscale if it's a color image
if size(noisy_image, 3) == 3
    noisy_image = rgb2gray(noisy_image);
end

% Apply median filter to remove Salt and Pepper noise
filtered_image = medfilt2(noisy_image);

% Display the noisy and filtered images side by side
subplot(1, 2, 1), imshow(noisy_image), title('Noisy Image');
subplot(1, 2, 2), imshow(filtered_image), title('Filtered Image');
