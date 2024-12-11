%Remake the movie in Example 10.3, but make the bars move from top to bottom.
% Also make the movie more colorful by using a different colormap, such as spring,
% in the second argument to immovie.m. Submit one frame from the movie

clear
clc
N  = 100;
Nu_Cycle = 2;
x = (1:N) * Nu_Cycle / N;
M = 100;
MFW = zeros(N, N, 1, M, 'uint8'); % Preallocate MFW with the correct type

for j = 1:M
    phase = 2 * pi * (j - 1) / M;
    I_sin = .5 * sin(2 * pi * x + phase) + .5;
    I_8 = im2uint8(I_sin);
    for i = 1:N
        if i >= 10 && i <= 90
            MFW(:, i, 1, j) = I_8;
        end
    end
end

[MFW, map] = gray2ind(MFW);
figure;
mov = immovie(MFW, spring(100));
movie(mov, 6); % Play the movie 6 times

% Select and display one frame from the movie
frame_index = 50; % Choose a frame index (1 to M)
one_frame = MFW(:, :, :, frame_index); % Extract one frame
imshow(one_frame, map); % Display the frame
title(['Frame ', num2str(frame_index)]); % Add a title with frame index