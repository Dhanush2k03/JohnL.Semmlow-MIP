% another method for segmentation .
%https://de.mathworks.com/help/images/texture-segmentation-using-texture-filters.html
%refrence from the following link.
clc
clear
I = imread('bag.png');
imshow(I)
title('Original Image');
E = entropyfilt(I);
S = stdfilt(I,ones(9));
R = rangefilt(I,ones(9));
Eim = rescale(E);
Sim = rescale(S);
figure;
montage({Eim,Sim,R},'Size',[1 3],'BackgroundColor','w',"BorderSize",20)
title('Texture Images Showing Local Entropy, Local Standard Deviation, and Local Range')
figure;
BW1 = imbinarize(Eim,0.8);
imshow(BW1)
figure;
title('Thresholded Texture Image')
figure;
BWao = bwareaopen(BW1,2000);
imshow(BWao)
title('Area-Opened Texture Image')
figure;
nhood = ones(9);
closeBWao = imclose(BWao,nhood);
imshow(closeBWao)
title('Closed Texture Image')
figure;
mask = imfill(closeBWao,'holes');
imshow(mask);
title('Mask of Bottom Texture')
textureTop = I;
textureTop(mask) = 0;
textureBottom = I;
textureBottom(~mask) = 0;
figure;
montage({textureTop,textureBottom},'Size',[1 2],'BackgroundColor','w',"BorderSize",20)
title('Segmented Top Texture (Left) and Segmented Bottom Texture (Right)')
figure;
L = mask+1;
imshow(labeloverlay(I,L))
title('Labeled Segmentation Regions')
figure;
boundary = bwperim(mask);
imshow(labeloverlay(I,boundary,"Colormap",[0 1 1]))
title('Boundary Between Textures')

