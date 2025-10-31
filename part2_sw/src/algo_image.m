function [ALGO_image_0, ALGO_GT_data,  ALGO_non_GT_data]= algo_image(algo, I, ROI, t, GT)
%ALGO_IMAGE returns a full size image result processed by the target
%detection algorithm
%   The output algo_image_result is the detection result, in grayscale, the
%   resolution is the 2d full-size image, e.g.: 2748x3371x1
%   
%   the input "algo" is a string, it can be any target detection algo,
%   e.g.: MF, ACE, CEM, SAM

%   the I is the whole image before ROI extraction, its size is
%   width-by-height-by-spectral#, eg: 2748x3371x3.

%   the ROI is the ROI of a substrate on the full-size image. It is a binary image with its size the same as the fullsize image. For
%   example, in the full size image: C:\Users\jieyang\OneDrive -
%   Lenovo\202403JieThesis\02122018\image
%   processing2\02122018_correct_R690G550B850_FalseColorWithChromAbr_com.bmp,
%   the ROI can be Gray Felt, Black Cotton, etc.  For example,
%   load('WP.mat') gets the White polyester ROI binary image, the size is
%   2748x3371x1.
% 
% If the ROI is the
%   BCInner, its dimension is 54580x3, double, pixel#-by-3


%   t is the bloodstain target spectrum. for example, if t is BCInner blood
%   spectrum, it is [56, 29, 190]'. 

%   GT is the ground truth for bloodstains. It is a binary full-image size.
%   Its dimension is 2748x3371 logical. For example, load('BlackCotnInnerBlood.mat');
%   GT = ROI_BCInner;   

% assert(algo {'MF', 'ACE', 'CEM', 'SAM'});

[m,n,k]=size(I);
I = reshape(I,[m*n,k]);

idx_ROI = find(ROI>0);
I_ROI = double(I(idx_ROI,:));

path_algos = "./target_detection_algos/";
addpath(path_algos);

if strcmp(algo,'MF')
    [MF_score_global] = MF(I_ROI,t');
    if min(MF_score_global)<0
        ALGO_image_0 = 100*min(MF_score_global).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
    else ALGO_image_0 = (-100 + min(MF_score_global)).*ones(m*n,1);
    end
    % store scores to the ROI region
    ALGO_image_0(idx_ROI)=MF_score_global';
    ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

elseif strcmp(algo, 'CEM')
    clearvars ALGO_image_0
    CEM_score = CEM(I_ROI,t'); %CEM(I_ROI,t_BCInner');
    if min(CEM_score)<0
        ALGO_image_0 = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
        else ALGO_image_0 = (-100 + min(CEM_score)).*ones(m*n,1);
    end
    % store scores to the ROI region
    ALGO_image_0(idx_ROI)=CEM_score';
    ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

elseif strcmp(algo, 'ACE')
    clearvars ALGO_image_0
    ACE_score = ACE(I_ROI,t'); %ACE(I_ROI,t_BCInner');
    if min(ACE_score)<0
        ALGO_image_0 = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
        else ALGO_image_0 = (-100 + min(ACE_score)).*ones(m*n,1);
    end
    % store scores to the ROI region
    ALGO_image_0(idx_ROI)=ACE_score';
    ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

elseif strcmp(algo, 'SAM')
    clearvars ALGO_image_0
    SAM_score = SAM(I_ROI,t'); %SAM(I_ROI,t_BCInner');
    if min(SAM_score)<0
        ALGO_image_0 = 100*min(SAM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
        else ALGO_image_0 = (-100 + min(SAM_score)).*ones(m*n,1);
    end
    % store scores to the ROI region
    ALGO_image_0(idx_ROI)=SAM_score';
    ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
end


    % ground truth
    ALGO_GT = ALGO_image_0.*GT;
    idx_GT = find(GT>0);
    % bloodstain data 
    ALGO_GT_data= reshape(ALGO_GT,[m*n,1]);
    ALGO_GT_data = ALGO_GT_data(idx_GT);
    ALGO_GT_data = sort(ALGO_GT_data, 'descend');

    % non-bloodstain data
    ALGO_image_0 = reshape(ALGO_image_0, [m*n,1]);
    ALGO_non_GT_data = ALGO_image_0(setdiff(idx_ROI, idx_GT));
    ALGO_non_GT_data = sort(ALGO_non_GT_data,'descend');


end