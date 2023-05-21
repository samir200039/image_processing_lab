%Write a program for resizing the image using inbuilt commands and without
%using inbuilt commands.

% Load the image
image = imread('house.tif');

% Define the desired new size
new_height = 400;
new_width = 600;

% Resize the image using inbuilt imresize function
resized_image = imresize(image, [new_height, new_width]);

% Display the resized image
imshow(resized_image);
title('Resized Image (Using inbuilt imresize)');

%Without Using Inbuilt Commands:
% Load the image
image = imread('girl.jpg');

% Define the desired new size
new_height = 400;
new_width = 600;

% Get the original image size
[height, width, ~] = size(image);

% Compute the scaling factors
scale_x = new_width / width;
scale_y = new_height / height;

% Create the resized image using interpolation
resized_image = zeros(new_height, new_width, size(image, 3), class(image));
for y = 1:new_height
    for x = 1:new_width
        % Calculate the corresponding position in the original image
        src_y = round((y - 0.5) / scale_y + 0.5);
        src_x = round((x - 0.5) / scale_x + 0.5);
        
        % Make sure the position is within the original image bounds
        src_y = max(1, min(height, src_y));
        src_x = max(1, min(width, src_x));
        
        % Assign the pixel value from the original image to the resized image
        resized_image(y, x, :) = image(src_y, src_x, :);
    end
end

% Convert the resized image back to uint8 (if the original image was uint8)
resized_image = uint8(resized_image);

% Display the resized image
imshow(resized_image);
title('Resized Image (Without using inbuilt commands)');
