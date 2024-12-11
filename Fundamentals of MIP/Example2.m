%Generate a multiframe variable consisting of a series of sinewave gratings having different phases. Display these images 
% as a montage. Border the images with black for separation on the montage plot. Generate 12 frames, but reduce the image to 
% 100 by 100 to save memory.

clc; % Clear the command window
clear; % Clear workspace

% Parameters
N = 100; % Original image size
M = 12;  % Number of frames
Nu_cyc = 2
x   = (1:N)*Nu_cyc/N;

% Initialize the multiframe array
MFW = zeros(N, N, 1, M, 'uint8');

% Generate sinewave gratings with different phases
for j = 1:M
    phase = 2 * pi * (j - 1) / M;
    I_sin = 0.5 * sin(2 * pi * x + phase) + 0.5;
    
    % Add black borders for separation
    I_sin = [zeros(1, 10), I_sin, zeros(1, 10)]; % 10 pixels black border
    
    % Resize to 100x100
    I_resized = imresize(I_sin, [100, 100]);
    
    % Store in the multiframe array
    MFW(:, :, 1, j) = im2uint8(I_resized);
end

% Display the montage with black borders
figure;
montage(MFW);
title('Sinewave Gratings with Different Phases');
