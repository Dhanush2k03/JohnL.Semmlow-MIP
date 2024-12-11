%Load MRI image frame number 16. Slice this image into five levels, and plot the levels as
%black, blue, red, yellow, and white.
%
%Solution
%The image can be loaded as in Example 10.4 and sliced into five levels using grayslice;however, to get the desired colors, 
% it is necessary to design our own colormap. For this colormap, we need the colors black (0 0 0), blue (00 1),red (1 0 0), 
% yellow (1 1 0), and white(1 11). This is easily achieved by defining a
% colormap as map[0 0 0 ; 0 0 1 ; 1 1 0 ; 1 1 1];

clear 
clc
[mri(:,:,:,1),map] = imread('mri.tif',16);
if isempty(map) == 0
    I = ind2gray(mri,map);
end

I2 = im2double(I);
x_slice = grayslice(I2,5);
mapP = [0 0 0; 0 0 1;1 0 0; 1 1 0; 1 1 1];

subplot(1,2,1);
imshow(I2);
title('orginal image');

subplot(1,2,2);
imshow(x_slice,mapP);
title('sliced');
