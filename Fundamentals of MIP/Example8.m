%Load the blood cell image used in Example 10.7 and perform the following distinct block processing operations: 
% (1) Display the average for a block size of 10 by 10. (2) For a 3 by 3 block, perform the differentiator operation used
% in Example 10.7. (3) Apply the vertical boundary detector from Example i0.7 to a 3 by 3 block. Display all the images,
% including the original in a single figure.

clear
clc
[I, map] = imread('38811.tif');
I = double(I); % Convert I to double

% Average of the image
I_avg = blkproc(I, [10 10], 'mean2(x) * ones(10,10)');

% Differentiator place result in all blocks
F = inline('(x(2,2) - sum(x(1:3,1))/3 - sum(x(1:3,3))/3 - x(1,2) - x(3,2)) * ones(size(x))');
I_diff = blkproc(I, [3 3], F);

% Vertical edge detector
F1 = inline('(sum(x(1:3,2)) - sum(x(1:3,1))) * ones(size(x))');
I_vertical = blkproc(I, [3 2], F1);

% Rescale all arrays
I_avg = mat2gray(I_avg);
I_diff = mat2gray(I_diff);
I_vertical = mat2gray(I_vertical);

% Display results
figure
imshow(I_avg);
title('Averaged');

figure
imshow(I_diff);
title('Differentiated');

figure
imshow(I_vertical, [.6 .85]);
title('Vertical boundaries');

figure
bw = im2bw(I_vertical, .65);
imshow(bw);
title('Left boundaries');

figure
bw1 = im2bw(I_vertical, .85);
imshow(~bw1);
title('Right boundaries');
