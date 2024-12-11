%image registration. Image registration is the primary biomedical application of these trans- formations, and they are revisited in the following section. Example 11.5 illustrates the use of these general image transformations for affine and projective transformations.

clc
clear

% Load the MRI image
I = imread('mri.tif', 18);
I = ind2gray(I, colormap(gray));

[M, N] = size(I);

% Define affine transformation vectors
U1 = [N/2, 1; 1, M; N, M];
X1 = [1, 1; 1, M; N, M];

% Generate an affine transform based on U1 and X1
Tforlm1 = maketform('affine', U1, X1);
I_affine = imtransform(I, Tforlm1, 'size', [M, N]);

% Define projective transformation vectors
offset = 0.25 * N;
U = [1, 1; 1, M; N, M; N, 1];
X = [1-offset, 1+offset; 1+offset, M-offset; N-offset, M-offset; N+offset, 1+offset];

% Generate a projective transform based on U and X
Tforlm2 = maketform('projective', U, X);
I_proj1 = imtransform(I, Tforlm2, 'Xdata', [1, N], 'Ydata', [M, N]);

% Define a new output quadrilateral for the second projective transformation
X = [1+offset, 1+offset; 1-offset, M-offset; N+offset, M-offset; N-offset, 1+offset];
Tform3 = maketform('projective', U, X);

% Transform the image
I_proj2 = imtransform(I, Tform3, 'Xdata', [1, N], 'Ydata', [1, M]);

% Display the images
figure;
subplot(2, 2, 1);
imshow(I);
title('Original Image');

subplot(2, 2, 2);
imshow(I_affine);
title('Affine-Transformed Image');

subplot(2, 2, 3);
imshow(I_proj1);
title('Projective-Transformed Image 1');

subplot(2, 2, 4);
imshow(I_proj2);
title('Projective-Transformed Image 2');



