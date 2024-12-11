%Load the image of blood cells (blood1.tif) and apply imfill to darken the center of the cells. Then apply thresholding to produce a mask of the cells followed by opening to remove any artifacts. Use the mask to isolate a grayscale image of the blood cells against a black background
clc
clear
I  = imread('N4oPG.png');
I  = im2double(I);
I1  = imcomplement(I);

I2 = imfill(I1,'holes');
%threshold and ipean the filled image
BW  = im2bw(I2,.5);
SE  = strel('disk',5);
BW1  = imopen(BW,SE);

figure;
subplot(1,2,1);imshow(I);title('Orginal image');
subplot(1,2,2);imshow(BW1);title('Filled image');
