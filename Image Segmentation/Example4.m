%Isolate segments from a texture pattern that includes three patterns two of which have the same textural statistical properties except for orientation. Also plot histograms of the original image and the image after application of the nonlinear filter
clc
clear
I = imread("image.png");
I  = im2gray(I);
I = im2double(I);

range  = inline('max(x) -min(x)');
b_lp = fspecial('gaussian',20,4);

I_nl = nlfilter(I,[9 1],range);
I_h = imfilter(I_nl*2,b_lp);
figure;
% Display the original image
subplot(2,2,1);
imshow(I);
title('Original Image');

% Display the histogram of the original image
subplot(2,2,2);
imhist(I);
title('Histogram of Original Image');

% Display the filtered image
subplot(2,2,3);
imshow(I_h);
title('Filtered Image');

% Display the histogram of the filtered image
subplot(2,2,4);
imhist(I_h);
title('Histogram of Filtered Image');

% Create a new figure for visualization
figure;

% Thresholding using Otsu's method
Bw1 = im2bw(I_h,.08);
Bw2 = ~im2bw(I_h,.29);
Nw3 = ~(Bw1 & Bw2);

% Display the thresholded images(threshold to isolate segments find third
% image)
subplot(1,3,1);
imshow(Bw1);
title('Thresholded Filtered Image .08');

subplot(1,3,2);
imshow(Bw2);
title('Thresholded Filtered Image .29');

subplot(1,3,3);
imshow(Nw3);
title('threshold final segment')
