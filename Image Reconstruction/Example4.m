%Use correlation to identify potentially active areas from MRI images of the brain. In this experiment, 24 frames were taken (typical fMRI experiments would contain at least twice that number): the first 6 frames were acquired during baseline activity and the next 6 during the task. This off-on cycle was then repeated for the next 12 frames.
clc
clear
% Example 13.4 and Figures 13.14 and 13.15 
% Example of identification of active area 
% using correlation. 

thresh = .5;%Correlation threshold
load fmril;%Get data
[il,ji,dum,kl] = size(I_fmri);
%
i_stim2 ones (k1,1);%Construct task profile
i stim2(1:6) = 0;%Frames 1-6 and 13-18 are
i stim2(13:18) = 0;%no task (set to 0)
%
%Do correlation: pixel by pixel over the 24 frames
I_fmri_marked = I_fmri;%Copy original image
active = [0 0];%Indicates active areas
correl = 0;%Correlation vector
for i = i:i1
  for j = 1:j1
    for k = 1:k1
       temp(k) = I_fmri(i,j,1,k);
    end
    corr = corrcoef([temp' istim2]);
    if corr(i,j) > thresh
        I_fmri_marked(i,j,:,1) = I_fmri(i,j,:,1) + corr (2,1);

        active = [active;i,j]; %Save locations
        correl = [correl; corr(2,1)]; %save correl
    end
 end
end

%Display marked image and title...

% Plot one of the active areas

for i = 1:24 %Plot one of the active areas (#5) 
    active_neuron(i) = I_fmri(active (5,1), active (5,2),:, i);

end

%Plot active area time plot.



