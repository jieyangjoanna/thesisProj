function [MF_local_score] = MF_local_arbitrayShape(I,ROI_RF, kernelSize, t)
%MF_local uses spectral matched filter to perform target detection locally

%   Input I is input image with pixel_number-by-spectral_number dimension
%   t is the target spectrum with spectral-number-by-1 vector
%   kernelSize: the kernal image dimension is kernalSize - by - kernalSize,
%   Swain (1978) points out that spectral_number +1 samples are a
%   theoretical min, but 10*spectral_number is closer to a practical min,
%   and 100*spectral_number is a desirable objective.

%   Output MF_local_score is a pixel-number-by-1 detection score  

mu = mean(I,1)'; %1-by-spectral_no
S = cov(I);% spectral_no-by-spectral_no
I_muSub = I - ones(size(I,1),1)*mu'; % size of I, pix_no-by-spectral_no
%I_muSub_inv = I_muSub'; % size is the transpose of I's size
MF_score = zeros(size(I,1),1);
for i = 1:size(I,1)
    MF_score(i) = (t - mu)' / S * I_muSub(i,:)';
end
end

