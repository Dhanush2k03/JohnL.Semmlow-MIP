%Load the image of a cancer cell (from rat prostate, courtesy of Alan W. Partin, M.D., 
% Johns Hopkins University School of Medicine), cell.tif on the CD, and apply a 
% gamma correction to the intensity values of the image. Specifically, modify each 
% pixel in the image by a function that is a quarter-wave sinewave. That is, the 
% corrected pixels are the output of the sine function of the input pixels:
% Out(m, n)=f(In(m.n)) (see plot below)
clc
clear
% Load the image of the cancer cell
original_image = imread('cell.tif');

% Define the quarter-wave sine function for gamma correction
quarter_wave_sine = @(x) sin(pi * x / 2);

% Apply gamma correction to each pixel of the image
gamma_corrected_image = quarter_wave_sine(double(original_image) / 255) * 255;

% Display the original and corrected images for comparison
figure;
subplot(1, 2, 1);
imshow(original_image);
title('Original Image');

subplot(1, 2, 2);
imshow(uint8(gamma_corrected_image));
title('Gamma Corrected Image');

% Show the quarter-wave sine function plot
x = linspace(0, 1, 1000);
y = quarter_wave_sine(x);
figure;
plot(x, y);
title('Quarter-Wave Sine Function');
xlabel('Input Intensity');
ylabel('Corrected Intensity');
