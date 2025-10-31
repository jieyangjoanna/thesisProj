function [AUC_PR_cell, AUC_ROC_cell] = TargetDet_GF_bckground()
%%TargetDet_GF_background() uses GF (Gray Felt) as an example substrate to
%%detect blood using the extracted background pixels using SEM.

% I0 image path
path_img = '../data/20180212/image processing2/';
addpath(path_img);
%fileIm = dir(fullfile(path,'I_GF.bmp'));
fileIm = dir(fullfile(path_img, '02122018_correct_R690G550B850_FalseColorWithChromAbr_com.bmp'));
I0 = fullfile(path_img, fileIm.name);
I0 = imread(I0);figure();imshow(I0,[]);title('Original Image')

I0_cut = I0(445:820,1100:1465,:);
figure,imshow(I0_cut, [])
%% Subset of image
path_data = '../data/';
addpath(path_data);
load('GF.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, 
figure,imshow(ROI,[0,1]);
idx_ROI = find(ROI>0);

[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);

% selected ROI on image.
I_ROI = double(I(idx_ROI,:));

figure,histogram(I_ROI(:,1),"BinWidth",1 ), title("1st channel");ylim([0 100])
figure,histogram(I_ROI(:,2),"BinWidth",1 ), title("2nd channel");ylim([0 100])
figure,histogram(I_ROI(:,3),"BinWidth",1 ), title("3rd channel");ylim([0 100])

%% ground truth
load('ROI_GF_bloodFullPixel.mat')
figure,imshow(ROI_GF_bloodFullPixel,[])
%load('blood_WC_data.mat');
%figure,imshow(bld_WC_data,[])
load('BloodTruth_mask.mat')
figure,imshow(BloodTruth,[])
% plot BloodTruth overlay I0
I0_overlay = 0.5*double(BloodTruth).*double(I0(:,:,1)) + 0.5*double(I0(:,:,1));

figure,imshow(uint8(I0_overlay), [])

ROI_GF_I0_cut_bloodFullPixel = ROI_GF_bloodFullPixel(445:820,1100:1465,:);
figure,imshow(ROI_GF_I0_cut,[])
ROI_GF_I0_cut_bloodoverlay = 0.5*double(I0_cut) + 0.5*255*double(ROI_GF_I0_cut);
figure,imshow(uint8(ROI_GF_I0_cut_bloodoverlay),[])

load('ROI_GF_bloodFullandSubPixel.mat');
ROI_GF_I0_cut_bloodFullandSubPixel = ROI_GF_bloodFullandSubPixel(445:820,1100:1465,:);
ROI_GF_I0_cut_bloodFullandSubPixel_overlay = 0.5*double(I0_cut) + 0.25*255*double(ROI_GF_I0_cut) + 0.25*255*double(ROI_GF_I0_cut_bloodFullandSubPixel);

% show bloodFullPixel and bloodFullandSubPixel only on ROI GF substrate
ROI_GF_I0_cut_bloodFullandSubPixel_overlay_blood_cut = ROI_GF_I0_cut_bloodFullandSubPixel_overlay(161:234, 154:227,:);
figure,imshow(uint8(ROI_GF_I0_cut_bloodFullandSubPixel_overlay_blood_cut),[])
% as a comparison, show the original image
ROI_GF_I0_cut_blood_cut = I0_cut(161:234, 154:227,:);
figure,imshow(uint8(ROI_GF_I0_cut_blood_cut), [])
% in folder: ./data/20180212/image processing2/,
% there are bloodstain masks on every substrate, but I suspect these are
% full pixel regions. Full and Subpixel regions need to be extracted
% manually.

%load('WoodBlood.mat');
%figure,imshow(ROI_W,[])

figure,imshow(ROI_GF_bloodFullPixel, [])
figure,imshow(ROI_RF_bloodFullPixel, [])
idx_ROI_GF_bloodFullPixel = find(ROI_W_bloodFullPixel>0);
% I_ROI_GF_bloodFullPixel = double(I(idx_ROI_GF_bloodFullPixel,:));
% t_GF_mean_FullPixels = mean(I_ROI_GF_bloodFullPixel,1);


load('ROI_GF_bloodFullandSubPixel.mat')
figure,imshow(ROI_GF_bloodFullandSubPixel, [])
idx_ROI_GF_bloodFullandSubPixel = find(ROI_GF_bloodFullandSubPixel>0);
%reshape image
[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);
% selected ROI on image.
%  I_ROI_GF_bloodFullPixel = double(I(idx_ROI_GF_bloodFullandSubPixel,:));
I_ROI_GF_bloodFullPixel = double(I(idx_ROI_GF_bloodFullandSubPixel,:));
I_ROI_GF_bloodFullandSubPixel = double(I(idx_ROI_GF_bloodFullandSubPixel,:));

t_GF_mean_FullPixels = mean(I_ROI_GF_bloodFullPixel,1);
t_GF_mean_FullandSubPixels = mean(I_ROI_GF_bloodFullandSubPixel,1);
figure,histogram(I_ROI_GF_bloodFullPixel(:,1),"BinWidth",1 ), title("1st channel GF blood full pixel"); ylim([0 100])
figure,histogram(I_ROI_GF_bloodFullPixel(:,2),"BinWidth",1 ), title("2nd channel GF blood full pixel");ylim([0 100])
figure,histogram(I_ROI_GF_bloodFullPixel(:,3),"BinWidth",1 ), title("3rd channel GF blood full pixel")

% t_GF_fullPixel = ROI_GF_bloodFullPixel;
%% target spectrum, use one pixel, or use an average
t_GF = double(reshape(I0(641, 1291,:),[1,3]));

%% algorithms
algos = {'MF','CEM','ACE','SAM'};
AUC_ROC_cell = cell(4);
AUC_PR_cell = cell(4);
%%
figure();h1=axes;hold on; grid on;
PR_line_color={'r','g','b','m'};
axis([0,1,0,1]);
%title('PR');
xlabel('Recall');
ylabel('Precision');

figure();h2=axes;hold on;grid on;
axis([0,1,0,1]);
xlabel('False positive rate');
ylabel('True positive rate');
GT = ROI_GF_bloodFullPixel;

for i = 1:length(algos)
    if i == 1  
        %
        % algo to detect blood, MF global with background extraction
        clearvars ALGO_image_0
        [MF_score_global] = MF_bckground(I_ROI, idx_bckgrd, t_GF');
        if min(MF_score_global)<0
            ALGO_image_0 = 100*min(MF_score_global).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(MF_score_global)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=MF_score_global';
        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

     elseif i ==2
        %
        clearvars ALGO_image_0
        CEM_score = CEM_bckground(I_ROI, idx_bckgrd, t_GF'); %CEM(I_ROI,t_BCInner');
        if min(CEM_score)<0
            ALGO_image_0 = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(CEM_score)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=CEM_score';
        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

     elseif i ==3
        %
        clearvars ALGO_image_0
         ACE_score = ACE_bckground(I_ROI, idx_bckgrd, t_GF'); %ACE(I_ROI,t_BCInner');
        if min(ACE_score)<0
            ALGO_image_0 = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(ACE_score)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=ACE_score';
        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

    elseif i==4
        %
       clearvars ALGO_image_0
        SAM_score = SAM_bckground(I_ROI, idx_bckgrd, t_GF'); %SAM(I_ROI,t_BCInner');
        if min(SAM_score)<0
            ALGO_image_0 = 100*min(SAM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(SAM_score)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=SAM_score';
        ALGO_image_0 = reshape(ALGO_image_0, [m,n]);
    end
       % ground truth
        ALGO_GT = ALGO_image_0.*GT;
        idx_GT = find(GT>0);
        % bloodstain data 
        ALGO_GT_data = reshape(ALGO_GT,[m*n,1]);
        ALGO_GT_data = ALGO_GT_data(idx_GT);
        ALGO_GT_data = sort(ALGO_GT_data, 'descend');
        %figure();imshow(ALGO_GT,[min(ALGO_GT_data) max(ALGO_GT_data)]);title('Estimated Bloodstain Ground Truth');colorbar;
    
        % non-bloodstain data
        ALGO_image_0 = reshape(ALGO_image_0, [m*n,1]);
        ALGO_non_GT_data = ALGO_image_0(setdiff(idx_ROI, idx_GT));
        ALGO_non_GT_data = sort(ALGO_non_GT_data,'descend');
        
         %% ROC
        [TPR, FPR] = ROC(ALGO_GT_data, ALGO_non_GT_data );
        [precision, recall] = Precision_Recall(ALGO_GT_data, ALGO_non_GT_data);
            
        plot(h1, recall, precision, strcat(PR_line_color{i},':'),'LineWidth',2)
        plot(h2, FPR, TPR, strcat(PR_line_color{i},':'),'LineWidth',2)
       
        %% AUC on ROC-curve
        AUC_ROC = trapz(FPR, TPR);
        if TPR (end) == 1 && FPR(end) <1
            AUC_ROC = AUC_ROC + ( (1- FPR(end))*1);
        end
        
        AUC_ROC_cell{i}=AUC_ROC;
        
        %% AUC on PR-curve
        AUC_PR = trapz(recall, precision);
        if precision (end) == 1 && recall(end) <1
            AUC_PR = AUC_PR + ( (1- precision(end))*1);
        end
        
        AUC_PR_cell{i}=AUC_PR;
    end
legend(h1,'MF','CEM','ACE','SAM');
legend(h2,'MF','CEM','ACE','SAM');
plot(h2, 0:0.01:1, 0:0.01:1, 'k-.', 'linewidth', 1.5,'HandleVisibility','off');


end

