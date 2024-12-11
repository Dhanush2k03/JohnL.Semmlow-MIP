%The inverse Radon transform. Generate CT data by applying the Radon transform to an MRI image of the brain (an unusual example of mixed modalities!). Reconstruct the image using the inverse Radon transform with the cosine filter with and without the filter's frequency spectrum reduced by 0.5. Display the original and reconstructed images.
clc
clear
[I(:,:,:,1),map] = imread('mri.tif',18);
I = ind2gray(I,map);
%construct projectio of mr image 
delta_theta = (1:180);
[p,xp] = radon(I,delta_theta);
I_proj = mat2gray(p);
figure;
subplot(2,2,1);
imshow(I_proj);
title('projection profile');
%Reconstruct the image
A = iradon(p,delta_theta,'Cosine');
I_RECON = mat2gray(A);
A2 = iradon(p,delta_theta,'Cosine',.5);
I_RECON1 = mat2gray(A2);

subplot(2,2,2);
imshow(I_RECON);
title('reconstructed image');
subplot(2,2,3);
imshow(I_RECON1);
title('reconstructed image2');
subplot(2,2,4);
imshow(I);
title('orginal image');