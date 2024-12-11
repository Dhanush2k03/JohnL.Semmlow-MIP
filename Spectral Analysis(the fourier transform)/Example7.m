%Unaided image registration requiring an affine transformation. The input image, the image to be aligned, is a distorted version of the reference image. Specifically, it has been stretched horizontally, compressed vertically, and tilted using an affine transformation. The optimization routine is called upon to find a transformation that will realign this image with the reference image
clc
clear
H_Scale  = 0.25;
V_Scale  = 0.2;
tilt = 0.2;

% Load the MRI image
[I, map] = imread('mri.tif', 18);

% Convert to grayscale if necessary
if size(I, 3) > 1
    I = rgb2gray(I);
end

[M, N] = size(I);
H_Scale = H_Scale * N / 2; % Convert to pixels
V_Scale = V_Scale * M;
tilt = tilt * N;

% Construct distorted image
U = [1, 1; 1, M; N, M];
X = [1 - H_Scale + tilt, 1 + V_Scale; 1 - H_Scale, M; N + H_Scale, M];
Tform = maketform('affine', U, X);
I_trans = imtransform(I, Tform, 'bicubic', 'Xdata', [1, N], 'Ydata', [1, M]) * 0.8;

% Now find transformation to realign image
init = [1, 1, 1]; % Set initial value
[scale, Fval] = fminsearch(@(scale) realign(scale, I, I_trans), init);
disp(Fval);

% Realign image using optimized transform
X = [1 + scale(1) + scale(3), 1 + scale(2); 1 + scale(1), M; N - scale(1), M];
Tform = maketform('affine', U, X);
I_aligned = imtransform(I_trans, Tform, 'bicubic', 'Xdata', [1, N], 'Ydata', [1, M]);

% Display the original and transformed images side by side
figure;
subplot(1, 3, 1);
imshow(I, []);
title('Refrence image');

subplot(1,3,2);
imshow(I_trans, []);
title('Input image')

subplot(1, 3, 3);
imshow(I_aligned, []);
title('Transformed Image');

function err = realign(scale, I, I_trans)
    [M, N] = size(I);
    U = [1 1; 1 M; N M];
    X = [1 + scale(1) + scale(3), 1 + scale(2); 1 + scale(1), M; N - scale(1), M];
    Tform = maketform('affine', U, X);
    I_aligned = imtransform(I_trans, Tform, 'Xdata', [1 N], 'Ydata', [1 M]);
    % Use a more sophisticated similarity measure or correlation metric
    err = -corr2(I_aligned, I); % Use correlation coefficient as the error measure
end
