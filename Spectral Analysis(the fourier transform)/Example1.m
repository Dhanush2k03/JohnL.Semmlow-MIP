%Determine and display the two-dimensional Fourier transform of a thin, rectangular object. The object should be 2 by 10 pixels in size and solid white against a black back- ground. Display the Fourier transform as both a function (i.e., as a mesh plot) and as an image plot
clc
clear
%construct the rectangular object
f  = zeros(22,30);
f(10:12,10:20)= 1;
F = fft2(f,128,128);
F = abs(fftshift(F));
imshow(f,'InitialMagnification','fit');
figure;
mesh(F);
figure;
F = 20*log(F);
I = mat2gray(F);
imshow(I);

