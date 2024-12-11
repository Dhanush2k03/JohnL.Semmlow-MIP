%This example uses a number of the functions described previously. The program first loads a set of MRI 
% (magnetic resonance imaging) images of the brain from the MATLAB Image Processing Toolbox's set of stock images. 
% This image is actually a multiframe image consisting of 27 frames, as can be determined from the command imfinfo. 
% One of these frames is selected by the operator and this image is then manipulated in several ways: the contrast is 
% increased; it is inverted; the center is enhanced by multiplying the image horizontally and vertically by a Hamming window 
% function; it is thresholded and converted to a binary image; and the threshold image is inverted.

clear;
clc
for frame = 1:27
    [mri(:,:,:,frame),map] = imread('mri.tif',frame);
end
montage(mri,map);
mov = immovie(mri,map);
figure;
movie(mov,6);

frame_select = input('Select the frame for processing:');
I  = mri(:,:,:,frame_select);
if isempty(map) == 0
    I = ind2gray(I,map);
end
I1  = im2double(I);
I_bright = immultiply(I1,1.2);
I_Invert = imcomplement(I1);
BW = im2bw(I1,0.75);
BW_invert = ~BW;
[M N] = size(I1);
for i = 1:M
    I_Window(i,:)  = I1(i,:) .* hamming(N)';
end
for i = 1:N
    I_Window(:,i) = I_Window(:,i) .* hamming(M);
end

I_Window = mat2gray(I_Window); %rescale the image
figure;
imshow(I1);
title('orginal');
figure;
imshow(I_bright);
title('Contrast');
figure;
imshow(I_Invert);
title('inverted');
figure;
imshow(I_Window);
title('Windowed');
figure;
imshow(BW);
title('Threshold');
figure;
imshow(BW_invert);
title('inverted threshold');





