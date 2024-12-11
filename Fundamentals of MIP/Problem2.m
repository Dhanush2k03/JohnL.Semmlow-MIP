%Load the x-ray image of the spine, spine.tif, from the MATLAB Image Process- ing Toolbox. 
% Slice the image into four different levels, then plot it in pseudocolor using red, green, blue, and yellow for each slice.
% The 0-level slice should be blue; the next highest, green; the next, red; and the highest level, yellow. Use grayslice.
% m and construct your own colormap. Plot the original and sliced images in the same figure. 
% (If the original image also displays in pseudocolor, it is because the computer display is using the same four-level 
% colormap for both images. In this case, you should convert the sliced image to RGB before displaying.)
% Load the x-ray image of the spine

clc
clear

% Load the x-ray image of the spine
[x, map] = imread('spine.tif');
I = ind2gray(x, map); % Convert indexed image to grayscale

% Use grayslice.m to slice the image into four different levels
levels = grayslice(I, 4); % Slice the image into four levels

% Create a custom colormap for pseudocolor display
customColormap = [0 0 1; 0 1 0; 1 0 0; 1 1 0]; % Blue, Green, Red, Yellow

% Plot the original and sliced images in the same figure
figure;
imshow(I);
figure;
imshow(I, customColormap); % Display the original image in pseudocolor
title('Original Image');

figure;
RGB = label2rgb(levels, customColormap); % Convert sliced image to RGB
imshow(RGB); % Display the sliced image in pseudocolor
title('Sliced Image');

colormap(customColormap); % Apply the custom colormap
colorbar; % Show the colorbar