%Write a program to discretize an image using Fourier transform. correct code in matlab

% Load the image
image = imread('girl.jpg');

% Convert the image to grayscale if it's a color image
if size(image, 3) == 3
    grayscale_image = rgb2gray(image);
else
    grayscale_image = image;
end

% Perform Fourier Transform
fourier_image = fft2(grayscale_image);

% Shift the zero frequency component to the center of the spectrum
shifted_image = fftshift(fourier_image);

% Perform inverse Fourier Transform
reconstructed_image = ifft2(ifftshift(shifted_image));

% Display the original and reconstructed images
subplot(1, 2, 1), imshow(grayscale_image), title('Original Image');
subplot(1, 2, 2), imshow(abs(reconstructed_image)), title('Reconstructed Image');



%if it's a color image, it converts it to grayscale using the rgb2gray function. 
%Then, the Fourier Transform is performed on the grayscale image using the fft2 function.
%Next, the zero frequency component is shifted to the center of the spectrum using the fftshift function. 
%After that, the inverse Fourier Transform is applied using the ifft2 function followed by shifting the spectrum back to
%its original position using ifftshift. The resulting reconstructed image is stored in the 
%reconstructed_image variable. Finally, the original and reconstructed images are displayed side by side using the subplot function.
