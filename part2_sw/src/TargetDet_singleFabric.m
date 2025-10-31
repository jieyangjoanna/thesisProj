function [I_scoreIm_GT_data, I_scoreIm_non_GT_data] = TargetDet_singleFabric(I_original, I_scoreIm)
% This function is used to extract every single ROI fabric for images taken
% on 04162018
%   The input image I_scoreIm is the grayscale image produced by any target
%   detection or anomaly detection method



%% Subset of the scored image
% Every fabric only has one area of interest
ROI_W = image_subsetting(I_MSI,1);
save('ROI_W.mat','ROI_W');

ROI_RBD = ROI.*I_scoreIm;

figure();imshow(ROI_RBD,[min(ROI_RBD(:)), max(ROI_RBD(:))]);title('ROI W');colorbar
idx_ROI = find(ROI>0);
%reshape image
[m,n,k]=size(I_scoreIm);
I = reshape(I_scoreIm,[m*n,k]);
% selected ROI on image.
I_ROI = double(I(idx_ROI,:));


%% ground truth

%GT = image_subsetting(I0,1);
GT = ROI_BLD_W;
I_scoreIm_GT = I_scoreIm.*GT;

idx_GT = find(GT>0);
% bloodstain data 
I_scoreIm_GT_data = reshape(I_scoreIm_GT,[m*n,1]);
I_scoreIm_GT_data = I_scoreIm_GT_data(idx_GT);
I_scoreIm_GT_data = sort(I_scoreIm_GT_data, 'descend');

figure();imshow(I_scoreIm_GT,[min(I_scoreIm_GT_data) max(I_scoreIm_GT_data)]);title('Estimated Bloodstain Ground Truth');colorbar;

% non-bloodstain data
I = reshape(I_scoreIm, [m*n,1]);
I_scoreIm_non_GT_data = I(setdiff(idx_ROI, idx_GT));
I_scoreIm_non_GT_data = sort(I_scoreIm_non_GT_data,'descend');




%% ROC
[TPR, FPR] = ROC(I_scoreIm_GT_data, I_scoreIm_non_GT_data );

%% AUC
AUC = trapz(FPR, TPR);
if TPR (end) == 1 & FPR(end) <1
    AUC = AUC + ( (1- FPR(end))*1);
end
%% plot
figure();hold on; grid on;
plot(FPR, TPR, ':','LineWidth',2)
plot(0:0.01:1, 0:0.01:1, 'k-.', 'linewidth', 1.5);
%legend('GF as background', 'GF uniform part as background','Entire image as background');
axis([0,1,0,1]);
title('ROC W');
xlabel('False positive rate');
ylabel('True positive rate');
hold off;

end

