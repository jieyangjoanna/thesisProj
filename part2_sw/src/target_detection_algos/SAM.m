function [SAM_score] = SAM(I,t)
%SAM is Spectral Angle Mapper, which calculates spectral angle between
%pixel in detect and the target spectrum t.
%   input image I dimension is: pix_no-by-spectral_no
%   input target spectrum t dimension: column vector, vector length is
%   spectral_no, spectral_no-by-1

% the input image does not need to be whiten-ed: subtract mean
[pix_no, spectral_no]=size(I);
SAM_score = zeros(pix_no,1);

for i = 1: pix_no
    SAM_score(i)=dot(I(i,:), t)/(norm(I(i,:))*norm(t));
end
    
    
end

