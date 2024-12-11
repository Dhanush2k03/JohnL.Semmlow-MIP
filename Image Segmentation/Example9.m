%Load the blood cell image and detect the cell boundaries using the three derivative based filters, sobel, prewitt, and roberts. Also compare the two zero crossing filters log and canny. Select the threshold empirically to be the highest possible and still provide solid boundaries.
clc;
clear;

% Load the image
I = imread('N4oPG.png');

% Convert the image to grayscale
I_gray = rgb2gray(I);
I_gray = im2double(I_gray);

figure;
% Perform edge detection on the grayscale image
[BW1,thresh1] = edge(I_gray,'sobel',0.13,'nothinning');
[BW2,thresh2] = edge(I_gray,'roberts',0.11,'nothinning');
[BW5,thresh5] = edge(I_gray,'prewitt',0.14,'nothinning');
[BW3,thresh3] = edge(I_gray,'log',0.004);
[BW4,thresh4] = edge(I_gray,'canny',[0.04 0.08]);

% Display the original image
subplot(2,3,1);
imshow(I);
title('Original Image');

% Display Sobel edges
subplot(2,3,2);
imshow(BW1);
title('Sobel Edges');

% Display Roberts edges
subplot(2,3,3);
imshow(BW2);
title('Roberts Edges');

% Display Prewitt edges
subplot(2,3,4);
imshow(BW5);
title('Prewitt Edges');

% Display LoG edges
subplot(2,3,5);
imshow(BW3);
title('LoG Edges');

% Display Canny edges
subplot(2,3,6);
imshow(BW4);
title('Canny Edges');


