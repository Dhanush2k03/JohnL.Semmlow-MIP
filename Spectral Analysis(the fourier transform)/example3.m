%example is the application of ine dimentionalFIR to two dimentions.

clc
clear

% Load the image
I = imread("38811.tif");
I = im2double(I);

% Design an FIR low-pass filter
N = 32;
w_lp = 0.125;
b = fir1(N, w_lp);
h_lp = ftrans2(b);

% Apply the low-pass filter
I_lowpass = imfilter(I, h_lp);

% Design an FIR high-pass filter
w_hp = 0.125;
b = fir1(N, w_hp, 'high');
h_hp = ftrans2(b);

% Apply the high-pass filter
I_highpass = imfilter(I, h_hp);
I_highpass_rep = imfilter(I, h_hp, 'replicate');

% Create a Gaussian filter
b_gauss = fspecial('gaussian', 8, 2);
I_low_gaus = imfilter(I, b_gauss);

% Display the results
figure;
subplot(2, 2, 1);
imshow(I);
title('Original Image');

subplot(2, 2, 2);
imshow(I_lowpass);
title('Low-Pass Filtered Image');

subplot(2, 2, 3);
imshow(I_highpass_rep);
title('High-Pass Filtered Image (Replicate Boundary)');

subplot(2, 2, 4);
imshow(I_low_gaus);
title('Image after Applying Gaussian Filter');
