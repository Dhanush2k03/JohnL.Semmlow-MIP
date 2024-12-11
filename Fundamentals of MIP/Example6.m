%Apply a pseudocolor scheme to frame 16 of the MRI images, where grayscale values between 0.66 and 1 are coded in shades
% of yellow, values between 0.33 and 0.66 are coded into red, and values below 0.33 are coded to green. 
% Each grayscale range should be expanded to cover the full range of color intensity. Convert the black background to blue.
%
%Solution
%The grayscale image is first put in double format so that the maximum range is 0 to 1.Then each pixel is tested to 
% determine the range: greater than 0.66, less than 0.33, or between 0.33 and 0.66. Pixel values are placed into the 
% respective color planes (the yellow range is placed into both the green and red planes) after being scaled so they cover
% the full range of 0 to 1. Pixel values equal to black (0) are converted to blue (the associated pixel in the blue plane is
% set to 1). The image is displayed in the usual way.
clc
clear
[mri(:,:,:,1),map] = imread('mri.tif',16);
if isempty(map) == 0
    I = ind2gray(mri,map);
end
I2 = im2double(I);

[M,N] = size(I2);
rgb  = zeros(M,N,3);
for i = 1:M
    for j = 1:N
        if I2(i,j) > .75
            rgb(i,j,2) = (I2(i,j)-.75)/.25;
            rgb(i,j,1) = (I2(i,j)-.75)/.25;
        elseif I2(i,j) > .33
            rgb(i,j,1) = (I2(i,j)-.33)/(.75-.33);
        elseif I2(i,j) == 0
            rgb(i,j,3) = 1;
        else
            rgb(i,j,2) = I2(i,j)/.33;
        end
    end
end

%
imshow(rgb);
