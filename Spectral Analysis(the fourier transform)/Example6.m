%construct a series of projective transformation that, when shown as a
%mmovie , give the apperance of the image titling backward in space. Use
%one of the frames of MRI image
clc
clear

% Define parameters for transformation
Nu_frame = 12; % Number of frames
Max_tilt = 0.5; % Maximum tilt angle in radians

% Load the MRI image
[I, map] = imread('mri.tif', Nu_frame);

% Convert to grayscale if necessary
if size(I, 3) > 1
    I_gray = rgb2gray(I);
else
    I_gray = I;
end

% Convert to RGB (since imwarp requires RGB images)
I_rgb = cat(3, I_gray, I_gray, I_gray);

% Get image size
[M, N, ~] = size(I_rgb);

% Initialize an array to store transformed frames
I_proj = zeros(M, N, 3, Nu_frame); % Store RGB images

% Create figure for animation
figure;
axis tight manual;
title('Tilting MRI Image Backward in Space');
xlabel('X-axis');
ylabel('Y-axis');

% Loop to generate transformed frames
for i = 1:Nu_frame
    % Calculate the tilt angle for this frame
    tilt_angle = -Max_tilt * i / Nu_frame; % Negative for backward tilt
    
    % Create the projective transformation matrix
    T = [1, 0, 0; 0, 1, 0; 0, tan(tilt_angle), 1];
    
    % Apply the transformation using imwarp
    I_proj(:, :, :, i) = imwarp(I_rgb, projective2d(T));
    
    % Display the transformed frame
    imshow(I_proj(:, :, :, i), []);
    drawnow;
    
    % Pause for a short duration to create the animation effect
    pause(0.1); % Adjust as needed for desired animation speed
end

% Create a movie from the transformed frames
movieFrames(Nu_frame) = struct('cdata', [], 'colormap', []);
for i = 1:Nu_frame
    movieFrames(i) = im2frame(uint8(I_proj(:, :, :, i) * 255));
end

% Play the movie
movie(movieFrames);

