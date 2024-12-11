%This is an example of linear filtering using two of the filters in fspecial. Load one framef the MRI image set from the CD (mri.tif) and apply the sharpening filter, unsharp,described above. Apply a horizontal Sobel filter, bSobel (also shown above), to detecthorizontal edges. Then apply the Sobel filter to detect the vertical edges and combinethe two edge detectors. Plot both the horizontal and combined edge detectors.
clc
clear
% Load the MRI image
[I(:,:,:,1),map] = imread('mri.tif',16);

% Convert to grayscale
I = ind2gray(I,map);

% Apply the unsharp filter
h_unsharp = fspecial('unsharp', 0.5);
I_unsharp = imfilter(I, h_unsharp);

% Apply the horizontal Sobel filter
I_sobel_h = fspecial('sobel');
I_sobel_h_edges = imfilter(I, I_sobel_h);

% Apply the vertical Sobel filter
I_sobel_v = I_sobel_h';
I_sobel_v_edges = imfilter(I, I_sobel_v);

% Combine the horizontal and vertical edge detectors
I_sobel_comb = I_sobel_h_edges + I_sobel_v_edges;

% Display the results
figure;
subplot(2, 3, 1);
imshow(I);
title('Original MRI Image');

subplot(2, 3, 2);
imshow(I_unsharp);
title('Sharpened Image');

subplot(2, 3, 3);
imshow(I_sobel_h_edges);
title('Horizontal Edges');

subplot(2,3,4);
imshow(I_sobel_v_edges);
title('Vertical Edges');

subplot(2, 3, 5);
imshow(I_sobel_comb);
title('Combined Edges');

% Plot the frequency response of the unsharp filter
F = fftshift(abs(fft2(h_unsharp, 32, 32)));
D = fftshift(abs(fft2(I_sobel_h,32, 32)));
figure;
mesh(1:32, 1:32, F);
title('Frequency Response of Unsharp Filter');
figure;
mesh(1:32, 1:32, D);
title('Frequency Response of Sobel Filter');

