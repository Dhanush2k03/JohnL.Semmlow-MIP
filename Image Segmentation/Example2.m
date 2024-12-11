%Separate the three segments in Figure 12.9 that differ only in texture. Use one of the texture operators described above, and demonstrate the improvement in separability through histogram plots. Determine appropriate threshold levels for the three segments from the histogram plot.
clc
clear
I = imread('image.png');
I = im2gray(I);
imshow(I);
range  =  inline('max(max(x)) - min(min(x))');
I_f = nlfilter(I,[7 7],range);
I_f = mat2gray(I_f);

subplot(1,3,1);imshow(im2bw(I_f,.21));
subplot(1,3,2);imshow(~islice(I_f,.21,.55));
subplot(1,3,3);imshow(~im2bw(I_f,.55));
