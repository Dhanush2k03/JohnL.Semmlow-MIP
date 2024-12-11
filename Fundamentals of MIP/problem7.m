%Load the blood cell image in blood1.tif on the CD. Write a sliding neighborhood 
% function to enhance horizontal boundaries that go from dark to light. 
% Write a second function that enhances boundaries that go from light to dark. 
% Threshold both images so as to enhance the boundaries. Use a 3 by 2 sliding block.
% (Hint: This program may require several minutes to run. You do not need to rerun
% the program each time to set the threshold for the two binary images. 
% This can be done outside the program from the MATLAB command line.)
clc
clear
% Load the blood cell image
bloodImage = imread('38811.tif');

% Enhance horizontal boundaries from dark to light
enhancedImage1 = imadjust(bloodImage, [0.2, 0.8], [0, 1]);

% Enhance boundaries from light to dark
enhancedImage2 = imadjust(bloodImage, [0.2, 0.8], [1, 0]);

% Threshold both images
threshold1 = graythresh(enhancedImage1);
binaryImage1 = imbinarize(enhancedImage1, threshold1);

threshold2 = graythresh(enhancedImage2);
binaryImage2 = imbinarize(enhancedImage2, threshold2);

% Display the results
figure;
subplot(2, 2, 1);
imshow(bloodImage);
title('Original Image');

subplot(2, 2, 2);
imshow(enhancedImage1);
title('Enhanced (Dark to Light)');

subplot(2, 2, 3);
imshow(binaryImage1);
title('Thresholded (Dark to Light)');

subplot(2, 2, 4);
imshow(binaryImage2);
title('Thresholded (Light to Dark)');
