%Load the file b_mask.tif and MATLAB's image blood1.tif used in Examples 10.7
% and 10.8. The file b_mask.tif contains a binary image where the 1s indicate 
% the placement and shape of the blood cells in blood1.tif and the Os represent 
% the background. Such a file is referred to as a mask and comes from a 
% segmenta- tion operation on the cell image, as covered in Chapter 12. Use
% the mask file to isolate the cells and plot them in shades of red (the intensity
% values inside the cells encoded as red) and the background as a solid blue

clc
clear

% Load the images

a= imread("at3_1m4_09.tif");
bMask  = imbinarize(a);
bloodImage = imread('38811.tif');

% Create a red channel with intensity values inside the cells
redChannel = double(bloodImage) .* double(bMask);

% Create a blue channel for the background
blueChannel = 255 - double(bMask);

% Combine the red and blue channels
combinedImage = cat(3, redChannel, zeros(size(bloodImage)), blueChannel);
combinedImage = uint8(combinedImage); % Convert back to uint8

% Display the result
imshow(combinedImage);
title('Cells in Red, Background in Blue');
