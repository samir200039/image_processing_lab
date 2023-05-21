%9. Write a program to perform edge detection using different operators

% Load the image
image = imread('girl.jpg');

% Convert the image to grayscale if it's a color image
if size(image, 3) == 3
    grayscale_image = rgb2gray(image);
else
    grayscale_image = image;
end

% Apply different edge detection operators
sobel_edges = edge(grayscale_image, 'Sobel');
prewitt_edges = edge(grayscale_image, 'Prewitt');
roberts_edges = edge(grayscale_image, 'Roberts');
log_edges = edge(grayscale_image, 'log');
canny_edges = edge(grayscale_image, 'Canny');

% Display the original image and the detected edges
subplot(2, 3, 1), imshow(image), title('Original Image');
subplot(2, 3, 2), imshow(sobel_edges), title('Sobel Edges');
subplot(2, 3, 3), imshow(prewitt_edges), title('Prewitt Edges');
subplot(2, 3, 4), imshow(roberts_edges), title('Roberts Edges');
subplot(2, 3, 5), imshow(log_edges), title('Log Edges');
subplot(2, 3, 6), imshow(canny_edges), title('Canny Edges');


