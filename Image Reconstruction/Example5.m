%Determine the task function used in correlation using PCA and ICA. Select an ROI from the data of Figure 13.15, specifically an area that surrounds and includes the poten- tially active pixels. Normally, this area would be selected interactively by an operator, but here the region is on a data file, roi2.mat. Reformat the images so that each frame is a single-row vector and constitutes one row of an ensemble composed of the different
clc
clear
%example of the use of PCA and ICA to identify signal and artifact
%components in a region of intrest containing active neurons
nu_comp = 2;%number of idependent components
load roi2;%get the roi data 
[r,c,dummy,frames] = size(ROI);
%
%convert each image frame to a column and construct an ensemble were eah column is a different frame 
%
for i = 1:frames
    for  j = 1:r;
        row = ROI(j,:,:,i); %put pixelsin row
        if j == 1
            temp = row;
        else
            temp  =[temp row];
        end
    end
    if i == 1
        data = temp;
    else 
        data = [data;temp];
    end
end
%
%now apply PCA analysis
[U,S,pc] = scd(data',0);
eigen = diag(S).^2;   %get eigenvalues
for i = 1:length(eigen)
    pc(:,i)  = pc(:,i) * sqrt(eigen(i));
end
%
%Determine the independent components 
w  = jade(data',nu_comp);
ica = (w * data');
%
% plot the components 





