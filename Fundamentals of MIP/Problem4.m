%Load frame 20 from the MRI image (mri.tif) from the CD and code it in pseudo- color
% by coding the image into shades of green and the inverse of the image into shades
% of blue. Then take a threshold and plot pixels over 0.8 as red.
clc
clear
% Load the MRI image (mri.tif)
[mri(:,:,:,1),map] = imread('mri.tif',20);

if isempty(map) == 0
    mri = ind2gray(mri,map);
end
frame20 = im2double(mri);
frame20comp = imcomplement(frame20);


% Code the image into shades of green
greenImage = cat(3, zeros(size(frame20)), frame20, zeros(size(frame20)));

% Inverse of the image into shades of blue
blueImage = cat(3, zeros(size(frame20comp)), zeros(size(frame20comp)), frame20comp);


%take a threshold and plot pixels over 0.8 as red.
[M,N] = size(frame20);
RGB = zeros(M,N,3);
for i = 1:M
    for j = 1:N
         frame20(i,j) > .8
        RGB(i,j,1) = (frame20(i,j)-.8)/(1-.8);
        
    end
end

% Combine the green and blue images
combinedImage = greenImage + blueImage ;

% Display the result
figure;
subplot(2,2,3);
imshow(combinedImage);
title('Pseudocolor Image of both 1 and 2');
subplot(2,2,1);
imshow(greenImage);
title('Shade of green');
subplot(2,2,2);
imshow(blueImage);
title('Shade of blue with inverse of img');
subplot(2,2,4);
imshow(RGB);
title('thresholded image with red');

