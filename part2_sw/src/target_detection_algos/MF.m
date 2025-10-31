function [ MF_score ] = MF(I,t)
% MF PERFORMS TARGET DETECTION, IT IS MATCHED FILTER

%   Input I is input image with pixel_number-by-spectral_number dimension
%   t is the target spectrum with spectral-number-by-1 vector

%   Output MF_score is a pixel-number-by-1 detection score  

mu = mean(I,1)'; %1-by-spectral_no
%S = cov(I);% spectral_no-by-spectral_no

I_muSub = I - ones(size(I,1),1)*mu'; % size of I, pix_no-by-spectral_no
S = cov(I_muSub);
%I_muSub_inv = I_muSub'; % size is the transpose of I's size
MF_score = zeros(size(I,1),1);
for i = 1:size(I,1)
    MF_score(i) = (t - mu)' / S * I_muSub(i,:)'/((t - mu)' / S * (t - mu));
end

end

