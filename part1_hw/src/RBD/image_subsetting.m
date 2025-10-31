function [ROI_mask ] = image_subsetting(I,c)
% IMAGE_SUBSETTING_REC subsets parts in an image I.

%   The image subsets are part of input image I. for the
%   MSI bloodstain detection application, I is m-n-3 dimension. 
%   c is the number of regions users plan to select.

%   ROI_mask has the same m-by-n dimension as the input image I. It is
%   logical. '1' represents pixel selected, '0' represents pixel
%   not-selected. 

[m,n,k]=size(I);
ROI_mask = zeros(m,n);


for i = 1:c
    disp('Select the ');
    disp(i);
    disp('th region');
    
    
    %h(i) = imfreehand; position = wait(h(i));%Double-click on the freehand region to resume execution of the MATLAB command line.
    %ROI_mask = ROI_mask + createMask(h(i)); 
    [ROI_x, ROI_y]=getpts
    ROI_mask = ROI_mask + roipoly(I,ROI_x, ROI_y);
    
end



end

