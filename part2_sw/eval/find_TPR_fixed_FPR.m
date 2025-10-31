function [TPR_p0001] = find_TPR_fixed_FPR(FPR, TPR, alpha)
% FIND_TPR_FIXED_FPR finds the true positive rate (false alarm rate) with a
% fixed false positive rate (false alarm rate). 

%   For target detection algorithm, when the target data is sparse, or the
%   target pixel # is very few compared to the whole image pixel #, it is
%   not meaningful to report ROC curve or AUC of ROC curve. It is
%   meaningful to fix the false alarm rate and report the true positive
%   rate when the algo reaches this false alarm rate. The bigger the true
%   positive rate, the better the algo is. As to what false alarm rate of
%   the algo should be fixed at, this is determined by the whole (target 
%   pixel # plus the non-target pixel #, refer to "Hyperspectral Image 
%   Processing for Automatic Target Detection Applications, Dimitris 
%   Manolakis, David Marden, Gary A. Shaw" page 109.) It says eastimating
%   of P_{False Alarm} is inaccurate when P_{FA}<10/N, where N is the 
%   number of available pixels (whole image pixel: target pixel # plus 
%   non-target pixel #). 

%   When doing target detection, the estimated pixel # in each ROI is about
%   10^5, so P_{FA} is fixed at 10^(-4).

%   FPR is the false positive rate after performing target detectoin algo 
%   and using ROC.m function. The format of FPR is a 1d array
%   


        idx_bigger_than_p0001 = min(find(FPR>alpha==1));
        idx_smaller_than_p0001 = max(find(FPR<alpha==1));
        if idx_bigger_than_p0001 - idx_smaller_than_p0001 == 1
            TPR_p0001 = interp1([FPR(idx_smaller_than_p0001), FPR(idx_bigger_than_p0001)],[TPR(idx_smaller_than_p0001), TPR(idx_bigger_than_p0001)], alpha, 'linear');
        elseif (isempty(idx_smaller_than_p0001)) && (idx_bigger_than_p0001 == 1)
            [unique_item_FPR, unique_idx_FPR] = unique(FPR(1:10));
            [unique_item_TPR, unique_idx_TPR] = unique(TPR(1:10));
            if (size(unique_idx_FPR,2) == 10) && (size(unique_idx_TPR,2) == 10)
                TPR_p0001 = interp1(FPR(1:10), TPR(1:10), alpha, 'linear', 'extrap'); % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            else
                TPR_p0001 = interp1(FPR(intersect(unique_idx_FPR', unique_idx_TPR')), TPR(intersect(unique_idx_FPR, unique_idx_TPR)), alpha, 'linear', 'extrap');
            end
            
            if TPR_p0001 < 0
                TPR_p0001 = 0;
            end
        end
end