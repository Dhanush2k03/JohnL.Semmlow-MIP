%Find the strongest line in the image of Saturn in saturn1.tif. Plot that line superim- posed on the image
clc;
clear;

theta = 0:.5:179;
radians = 2*pi/360;
I = imread('saturn.png');
I_gray = rgb2gray(I); % Convert to grayscale
BW = edge(I_gray, 'canny', 0.05);

[R, xp] = radon(BW, theta);

figure;
subplot(1, 2, 1);
imshow(I);
title('Original Image');

subplot(1, 2, 2);
imshow(BW);
title('Canny Edges');

[M, c] = max(max(R));
[M, r] = max(R(:, c));
[ri, ci] = size(I);
[ra, ca] = size(R);

% Convert to rectangular coordinates
A = xp(r);
phi = theta(c);
m = tan((phi - 90) * radians);
b = A / cos((phi - 90) * radians);

x = (0:ci);
y = m * x + b;

figure;
imshow(I);
hold on;
plot(x, -y, 'y', 'LineWidth', 2);
title('Radon Transform Line');

figure;
imshow(BW);
hold on;
plot(phi, A, '*b');
title('Peak Point in Radon Transform');
   
