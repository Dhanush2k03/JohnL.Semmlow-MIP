%Example of the use of back-projection and filtered back-projection. Generate a simple image of a white square against a black background. Construct the CT projections using the forward Radon transform. The original image will be reconstructed from these projections using both the filtered and unfiltered back-projection algorithm. A special routine, i_back, will be used to get the unfiltered back-projection. The routine has the same calling structure as iradon but uses no filter. The original image, the projections, and the two reconstructed images are displayed in Figure 13.4.
clc
clear

% Create a binary image (phantom)
%I = zeros(128, 128);
%I(44:84, 44:84) = 1;
[I(:,:,:,1),map] = imread('mri.tif',18);
I = ind2gray(I,map);
% Generate the projections using 'radon'
delta_theta = (0:179); % Projection angles
[p, xp] = radon(I, delta_theta); % Projections
I_proj = mat2gray(p);

% Reconstruct the image using filtered backprojection
I_back = iradon(p, delta_theta,'linear','None'); % No filter
I_back = mat2gray(I_back);

I_filtred_back = iradon(p,delta_theta);%filtred


% Display the reconstructed image
figure;
subplot(2, 2, 1);
imshow(I, []);
title('Original Phantom Image');

% Display the original phantom image
subplot(2, 2, 2);
imshow(I_back, []);
title('smeared image');

%Display the projection path

subplot(2, 2, 3);
imshow(I_proj, []);
title('Projection path');

% Display the reconstructed image

subplot(2, 2, 4);
imshow(I_filtred_back, []);
title('Filtered Backprojection');




