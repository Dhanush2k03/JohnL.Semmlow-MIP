%Construct a multiframe variable with 12 sinewave grating images as in Example 10.2,but display these images as a movie.
% Because the immovie function requires the multiframe image variable to be in either RGB or indexed format, convert the uint8 
% data to indexed format. This can be done by the gray2ind function, and the default range of 64 should be adequate. MATLAB 
% colormaps can also be specified to be of any depth, but as with gray2ind, the default level is 64.

clear
clc
N  = 100;
Nu_Cycle = 4;
x = (1:N) * Nu_Cycle / N;
M = 100;
MFW = zeros(N, N, 1, M, 'uint8'); % Preallocate MFW with the correct type

for j = 1:M
    phase = 2 * pi * (j - 1) / M;
    I_sin = .5 * sin(2 * pi * x + phase) + .5;
    I_8 = im2uint8(I_sin);
    for i = 1:N
        if i >= 10 && i <= 90
            MFW(i, :, 1, j) = I_8;
        end
    end
end

[MFW, map] = gray2ind(MFW);
mov = immovie(MFW, map);
movie(mov, 6); % Play the movie 6 times
