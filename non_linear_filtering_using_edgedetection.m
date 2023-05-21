%Write a program to show the non-linear filtering technique using edge
%detection. correct code in matlab

% Load the image
image = imread('girl.jpg');

% Convert the image to grayscale if it's a color image
if size(image, 3) == 3
    grayscale_image = rgb2gray(image);
else
    grayscale_image = image;
end

% Apply Canny edge detection
canny_edges = edge(grayscale_image, 'Canny');

% Display the original image and the detected edges
subplot(1, 2, 1), imshow(image), title('Original Image');
subplot(1, 2, 2), imshow(canny_edges), title('Canny Edges');
