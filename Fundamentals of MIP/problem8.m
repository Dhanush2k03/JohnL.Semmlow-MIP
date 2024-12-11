%Load the blood cells in blood1.tif. Apply a distinct block function that replaces
% all of the values within a block by the maximum value in that block.
% Use a 4 by 4 block size. Repeat the operation using a function that 
% replaces all the val- ues by the minimum value in the block. 
% (This is one of those problems for illus- trative purposes only. 
% Admittedly, the value of the transformed images is not obvious.)

% Load the blood cell image
bloodImage = imread('38811.tif');

% Define the block size
blockSize = [4, 4];

% Apply block processing to replace values with maximum and minimum
maxImage = blockproc(bloodImage, blockSize, @(block) max(block.data(:)));
minImage = blockproc(bloodImage, blockSize, @(block) min(block.data(:)));

% Display the results
figure;
subplot(1, 3, 1);
imshow(bloodImage);
title('Original Image');

subplot(1, 3, 2);
imshow(maxImage, []);
title('Max Value in Blocks');

subplot(1, 3, 3);
imshow(minImage, []);
title('Min Value in Blocks');
