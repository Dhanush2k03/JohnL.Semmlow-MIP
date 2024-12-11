%Apply an opening operation to remove the dark patches seen in the thresholded cell image of Figure 12.17. Also remove both the black and white specks from the texture- segmented image of Figure 12.12 (right side).
clc
clear
SE = strel('square',5);
load Example5.m;
BW1 = ~imopen(~Bw2,SE)
figure;
 imshow(BW1); 
figure; BW1 Bw2 Bw3;
load Example2.m;
BW = ~imopen(~BW3,SE);
BWA = imopen(BW,SE);
 imshow(BWA);


