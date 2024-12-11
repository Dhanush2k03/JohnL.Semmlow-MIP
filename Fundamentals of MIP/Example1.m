%Generate an image of a sinewave grating having a spatial frequency of 2 cycles/inch.
% A sinewave grating is a pattern that is constant in the vertical direction but varies sinusoidally in the horizontal 
% direction. It is used as a visual stimulus in experiments dealing with visual perception. Assume the figure will be 4 
% inches square; hence, the overall pattern should contain four cycles. Place the figure in a 400 by 400 pixel array(i.e., 
% 100 pixels per inch) using a uint8 format.
close all;
clear;
clc;

N = 400;
Nu_cyc = 4;
x = (1:N) * Nu_cyc / N; % Spatial vector

% Generate sinusoidal grating in x direction
I_sin_x = 0.5 * sin(2 * pi * x) + 0.5;

% Repeat the sinewave pattern vertically
I_sin_y = repmat(I_sin_x, N, 1);

% Combine to form a checkerboard pattern
I_checkerboard = I_sin_x .* I_sin_y;

% Convert to 8-bit image
I_8 = uint8(255 * I_checkerboard); % Scale to [0, 255]

% Display the checkerboard pattern
imshow(I_8);
title('Sinewave grating in both directions');
