function [MF_score] = MF_local_arbitraryShape(I,ROI, kernelSize,t)
%MF_local_arbitratyShape is the matched filter target detection algorithm applied on 
%  an arbitrary shape, since the ROI is usally cut from a base image and has arbitrary shape.
%  it uses spectral matched filter to perform target detection locally.

%   Input I and ROI_RF must be the same shape. 
%   I is the input MSI image
%   ROI_RF is the region of interest binary image, the same size as the MSI
%   image

%   Input I is input image with pixel_number-by-spectral_number dimension
%   t is the target spectrum with spectral-number-by-1 vector
%   kernelSize: the kernal image dimension is kernalSize - by - kernalSize,
%   Swain (1978) points out that spectral_number +1 samples are a
%   theoretical min, but 10*spectral_number is closer to a practical min,
%   and 100*spectral_number is a desirable objective.

%   Output MF_local_score is a pixel-number-by-1 detection score  

%% find pixels of interest on this substrate
idx = find(ROI>0);
%% image size
[m,n,k]=size(I);
%% initialize
ROI_pad = zeros(m+ 2 * floor(kernelSize/2), n+ 2* floor(kernelSize/2));
I_pad = zeros(m+ 2 * floor(kernelSize/2), n+ 2* floor(kernelSize/2));

%% 0 padding
ROI_pad(:,:) = padarray(ROI(:,:), [floor(kernelSize/2) floor(kernelSize/2)], 0, 'both');
for i =1:k
I_pad(:,:,i) = padarray(I(:,:,i), [floor(kernelSize/2) floor(kernelSize/2)], 0, 'both');
end
%%
MF_local_score = zeros(m,n);
MF_score = zeros(size(I(idx),1),1);
tic 
I_kernel = zeros(kernelSize, kernelSize, k);
for q = 1:length(idx) %idx(1):idx(end), that's not right, since idx(1)from idx(end) is not continuos, and there are numbers that within idx(1) to idx(end), but not in idx array.
    i = idx(q);
    % pixel position on the unpadded image
    [idx_x, idx_y]=ind2sub([m,n],i);
     % kernel position on the padded image
     kernel_x = idx_x:idx_x + 2*floor(kernelSize/2);
     kernel_y = idx_y:idx_y + 2*floor(kernelSize/2);
     % kernel image
     for j = 1:k
         I_kernel(:,:,j)=ROI_pad(kernel_x,kernel_y).*I_pad(kernel_x, kernel_y,j);
     end
     I_kernel_resize = reshape(I_kernel,[kernelSize*kernelSize,k]);
     mu = mean(I_kernel_resize,1);
     I_kernel_submu = double(I_kernel_resize) - ones(kernelSize*kernelSize,1)*mu;
     %S = cov(I_kernel_submu);
     S = cov(I_kernel_resize);
     x = I(idx_x, idx_y,:);
     x = reshape(x,[k,1]);
     
     MF_local_score(idx_x, idx_y)=(double(t) - mu')'/ S * (double(x) - mu');
     MF_score(q) = MF_local_score(idx_x, idx_y);
end   
toc
%mu = mean(I,1)'; %1-by-spectral_no
%S = cov(I);% spectral_no-by-spectral_no
%I_muSub = I - ones(size(I,1),1)*mu'; % size of I, pix_no-by-spectral_no
%I_muSub_inv = I_muSub'; % size is the transpose of I's size

%for i = 1:size(I,1)
 %   MF_score(i) = (t - mu)' / S * I_muSub(i,:)';
%end

end

