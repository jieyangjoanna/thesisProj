function [CEM_score] = CEM_bckground(I, idx_bckgrd, t)
%CEM is Constrained Energy Minimization

%   Input I is input image with pixel_number-by-spectral_number dimension
%   t is the target spectrum with spectral-number-by-1 vector
%   idx_bckgrd are the indicies of background pixels

%   Output CEM_score is a pixel-number-by-1 detection score  

I_bckground = I(idx_bckgrd,:);

% mu = mean(I_bckground,1)'; %spectral_no-by-1

% I_muSub = I - ones(size(I,1),1)*mu'; % size of I

% I_bckground_muSub = I_bckground - ones(size(I_bckground,1),1)*mu'; % size of I, pix_no-by-spectral_no
% S_bckgrd = cov(I_bckground_muSub);% spectral_no-by-spectral_no

S_bckgrd = cov(I_bckground);% spectral_no-by-spectral_no

CEM_score = zeros(size(I,1),1);
for i = 1:size(I,1)
    % according to John Schott's book
    %numerator = (t - mu)' / S_bckgrd * I_muSub(i,:)';
    %denominator = ((t - mu)' / S_bckgrd * (t - mu));

     % according to Manakolis
    numerator = t' / S_bckgrd * I(i,:)';
    denominator = (t' / S_bckgrd * t);
    
    CEM_score(i)= numerator/denominator;
end


end
