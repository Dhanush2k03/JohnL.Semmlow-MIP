%An example of interactive image registration. In this example, an input image is gener- ated by transforming the reference image with a projective transformation including vertical and horizontal translations. The program then opens two windows display- ing the reference and input images and takes in four reference points for each image from the operator using the MATLAB ginput routine. As each point is taken it, it is displayed as an x overlaid on the image. Once all eight points have been acquired (four from each image), a transformation is constructed using cp2t.form. This transforma- tion is then applied to the input image using imtransform. The reference, input, and realigned images are displayed.
clc
clear
nun_points = 4;
[I(:,:,:,1),map] = imread('mri.tif',18);
I_ref = ind2gray(I,map);

[M N] = size(I);

%construct transforme input image
U = [1 1; 1 M; N M; N 1];
offset = .15*N;
H = .2*N;
V  = .15*M;
X = [1-offset+H 1+offset-V; 1+offset+H M-offset-V; N-offset+H M-offset-V; N+offset+H 1+offset-V];
Tform1 = maketform('projective',U,X);
I_input = imtransform(I_ref,Tform1,'Xdata',[1 N],'Ydata',[1 M]);

%Acquire reference points.Display both images
fig(1) = figure;
imshow(I_ref);
fig(2)= figure;
imshow(I_input);


for i =1:2
    figure(fig(i));
    hold on;
    title('Enter four refrence points');
    for j = 1:nun_points
        [x(j,i),y(j,i)] = ginput(1);
        plot(x(j,i),y(j,i),'X');
    end
end

%construct transformation structure with cp2form and implement with
%imtransform

[Tform2,inputes,base_pts] = cp2tform([x(:,2) y(:,2)],[x(:,1) y(:,1)],'projective');
I_aligned = imtransform(I_input,Tform2,'Xdata',[1 M],'Ydata',[1 N]);
figure;
imshow(I_aligned,[]);
title('Resultant Transformation');