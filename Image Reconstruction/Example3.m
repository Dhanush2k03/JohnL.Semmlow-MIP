%Fan beam geometry. Apply the fan beam and parallel beam Radon transform to the group of four squares of varying grayscale levels. Reconstruct the image using the inverse Radon transform for both geometries.
clc
clear

% Specify constants
D = 150; % Beam vertex to center of rotation
theta = (0:179); % Parallel projection angles

% Create the phantom image
I = zeros(128, 128);
I(22:52, 22:52) = 1; % Object 1
I(76:106, 22:52) = 2; % Object 2
I(22:52, 76:106) = 3; % Object 3
I(76:106, 76:106) = 4; % Object 4

% Convert the phantom image to a binary mask
mask = I > 0;

% Construct parallel and fan beam projections using the mask
F = fanbeam(mask, D);
[R, xp] = radon(mask, theta);
R = mat2gray(R);

% Reconstruct the fan beam image using filtered backprojection
I_rfb = ifanbeam(F, D, 'Filter', 'Shepp-Logan');
%parallel fan beam projection


% Display the reconstructed images
figure;
subplot(2, 2, 3);
imshow(I_rfb, []);
title('Filtered Backprojection (Shepp-Logan)');

subplot(2, 2, 2);
imshow(R);
title('Radon Transform');

subplot(2, 2, 1);
imshow(I, []);
title('Original Phantom Image');

