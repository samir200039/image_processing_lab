%Write a program to extract the bit planes of a grayscale image.

% Load a grayscale image
image = imread('house.jpg');

% Get the size of the image
[height, width] = size(image);

% Extract the bit planes
bit_planes = cell(8, 1); % Cell array to store each bit plane
for bit = 0:7
    bit_plane = bitget(image, bit + 1); % Extract the specific bit plane
    bit_planes{bit + 1} = uint8(bit_plane) * 255; % Scale the bit plane to 0-255
end

% Display the bit planes
figure;
for bit = 0:7
    subplot(2, 4, bit + 1), imshow(bit_planes{bit + 1}), title(['Bit Plane ', num2str(bit)]);
end
