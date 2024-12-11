% isolate the cell structure from the image of two cells
clc
clear 
I  = imread("cell.tif");
I  = im2double(I);

b = fspecial('gaussian',20,2);
I_std = (nlfilter(I,[3 3],'std2'))*10;
figure;
subplot(1,2,1);imshow(I);title('orginal image');
subplot(1,2,2);imshow(I_std);title('filtred image');

figure;
Bw_th = im2bw(I,.5);
Bw_thc = ~im2bw(I,.42);
Bw_std = im2bw(I_std,.2);
Bw1 = Bw_th | Bw_thc; %combine two images
Bw2 = Bw_std | Bw_th | Bw_thc;
 subplot(2,2,1); imshow(Bw_th);title('Threshold 0.5');
 subplot(2,2,2); imshow(Bw_thc);title('Threshold 0.42');
 subplot(2,2,3); imshow(Bw1);title('0.5 or 0.42');
 subplot(2,2,4); imshow(Bw2);title('0.42 or 0.5 or std');
