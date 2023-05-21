%Write a program to find the histogram value and display the histogram of a
%grayscale and color image

% Load a grayscale image
grayscale_image = imread('house.tif');

% Load a color image
color_image = imread('girl.jpg');

% Compute histogram for grayscale image
grayscale_histogram = zeros(256, 1);
[height, width] = size(grayscale_image);
for y = 1:height
    for x = 1:width
        intensity = grayscale_image(y, x);
        grayscale_histogram(intensity + 1) = grayscale_histogram(intensity + 1) + 1;
    end
end

% Compute histogram for color image
color_histogram = zeros(256, 1);
[height, width, ~] = size(color_image);
for y = 1:height
    for x = 1:width
        intensity = color_image(y, x, 1);  % Red channel
        color_histogram(intensity + 1) = color_histogram(intensity + 1) + 1;
    end
end

% Display the histograms
subplot(2, 1, 1), bar(0:255, grayscale_histogram), title('Histogram of Grayscale Image');
xlabel('Intensity');
ylabel('Frequency');

subplot(2, 1, 2), bar(0:255, color_histogram), title('Histogram of Color Image');
xlabel('Intensity');
ylabel('Frequency');
