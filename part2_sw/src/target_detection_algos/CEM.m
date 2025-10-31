function [CEM_score] = CEM(I, t)
%CEM is Constrained Energy Minimization

%   Input I is input image with pixel_number-by-spectral_number dimension
%   t is the target spectrum with spectral-number-by-1 vector

%   Output CEM_score is a pixel-number-by-1 detection score  

% mu = mean(I,1)'; %spectral_no-by-1
S = cov(I);% spectral_no-by-spectral_no
% I_muSub = I - ones(size(I,1),1)*mu'; % size of I
%I_muSub_inv = I_muSub'; % size is the transpose of I's size
CEM_score = zeros(size(I,1),1);
for i = 1:size(I,1)
    % according to John Schott's book
    %numerator = (t - mu)' / S * I_muSub(i,:)';
    %denominator = ((t - mu)' / S * (t - mu));
    
    % according to Manakolis
    numerator = t' / S * I(i,:)';
    denominator = (t' / S * t);
    
    CEM_score(i)= numerator/denominator;
end


end

