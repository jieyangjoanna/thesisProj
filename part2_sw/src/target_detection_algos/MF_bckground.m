function [ MF_score ] = MF_bckground(I, idx_bckgrd, t)
% MF PERFORMS TARGET DETECTION, IT IS MATCHED FILTER

%   Input I is input image with pixel_number-by-spectral_number dimension
%   t is the target spectrum with spectral-number-by-1 vector
%   idx_bckgrd are the indicies of background pixels

%   Output MF_score is a pixel-number-by-1 detection score  

I_bckground = I(idx_bckgrd,:);

mu = mean(I_bckground,1)'; %1-by-spectral_no
I_muSub = I - ones(size(I,1),1)*mu'; % size of I, pix_no-by-spectral_no

%S = cov(I);% spectral_no-by-spectral_no
I_bckground_muSub = I_bckground - ones(size(I_bckground,1),1)*mu'; % size of I, pix_no-by-spectral_no
S_bckgrd = cov(I_bckground_muSub);
%I_muSub_inv = I_muSub'; % size is the transpose of I's size

MF_score = zeros(size(I,1),1);
for i = 1:size(I,1)
    MF_score(i) = (t - mu)' / S_bckgrd * I_muSub(i,:)'/((t - mu)' / S_bckgrd * (t - mu));
end

end