clear all; close all; clc;

%% working path

% I0 image path
path_img = '../data/20180212/image processing2/';
addpath(path_img);

%fileIm = dir(fullfile(path,'I_GF.bmp'));
fileIm = dir(fullfile(path_img, '02122018_correct_R690G550B850_FalseColorWithChromAbr_com.bmp'));
I0 = fullfile(path_img, fileIm.name);
I0 = imread(I0);figure();imshow(I0,[]);title('Original Image')

path_data = '../data/';
addpath(path_data);
%%
%[m,n,k]=size(I0);
%I = reshape(I0,[m*n,k]);


%load(strcat(path_data,'BCInner.mat')) %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
%idx_ROI_BCInner = find(ROI>0);
%I_ROI_BCInner = double(I(idx_ROI_BCInner,:));
%t_BCInner = double(reshape(I0(1400, 2023,:),[1,3]));
%load('BlackCotnInnerBlood.mat');
%GT_BCInner = ROI_BCInner;   

%clearvars ROI
%load(strcat(path_data,'BCmid.mat')) %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
%idx_ROI_BCMid = find(ROI>0);
%I_ROI_BCMid = double(I(idx_ROI_BCMid,:));



%clearvars ROI
%load(strcat(path_data,'BCOutter.mat')) %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
%idx_ROI_BCOutter = find(ROI>0);
%I_ROI_BCOutter = double(I(idx_ROI_BCOutter,:));




%% algorithms
algos = {'MF','CEM','ACE','SAM'};
%AUC_ROC_cell = cell(4);
%AUC_PR_cell = cell(4);

%AUC_PR_BCInner_mid_outter_MF = zeros(3,0);
%AUC_PR_BCInner_mid_outter_CEM = zeros(3,0);
%AUC_PR_BCInner_mid_outter_ACE = zeros(3,0);
%AUC_PR_BCInner_mid_outter_SAM = zeros(3,0);

%TPR_p0001_BCInner_mid_outter_MF = zeros(3,0);
%TPR_p0001_BCInner_mid_outter_CEM = zeros(3,0);
%TPR_p0001_BCInner_mid_outter_ACE = zeros(3,0);
%TPR_p0001_BCInner_mid_outter_SAM = zeros(3,0);

AUC_PR_BCInner_mid_outter_allAlgos = zeros(3,4);
AUC_ROC_allSubstrates_allAlgos = zeros(3,4);
TPR_p0001_BCInner_mid_outter_allAlgos = zeros(3,4);

AUC_PR_allSubstrates_allAlgos = zeros(11,4);
AUC_ROC_allSubstrates_allAlgos = zeros(11,4);
TPR_p0001_allSubstrates_allAlgos = zeros(11,4);

%TPR_MF_CEM_ACE_SAM_p0001_BCOutter = zeros(4,1); % p0001 means 0.0001=10^(-4).
for j = 1:length(algos)

    
    algo = algos{j} % print out algo

    %%
    figure();h1=axes;hold on; grid on;
    PR_line_color={'r','g','b'};
    axis([0,1,0,1]);
    xlabel('Recall');
    ylabel('Precision'); title(algo)
    
    figure();h2=axes;hold on;grid on;
    axis([0,1,0,1]);
    xlabel('False positive rate');
    ylabel('True positive rate'); title(algo)

    for i = 1:3
        if i == 1  
            clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data
            % ROI
            load(strcat(path_data,'BCInner.mat'))  %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
            % GT
            load('BlackCotnInnerBlood.mat');
            GT_BCInner = ROI_BCInner; 
            % target spectrum
            t_BCInner = double(reshape(I0(1400, 2023,:),[1,3]));
    
            [algo_image_result, ALGO_GT_data, ALGO_non_GT_data] = algo_image(algo, I0, ROI, t_BCInner, GT_BCInner);
             
        elseif i ==2
            clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data
            % ROI
            load(strcat(path_data,'BCmid.mat')) %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
            % GT 
            load('BlackCotnMidBlood.mat');
            GT_BCMid = ROI_BCMid;
            % target spectrum
            t_BCMid = double(reshape(I0(1079, 2547,:),[1,3]));
    
            [algo_image_result, ALGO_GT_data, ALGO_non_GT_data] = algo_image(algo, I0, ROI, t_BCMid, GT_BCMid);
        elseif i ==3
            clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data
            % ROI
            load(strcat(path_data,'BCOutter.mat')) %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
            % GT
            load('BlackCotnOutterBlood.mat');
            GT_BCOutter = ROI_BCOutter;
            % target spectum
            t_BCOutter = double(reshape(I0(868, 2949,:),[1,3]));
    
            [algo_image_result, ALGO_GT_data, ALGO_non_GT_data] = algo_image(algo, I0, ROI, t_BCOutter, GT_BCOutter);
        end
            %% False alarm rate
           % clearvars idx_bigger_than_p0001 idx_smaller_than_p0001 TPR_p0001
            [TPR, FPR] = ROC(ALGO_GT_data, ALGO_non_GT_data );
            TPR_p0001_BCInner_mid_outter_allAlgos(i,j) = find_TPR_fixed_FPR(FPR, TPR, 10^(-4));
        
            % PR curve AUC
            [precision, recall] = Precision_Recall(ALGO_GT_data, ALGO_non_GT_data);
            %% AUC on PR-curve
            AUC_PR = trapz(recall, precision);
            if precision (end) == 1 && recall(end) <1
                AUC_PR = AUC_PR + ( (1- precision(end))*1);
            end
    
            AUC_PR_BCInner_mid_outter_allAlgos(i,j) = AUC_PR;
    
            plot(h1, recall, precision, strcat(PR_line_color{i},':'),'LineWidth',2)
            plot(h2, FPR, TPR, strcat(PR_line_color{i},':'),'LineWidth',2)
              
    
            %% AUC on ROC-curve
            %AUC_ROC = trapz(FPR, TPR);
            %if TPR (end) == 1 && FPR(end) <1
            %    AUC_ROC = AUC_ROC + ( (1- FPR(end))*1);
            %end
            
    end
    legend(h1,'BCInner','BCMid','BCOutter');
    legend(h2,'BCInner','BCMid','BCOutter');
    plot(h2, 0:0.01:1, 0:0.01:1, 'k-.', 'linewidth', 1.5,'HandleVisibility','off');
end