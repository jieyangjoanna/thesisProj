function [ output_args ] = AUC_vs_AoV(I_original, I_scoreIm,ROI_GT)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
% WP


%ROI_BF = image_subsetting(I_original,1);

load ROI_BF
load ROI_RF
ROI_RF = ROI
load ...
% image padding
I_scoreIm = zeros(2748,3840);
I_scoreIm(7:2744, 1:3700) = RBD_value_Index8;

[m,n,k]=size(I_scoreIm);
AUC_RF = zeros(25,1);

for angle_lowLimit = 2:20
    [~, Cut] = Radial_Cut(angle_lowLimit, I_scoreIm);
    ROI_Target_cut = Cut.*ROI_BLD_RF;% ROI means one entire fabric area
    if isempty(nonzeros(ROI_Target_cut))
        error('No target points selected! ');
    else
        
        
        % subset of scored image
        idx_ROI_cut = find(ROI_Target_cut>0);
        %reshape image
        I = reshape(I_scoreIm,[m*n,k]);
        % selected ROI on image.
        I_ROI = double(I(idx_ROI_cut,:));
        
        % ground truth
        GT = Cut.*ROI_BLD_WC;% ROI_WC means bloodstains on WC
        I_scoreIm_GT = I_scoreIm.*GT;

        idx_GT = find(GT>0);
        % bloodstain data 
        I_scoreIm_GT_data = reshape(I_scoreIm_GT,[m*n,1]);
        I_scoreIm_GT_data = I_scoreIm_GT_data(idx_GT);
        I_scoreIm_GT_data = sort(I_scoreIm_GT_data, 'descend');

       % figure();imshow(I_scoreIm_GT,[min(I_scoreIm_GT_data) max(I_scoreIm_GT_data)]);title('Estimated Bloodstain Ground Truth');colorbar;

        % non-bloodstain data
        I = reshape(I_scoreIm, [m*n,1]);
        I_scoreIm_non_GT_data = I(setdiff(idx_ROI_cut, idx_GT));
        I_scoreIm_non_GT_data = sort(I_scoreIm_non_GT_data,'descend');

        
        %% ROC
        [TPR, FPR] = ROC(I_scoreIm_GT_data, I_scoreIm_non_GT_data );

        %% AUC
        AUC_RF(angle_lowLimit+1) = trapz(FPR, TPR);
        if isempty(TPR) | isempty(FPR)
         %   error('TPR or FPR is empty!');
         AUC_RF(angle_lowLimit+1)=0;
        elseif TPR (end) == 1 & FPR(end) <1
             AUC_RF(angle_lowLimit+1) = AUC_RF(angle_lowLimit+1) + ( (1- FPR(end))*1);
        end
        
    end
end

angle_lowLimit = find(AUC_RF>0);
figure();
plot(angle_lowLimit, AUC_RF(angle_lowLimit),'*');
ylim([0 1])
xlabel('Angle Of View (degree)');ylabel('AUC')
title('AUC for Bloodstain on WC')
grid on;


end

