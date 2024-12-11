%Load the image of blood cells in blood.tiff in MATLAB's image files. Convert the image to intensity class and double format.
% Perform the following sliding neighborhood operations: averaging over a 5 by 5 sliding block; differencing 
% (spatial differentiation)using the function, F, above; and vertical boundary detection using a 2 by 3 vertical difference 
% operator. This difference operator subtracts a vertical set of three left-hand pixels from the three adjacent right-hand 
% pixels. The result will be a brightening of vertical boundaries that go from dark to light and a darkening of vertical 
% boundaries that go from light to dark. Display all the images in the same figure, including the original.Also include binary
% images of the vertical boundary image thresholded at two different levels to emphasize the left and right boundaries.
clear 
clc
[I map] = imread('38811.tif');
%Averaging
I_avg = nlfilter(I,[5 5], 'mean2');
%Differencing 
F  = inline('x(2,2) - sum(x(1:3,1))/3 - sum(x(1:3,3))/3 - x(1,2) - x(3,2)');
I_diff = nlfilter(I, [3 3],F);

%vertical boundaries detection
F1  =inline ('sum(x(1:3,2)) - sum(x(1:3,1))');
I_vertical = nlfilter(I,[3 2], F1);

%Rescale all arrays
I_avg = mat2gray(I_avg);
I_diff = mat2gray(I_diff);
I_vertical = mat2gray(I_vertical);

figure
imshow(I);
title('orginal image');

figure
imshow(I_avg);
title('averaged');

figure
imshow(I_diff);
title('differenciated')

 figure
 imshow(I_vertical,[.65 .85]);
 title('Vertical boundaries');

 figure
 bw = im2bw(I_vertical,.65);
 imshow(bw);
 title('Left boundaries');

 figure
 bw1 = im2bw(I_vertical,.65);
 imshow(~bw1);
 title('right boundaries');


