%Apply opening and closing to an inverted version of the thresholded blood cell images of Figure 12.3 in an effort to remove small background artifacts and to fill holes. Use a circular structure with a diameter of four pixels.
clc
clear
I = imread('N4oPG.png');
I = im2double(I);
BW  = ~im2bw(I,graythresh(I));

SE = strel('disk',4);
BW1 = imerode(BW,SE);
BW2 = imdilate(BW1,SE);

figure;
subplot(1,3,1);imshow(I);title('orginal image');
subplot(1,3,2);imshow(BW1);title('eroded image');
subplot(1,3,3);imshow(BW2);title('dialated image');

BW3 = imdilate(BW,SE);
BW4 = imerode(BW3,SE);

figure;
subplot(1,2,2);imshow(BW4);title('closing operation');

