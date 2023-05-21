%Write a program to color an image and perform read and write operation.

% Read the image
grayscale_image = imread('house.tif');

% Create a colormap for coloring the image
color_map = jet(256); % Choose any colormap of your preference

% Normalize the grayscale image
normalized_image = double(grayscale_image) / 255;

% Apply the colormap to colorize the image
colored_image = ind2rgb(grayscale_image, color_map);

% Display the original and colored images
subplot(1, 2, 1), imshow(grayscale_image), title('Grayscale Image');
subplot(1, 2, 2), imshow(colored_image), title('Colored Image');

% Write the colored image to a file
imwrite(colored_image, 'colored_image.jpg');
