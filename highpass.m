%Write a program to implement high pass first order filter


%To implement a first-order high-pass filter for an image in MATLAB, you can use the built-in filtering functions
%such as imfilter or directly apply the high-pass filter equation. Here's an example program that demonstrates both approaches:
%Using the imfilter function:


% Load the input image
image = imread('girl.jpg');

% Define the high-pass filter coefficients
alpha = 0.8; % Alpha parameter (0 < alpha < 1)
filter_coefficients = [0, -alpha, 0; -alpha, 4*alpha+1, -alpha; 0, -alpha, 0]; % Filter coefficients

% Apply the high-pass filter using the imfilter function
output_image = imfilter(image, filter_coefficients);

% Display the input and output images
subplot(1, 2, 1), imshow(image), title('Input Image');
subplot(1, 2, 2), imshow(output_image), title('High-Pass Filtered Image (Using imfilter)');




%without using imfilter    Using the high-pass filter equation:


% Load the input image
image = imread('house.tif');

% Convert the image to double for calculations
image = im2double(image);

% Define the high-pass filter coefficients
alpha = 0.8; % Alpha parameter (0 < alpha < 1)
filter_coefficients = [0, -alpha, 0; -alpha, 4*alpha+1, -alpha; 0, -alpha, 0]; % Filter coefficients

% Pad the image to handle border pixels
padded_image = padarray(image, [1, 1], 'replicate');

% Apply the high-pass filter using the filter equation
output_image = zeros(size(image));
for i = 2:size(padded_image, 1) - 1
    for j = 2:size(padded_image, 2) - 1
        output_image(i-1, j-1) = sum(sum(padded_image(i-1:i+1, j-1:j+1) .* filter_coefficients));
    end
end

% Display the input and output images
subplot(1, 2, 1), imshow(image), title('Input Image');
subplot(1, 2, 2), imshow(output_image), title('High-Pass Filtered Image (Using filter equation)');





