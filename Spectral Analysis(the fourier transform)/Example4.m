%Demonstrate resizing and rotation spatial transformations. Load the image of stained tissue from the CD (hestain.png) and transform it so that the horizontal dimension is 25% longer than in the original, while keeping the vertical dimension unchanged. Rotate the original image 45 degrees clockwise, with and without cropping. Display the original and transformed images in a single figure.
clc
clear

% Load the image
I = imread("hestain.png");
I = im2double(I);

% Stretch the image horizontally by 25%
[M N] = size(I);
I_stretch = imresize(I, [M, N * 1.25], 'bilinear');

% Rotate the original image by 45 degrees clockwise
I_rotate = imrotate(I, -45, 'bilinear');

% Rotate and crop the image by 45 degrees
I_rotate_crop = imrotate(I, -45, 'bilinear', 'crop');

% Display the images
figure;
subplot(2, 2, 1);
imshow(I);
title('Original Image');

subplot(2, 2, 2);
imshow(I_stretch);
title('Horizontally Stretched Image');

subplot(2, 2, 3);
imshow(I_rotate);
title('Rotated Image');

subplot(2, 2, 4);
imshow(I_rotate_crop);
title('Rotated and Cropped Image');
