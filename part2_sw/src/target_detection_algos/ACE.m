function ACE_score = ACE(I,t)
%ACE is Adaptive Coherence Estimator

%   Input I is input image with pixel_number-by-spectral_number dimension
%   t is the target spectrum with spectral-number-by-1 vector

%   Output ACE_score is a pixel-number-by-1 detection score  

mu = mean(I,1)'; %spectral_no-by-1
S = cov(I);% spectral_no-by-spectral_no
I_muSub = I - ones(size(I,1),1)*mu'; % size of I
%I_muSub_inv = I_muSub'; % size is the transpose of I's size
ACE_score = zeros(size(I,1),1);
for i = 1:size(I,1)
    numerator = ((t - mu)' / S * I_muSub(i,:)')^2;
    % according to John Schott's book
    %denominator = ((t - mu)' / S * I_muSub(i,:)') * (size(I,1) * (I_muSub(i,:) /S *I_muSub(i,:)'));

    % according to Manakolis
    denominator = ((t - mu)' / S * (t - mu)) * ((I_muSub(i,:) /S *I_muSub(i,:)'));
    
    ACE_score(i)= numerator/denominator;
end


end

