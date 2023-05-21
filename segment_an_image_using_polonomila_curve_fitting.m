% Read the grayscale image
image = imread('house.tif');

% Convert the image to double for processing
image = im2double(image);

% Define the degree of the polynomial curve
degree = 1;

% Get the image size
[height, width] = size(image);

% Create x-coordinates for polynomial curve fitting
x = 1:height;

% Perform polynomial curve fitting for each row of the image
segmented_image = zeros(height, width);
for i = 1:height
    p = polyfit(x, image(i, :), degree);
    curve = polyval(p, x);
    segmented_image(i, :) = curve;
end

% Normalize the segmented image
segmented_image = (segmented_image - min(segmented_image(:))) / (max(segmented_image(:)) - min(segmented_image(:)));

% Display the original and segmented images
subplot(1, 2, 1), imshow(image), title('Original Image');
subplot(1, 2, 2), imshow(segmented_image), title('Segmented Image');
