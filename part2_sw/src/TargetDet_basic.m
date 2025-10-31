% TARGETdEC performs target detection algorithms on original image, ROI on
% image.

%   This function can change target detection algorithms and background
%   cluster pixels. For example, change the "algo_image_plot_background()"
%   into "algo_imiage_plot()".


clear all; close all; clc;

% I0 image path
path_img = '../data/20180212/image processing2/';
addpath(path_img);

%fileIm = dir(fullfile(path,'I_GF.bmp'));
fileIm = dir(fullfile(path_img, '02122018_correct_R690G550B850_FalseColorWithChromAbr_com.bmp'));
I0 = fullfile(path_img, fileIm.name);
I0 = imread(I0);figure();imshow(I0,[]);title('Original Image')

path_data = '../data/';
addpath(path_data);

%% algorithms
%algos = {'MF','CEM','ACE','SAM'};

AUC_PR_allSubstrates_allAlgos = zeros(11,4);
AUC_ROC_allSubstrates_allAlgos = zeros(11,4);
TPR_p0001_allSubstrates_allAlgos = zeros(11,4);

%%
for i = 1:11
    if i == 1
        clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data
        % ROI
        load(strcat(path_data, 'WP.mat'))
        % GT
        load('WhitePolyBlood.mat');
        GT_WP = ROI_WP;
        % target spectrum
        t_WP = double(reshape(I0(1070,731,:),[1,3]));
        load('idx_bckgrd_WP.mat')
        idx_bckgrd_WP = idx_bckgrd;
        [TPR_p0001_allSubstrates_allAlgos(i,:), AUC_PR_allSubstrates_allAlgos(i,:), AUC_ROC_allSubstrates_allAlgos(i,:)]= algo_image_plot_background(I0, ROI, idx_bckgrd_WP, t_WP, GT_WP, 'WP');     
    elseif i == 2
        clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data idx_bckgrd
        % ROI
        load(strcat(path_data, 'WC.mat'))
        % GT
        load('WhiteCotnBlood.mat');
        GT_WC = ROI_WC;
        % target spectrum
        t_WC = double(reshape(I0(1666,853,:),[1,3]));
        load('idx_bckgrd_WC.mat')
        idx_bckgrd_WC = idx_bckgrd;
        [TPR_p0001_allSubstrates_allAlgos(i,:), AUC_PR_allSubstrates_allAlgos(i,:), AUC_ROC_allSubstrates_allAlgos(i,:)]= algo_image_plot_background(I0, ROI, idx_bckgrd_WC, t_WC, GT_WC, 'WC');
   elseif i == 3
       clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data idx_bckgrd
       % ROI
       load(strcat(path_data, 'GF.mat'))
       % GT
       load('ROI_GF_bloodFullPixel.mat')  %ROI_GF_bloodFullPixel.mat
       GT_GF = ROI_GF_bloodFullPixel;
       % target spectrum
       t_GF = double(reshape(I0(641, 1291,:),[1,3]));
       load('idx_bckgrd_GF.mat');
       idx_bckgrd_GF = idx_bckgrd;
       [TPR_p0001_allSubstrates_allAlgos(i,:), AUC_PR_allSubstrates_allAlgos(i,:), AUC_ROC_allSubstrates_allAlgos(i,:)]= algo_image_plot_background(I0, ROI, idx_bckgrd_GF, t_GF, GT_GF, 'GF');
   elseif i == 4
       clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data idx_bckgrd
       % ROI
       load(strcat(path_data, 'GRNF.mat'))
       % GT
       load('GreenFeltBlood.mat');
       GT_GRNF = ROI_GRF;
       % target spectrum
       t_GRNF = double(reshape(I0(1816, 1880,:),[1,3]));
       load('idx_bckgrd_GRNF');
       idx_bckgrd_GRNF = idx_bckgrd;
       [TPR_p0001_allSubstrates_allAlgos(i,:), AUC_PR_allSubstrates_allAlgos(i,:), AUC_ROC_allSubstrates_allAlgos(i,:)]= algo_image_plot_background(I0, ROI, idx_bckgrd_GRNF, t_GRNF, GT_GRNF, 'GRNF');
   elseif i == 5
       clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data idx_bckgrd
       % ROI
       load(strcat(path_data, 'RF.mat'))
       % GT
       load('RedFeltBlood.mat');
       GT_RF = ROI_RF;
       % target spectrum
       t_RF = double(reshape(I0(759, 1961,:),[1,3]));
       load('idx_bckgrd_RF.mat');
       idx_bckgrd_RF = idx_bckgrd;
       [TPR_p0001_allSubstrates_allAlgos(i,:), AUC_PR_allSubstrates_allAlgos(i,:), AUC_ROC_allSubstrates_allAlgos(i,:)]= algo_image_plot_background(I0, ROI, idx_bckgrd_RF, t_RF, GT_RF, 'RF');
  elseif i == 6
       clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data idx_bckgrd
       % ROI
       load(strcat(path_data, 'BF.mat'))
       % GT
       load('BlackFeltBlood.mat');
       GT_BF = ROI_BF;
       % target spectrum
       t_BF = double(reshape(I0(976,334,:),[1,3]));
       load('idx_bckgrd_BF.mat');
       idx_bckgrd_BF = idx_bckgrd;
       [TPR_p0001_allSubstrates_allAlgos(i,:), AUC_PR_allSubstrates_allAlgos(i,:), AUC_ROC_allSubstrates_allAlgos(i,:)]= algo_image_plot_background(I0, ROI, idx_bckgrd_BF, t_BF, GT_BF, 'BF');
  elseif i == 7
       clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data idx_bckgrd
       % ROI
       load(strcat(path_data, 'BCinner.mat'))
       % GT
       load('BlackCotnInnerBlood.mat')
       GT_BCInner = ROI_BCInner;
       % target spectrum
       t_BCInner = double(reshape(I0(1400, 2023,:),[1,3]));
       load('idx_bckgrd_BCinner.mat')
       idx_bckgrd_BCinner = idx_bckgrd;
       [TPR_p0001_allSubstrates_allAlgos(i,:), AUC_PR_allSubstrates_allAlgos(i,:), AUC_ROC_allSubstrates_allAlgos(i,:)]= algo_image_plot_background(I0, ROI, idx_bckgrd_BCinner, t_BCInner, GT_BCInner, 'BCInner');
  elseif i ==8
        clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data idx_bckgrd
        % ROI
        load(strcat(path_data,'BCmid.mat')) %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
        % GT 
        load('BlackCotnMidBlood.mat');
        GT_BCMid = ROI_BCMid;
        % target spectrum
        t_BCMid = double(reshape(I0(1079, 2547,:),[1,3]));
        load('idx_bckgrd_BCmid.mat')
       idx_bckgrd_BCmid = idx_bckgrd;
        [TPR_p0001_allSubstrates_allAlgos(i,:), AUC_PR_allSubstrates_allAlgos(i,:), AUC_ROC_allSubstrates_allAlgos(i,:)]= algo_image_plot_background(I0, ROI,idx_bckgrd_BCmid, t_BCMid, GT_BCMid, 'BCMid');
   elseif i ==9
        clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data idx_bckgrd
        % ROI
        load(strcat(path_data,'BCOutter.mat')) %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
        % GT
        load('BlackCotnOutterBlood.mat');
        GT_BCOutter = ROI_BCOutter;
        % target spectum
        t_BCOutter = double(reshape(I0(868, 2949,:),[1,3]));
        load('idx_bckgrd_BCOutter.mat')
       idx_bckgrd_BCOutter = idx_bckgrd;
        [TPR_p0001_allSubstrates_allAlgos(i,:), AUC_PR_allSubstrates_allAlgos(i,:), AUC_ROC_allSubstrates_allAlgos(i,:)]= algo_image_plot_background(I0, ROI, idx_bckgrd_BCOutter, t_BCOutter, GT_BCOutter, 'BCOutter');
   elseif i == 10
       clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data idx_bckgrd
       % ROI
       load(strcat(path_data, 'J.mat'))
       % GT
       load('JeanBlood.mat');
       GT_J = ROI_J;
       % target spectrum
       t_J = double(reshape(I0(1762, 1338,:),[1,3]));
        load('idx_bckgrd_J.mat')
       idx_bckgrd_J = idx_bckgrd;
       [TPR_p0001_allSubstrates_allAlgos(i,:), AUC_PR_allSubstrates_allAlgos(i,:), AUC_ROC_allSubstrates_allAlgos(i,:)]= algo_image_plot_background(I0, ROI, idx_bckgrd_J, t_J, GT_J, 'J');
   elseif i == 11
        clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data idx_bckgrd
        % ROI
        load(strcat(path_data, 'Wood.mat'))
        % GT
        load('WoodBlood.mat');
        GT_W = ROI_W;
        % target spectrum
        t_W = double(reshape(I0(1685,470,:),[1,3]));
         load('idx_bckgrd_Wood.mat')
       idx_bckgrd_Wood = idx_bckgrd;
        [TPR_p0001_allSubstrates_allAlgos(i,:), AUC_PR_allSubstrates_allAlgos(i,:), AUC_ROC_allSubstrates_allAlgos(i,:)]= algo_image_plot_background(I0, ROI, idx_bckgrd_Wood, t_W, GT_W, 'W');
    end
end
    

%% figure

%%%%% PR %%%%%%%%%%%
X = categorical({'MF','CEM','ACE','SAM'});
X = reordercats(X, {'MF','CEM','ACE','SAM'});

figure
b = bar(X, AUC_PR_allSubstrates_allAlgos, 'FaceColor', 'flat');

RGBTriplet_blue = [0 0.4470 0.7410];
RGBTriplet_red = [0.8500 0.3250 0.0980];
RGBTriplet_orange = [0.9290 0.6940 0.1250];
RGBTriplet_green= [0.4660 0.6740 0.1880];

b(1).CData(1,:) = RGBTriplet_blue; 
b(2).CData(1,:) = RGBTriplet_blue;
b(3).CData(1,:) = RGBTriplet_blue;
b(4).CData(1,:) = RGBTriplet_blue;
b(5).CData(1,:) = RGBTriplet_blue;
b(6).CData(1,:) = RGBTriplet_blue;
b(7).CData(1,:) = RGBTriplet_blue;
b(8).CData(1,:) = RGBTriplet_blue;
b(9).CData(1,:) = RGBTriplet_blue;
b(10).CData(1,:) = RGBTriplet_blue;
b(11).CData(1,:) = RGBTriplet_blue;


b(1).CData(2,:) = RGBTriplet_red;
b(2).CData(2,:) = RGBTriplet_red;
b(3).CData(2,:) = RGBTriplet_red;
b(4).CData(2,:) = RGBTriplet_red;
b(5).CData(2,:) = RGBTriplet_red;
b(6).CData(2,:) = RGBTriplet_red;
b(7).CData(2,:) = RGBTriplet_red;
b(8).CData(2,:) = RGBTriplet_red;
b(9).CData(2,:) = RGBTriplet_red;
b(10).CData(2,:) = RGBTriplet_red;
b(11).CData(2,:) = RGBTriplet_red;


b(1).CData(3,:) = RGBTriplet_orange; 
b(2).CData(3,:) = RGBTriplet_orange;
b(3).CData(3,:) = RGBTriplet_orange; 
b(4).CData(3,:) = RGBTriplet_orange; 
b(5).CData(3,:) = RGBTriplet_orange; 
b(6).CData(3,:) = RGBTriplet_orange; 
b(7).CData(3,:) = RGBTriplet_orange; 
b(8).CData(3,:) = RGBTriplet_orange; 
b(9).CData(3,:) = RGBTriplet_orange; 
b(10).CData(3,:) = RGBTriplet_orange; 
b(11).CData(3,:) = RGBTriplet_orange; 


b(1).CData(4,:) = RGBTriplet_green;
b(2).CData(4,:) = RGBTriplet_green;
b(3).CData(4,:) = RGBTriplet_green;
b(4).CData(4,:) = RGBTriplet_green;
b(5).CData(4,:) = RGBTriplet_green;
b(6).CData(4,:) = RGBTriplet_green;
b(7).CData(4,:) = RGBTriplet_green;
b(8).CData(4,:) = RGBTriplet_green;
b(9).CData(4,:) = RGBTriplet_green;
b(10).CData(4,:) = RGBTriplet_green;
b(11).CData(4,:) = RGBTriplet_green;
grid on;


%%% p0001 %%%%%%%%%%%%%%%
figure
b = bar(X, TPR_p0001_allSubstrates_allAlgos, 'FaceColor', 'flat');

RGBTriplet_blue = [0 0.4470 0.7410];
RGBTriplet_red = [0.8500 0.3250 0.0980];
RGBTriplet_orange = [0.9290 0.6940 0.1250];
RGBTriplet_green= [0.4660 0.6740 0.1880];

b(1).CData(1,:) = RGBTriplet_blue; 
b(2).CData(1,:) = RGBTriplet_blue;
b(3).CData(1,:) = RGBTriplet_blue;
b(4).CData(1,:) = RGBTriplet_blue;
b(5).CData(1,:) = RGBTriplet_blue;
b(6).CData(1,:) = RGBTriplet_blue;
b(7).CData(1,:) = RGBTriplet_blue;
b(8).CData(1,:) = RGBTriplet_blue;
b(9).CData(1,:) = RGBTriplet_blue;
b(10).CData(1,:) = RGBTriplet_blue;
b(11).CData(1,:) = RGBTriplet_blue;


b(1).CData(2,:) = RGBTriplet_red;
b(2).CData(2,:) = RGBTriplet_red;
b(3).CData(2,:) = RGBTriplet_red;
b(4).CData(2,:) = RGBTriplet_red;
b(5).CData(2,:) = RGBTriplet_red;
b(6).CData(2,:) = RGBTriplet_red;
b(7).CData(2,:) = RGBTriplet_red;
b(8).CData(2,:) = RGBTriplet_red;
b(9).CData(2,:) = RGBTriplet_red;
b(10).CData(2,:) = RGBTriplet_red;
b(11).CData(2,:) = RGBTriplet_red;


b(1).CData(3,:) = RGBTriplet_orange; 
b(2).CData(3,:) = RGBTriplet_orange;
b(3).CData(3,:) = RGBTriplet_orange; 
b(4).CData(3,:) = RGBTriplet_orange; 
b(5).CData(3,:) = RGBTriplet_orange; 
b(6).CData(3,:) = RGBTriplet_orange; 
b(7).CData(3,:) = RGBTriplet_orange; 
b(8).CData(3,:) = RGBTriplet_orange; 
b(9).CData(3,:) = RGBTriplet_orange; 
b(10).CData(3,:) = RGBTriplet_orange; 
b(11).CData(3,:) = RGBTriplet_orange; 


b(1).CData(4,:) = RGBTriplet_green;
b(2).CData(4,:) = RGBTriplet_green;
b(3).CData(4,:) = RGBTriplet_green;
b(4).CData(4,:) = RGBTriplet_green;
b(5).CData(4,:) = RGBTriplet_green;
b(6).CData(4,:) = RGBTriplet_green;
b(7).CData(4,:) = RGBTriplet_green;
b(8).CData(4,:) = RGBTriplet_green;
b(9).CData(4,:) = RGBTriplet_green;
b(10).CData(4,:) = RGBTriplet_green;
b(11).CData(4,:) = RGBTriplet_green;
grid on;ylim([0.0 1.0])





%%%%%%%%%%%%%%%%%%%%%%% WP %%%%%
clearvars t_GF I_ROI GT
%% Subset of image
 % WP, WC, GF, GRNF, RF, BF, BCInner, BCMid, BCOutter, Jeans, Wood
load('WP.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
%figure,imshow(ROI,[0,1]);

idx_ROI = find(ROI>0);

[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);

% selected ROI on image.
I_ROI = double(I(idx_ROI,:));

%% target spectrum, use one pixel, or use an average
t_WP = double(reshape(I0(1070,731,:),[1,3]));
%t_WC = double(reshape(I0(1666,853,:),[1,3]));
%t_GF = double(reshape(I0(641, 1291,:),[1,3]));
%t_GRNF = double(reshape(I0(1816, 1880,:),[1,3]));
%t_RF = double(reshape(I0(759, 1961,:),[1,3]));
%t_BF = double(reshape(I0(976,334,:),[1,3]));
%t_BCInner = double(reshape(I0(1400, 2023,:),[1,3]));
%t_BCMid = double(reshape(I0(1079, 2547,:),[1,3]));
%t_BCOutter = double(reshape(I0(868, 2949,:),[1,3]));
%t_J = double(reshape(I0(1762, 1338,:),[1,3]));
%t_W = double(reshape(I0(1685,470,:),[1,3]));

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
%%%GT = ROI_GF;


load('WhitePolyBlood.mat');
GT = ROI_WP;
t_GF = t_WP;
%load('WhiteCotnBlood.mat');
%GT = ROI_WC;
%t_GF = t_WC;
%load('ROI_GF_bloodFullPixel.mat')  %ROI_GF_bloodFullPixel.mat
%GT = ROI_GF_bloodFullPixel;
%load('GreenFeltBlood.mat');
%GT = ROI_GRF;
%t_GF = t_GRNF;
%load('RedFeltBlood.mat');
%GT = ROI_RF;
%t_GF = t_RF;
%load('BlackFeltBlood.mat');
%GT = ROI_BF;
%t_GF = t_BF;
%load('BlackCotnInnerBlood.mat');
%GT = ROI_BCInner;
%t_GF = t_BCInner;
%load('BlackCotnMidBlood.mat');
%GT = ROI_BCMid;
%t_GF = t_BCMid;
%load('BlackCotnOutterBlood.mat');
%GT = ROI_BCOutter;
%t_GF = t_BCOutter;
%load('JeanBlood.mat');
%GT = ROI_J;
%t_GF = t_J;
%load('WoodBlood.mat');
%GT = ROI_W;
%t_GF = t_W;

% store the true positive rate when the false positive rate equals to
% 10^(-4). This is used to compare algo performance not based on AUC of
% ROC, because the target is few. The total number of pixels each substrate
% is 10^5, so we use 10/N=10^(-4) as a threshold to check the true positive
% rate. 
% ref: "hyperspectral image processing for automatic target detection
% applications", Dimitris Manolakis, David Marden, and Gary A. Shaw.

TPR_MF_CEM_ACE_SAM_p0001_WP = zeros(4,1); % p0001 means 0.0001=10^(-4).


for i = 1:length(algos)
    if i == 1  
        
        %{
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
        figure();imshow(ALGO_image_0,[0 50]);title('MF score global with background extraction, sigma mean subtracted');colorbar;
       %figure();imshow(ALGO_image_0,[min(MF_score_global) max(MF_score_global)]);colorbar;title('MF score global with background extraction, sigma mean subtracted')

        figure();imshow(ALGO_image_0,[-10 2]);title('MF score global with background extraction, sigma mean subtracted');colorbar;
       %}
        
        
        
        % algo to detect blood, MF global
        clearvars ALGO_image_0
        [MF_score_global] = MF(I_ROI,t_GF');
        if min(MF_score_global)<0
            ALGO_image_0 = 100*min(MF_score_global).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(MF_score_global)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=MF_score_global';
        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
        %figure();imshow(ALGO_image_0,[0 50]);colorbar;title('MF score global, sigma mean subtracted')
        %figure();imshow(ALGO_image_0,[min(MF_score_global) max(MF_score_global)]);title('MF score global, sigma mean subtracted')
       %figure();imshow(ALGO_image_0,[-10 2]);colorbar;title('MF score global, sigma mean subtracted')
       %}
        
       
        
       %{
        clearvars ALGO_image_0
        MF_score_local = MF_local_arbitraryShape(I0,ROI, 71, t_GF');
        if min(MF_score_local)<0
            ALGO_image_0 = 100*min(MF_score_local).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(MF_score_local)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=MF_score_local';

        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
        %figure();imshow(ALGO_image_1,[min(MF_score_global) max(MF_score_global)]);colorbar;title('MF score local, sigma mean not subtracted')
        %figure();imshow(ALGO_image_1,[-10 2]);colorbar;title('MF score local, sigma not mean subtrated')
        
        clearvars ALGO_image_0
       %}

       elseif i ==2
            %{
            clearvars ALGO_image_0
            CEM_score = CEM_bckgrd(I_ROI, idx_bckgrd, t_GF'); %CEM(I_ROI,t_BCInner');
            if min(CEM_score)<0
                ALGO_image_0 = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(CEM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=CEM_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
            %figure();imshow(ALGO_image_0,[min(CEM_score) max(CEM_score)]);title('CEM score of ROI with background extraction')
            figure();imshow(ALGO_image_0,[0 1]);title('CEM score of ROI with background extraction')
           %}

            
            clearvars ALGO_image_0
            CEM_score = CEM(I_ROI,t_GF'); %CEM(I_ROI,t_BCInner');
            if min(CEM_score)<0
                ALGO_image_0 = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(CEM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=CEM_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
            %figure();imshow(ALGO_image_4,[min(CEM_score) max(CEM_score)]);title('CEM score of ROI')
            %figure();imshow(ALGO_image_0,[0 1]);title('CEM score of ROI')
            %}
            
           

       elseif i ==3
            %{
            clearvars ALGO_image_0
             ACE_score = ACE_bckgrd(I_ROI, idx_bckgrd, t_GF'); %ACE(I_ROI,t_BCInner');
            if min(ACE_score)<0
                ALGO_image_0 = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(ACE_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=ACE_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
            %figure();imshow(ALGO_image_0,[min(ACE_score) max(ACE_score)]);colorbar;title('ACE score of ROI')
            %figure();imshow(ALGO_image_0,[-6*10^(-6) 6*10^(-6)]);colorbar;title('ACE score of ROI with background extraction')
            %}
            
            
            clearvars ALGO_image_0
            ACE_score = ACE(I_ROI,t_GF'); %ACE(I_ROI,t_BCInner');
            if min(ACE_score)<0
                ALGO_image_0 = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(ACE_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=ACE_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
            %figure();imshow(ALGO_image_0,[min(ACE_score) max(ACE_score)]);title('ACE score of ROI')
            %figure();imshow(ALGO_image_0,[-6*10^(-6) 6*10^(-6)]);colorbar;title('ACE score of ROI')
            %figure();imshow(ALGO_image_0,[-1 1]);colorbar;title('ACE score of ROI')
            %}

       elseif i==4
            clearvars ALGO_image_0
            SAM_score = SAM(I_ROI,t_GF'); %SAM(I_ROI,t_BCInner');
            if min(SAM_score)<0
                ALGO_image_0 = 100*min(SAM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(SAM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=SAM_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
            %figure();imshow(ALGO_image_0,[min(SAM_score) max(SAM_score)]);colorbar;title('SAM score of ROI')
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
        clearvars idx_bigger_than_p0001 idx_smaller_than_p0001 TPR_p0001
        [TPR, FPR] = ROC(ALGO_GT_data, ALGO_non_GT_data );
        idx_bigger_than_p0001 = min(find(FPR>10^(-4)==1));
        idx_smaller_than_p0001 = max(find(FPR<10^(-4)==1));
        if idx_bigger_than_p0001 - idx_smaller_than_p0001 == 1
            TPR_p0001 = interp1([FPR(idx_smaller_than_p0001), FPR(idx_bigger_than_p0001)],[TPR(idx_smaller_than_p0001), TPR(idx_bigger_than_p0001)], 10^(-4), 'linear');
        elseif (isempty(idx_smaller_than_p0001)) && (idx_bigger_than_p0001 == 1)
            % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            [unique_item_FPR, unique_idx_FPR] = unique(FPR(1:10));
            [unique_item_TPR, unique_idx_TPR] = unique(TPR(1:10));
            if (size(unique_idx_FPR,2) == 10) && (size(unique_idx_TPR,2) == 10)
                TPR_p0001 = interp1(FPR(1:10), TPR(1:10), 10^(-4), 'linear', 'extrap'); % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            else
                TPR_p0001 = interp1(FPR(intersect(unique_idx_FPR', unique_idx_TPR')), TPR(intersect(unique_idx_FPR, unique_idx_TPR)), 10^(-4), 'linear', 'extrap');
            end

            if TPR_p0001 < 0
                TPR_p0001 = 0;
            end
        end
        TPR_MF_CEM_ACE_SAM_p0001_WP(i) = TPR_p0001;

        %TPR_p0001 = interp1(FPR,TPR,10^(-4), 'linear');

        [precision, recall] = Precision_Recall(ALGO_GT_data, ALGO_non_GT_data);
        
        
            
        plot(h1, recall, precision, strcat(PR_line_color{i},':'),'LineWidth',2)
        plot(h2, FPR, TPR, strcat(PR_line_color{i},':'),'LineWidth',2)
        
        %plot(0:0.01:1, 0:0.01:1, 'k-.', 'linewidth', 1.5);
        %legend('GF as background', 'GF uniform part as background','Entire image as background');
            

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
%%

%%%%%%%%%%%%%%%%%%%%%%%%%% WC %%%%%%%%
clearvars t_GF I_ROI GT
load('WC.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
idx_ROI = find(ROI>0);
[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);
I_ROI = double(I(idx_ROI,:));

t_WC = double(reshape(I0(1666,853,:),[1,3]));

%% algorithms
algos = {'MF','CEM','ACE','SAM'};
AUC_ROC_cell = cell(4);
AUC_PR_cell = cell(4);

%%
figure();h1=axes;hold on; grid on;
PR_line_color={'r','g','b','m'};
axis([0,1,0,1]);
xlabel('Recall');
ylabel('Precision');

figure();h2=axes;hold on;grid on;
axis([0,1,0,1]);
xlabel('False positive rate');
ylabel('True positive rate');


load('WhiteCotnBlood.mat');
GT = ROI_WC;
t_GF = t_WC;

TPR_MF_CEM_ACE_SAM_p0001_WC = zeros(4,1); % p0001 means 0.0001=10^(-4).


for i = 1:length(algos)
    if i == 1  
        clearvars ALGO_image_0
        [MF_score_global] = MF(I_ROI,t_GF');
        if min(MF_score_global)<0
            ALGO_image_0 = 100*min(MF_score_global).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(MF_score_global)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=MF_score_global';
        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

       elseif i ==2
           
            clearvars ALGO_image_0
            CEM_score = CEM(I_ROI,t_GF'); %CEM(I_ROI,t_BCInner');
            if min(CEM_score)<0
                ALGO_image_0 = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(CEM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=CEM_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
          
       elseif i ==3
            clearvars ALGO_image_0
            ACE_score = ACE(I_ROI,t_GF'); %ACE(I_ROI,t_BCInner');
            if min(ACE_score)<0
                ALGO_image_0 = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(ACE_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=ACE_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
           
       elseif i==4
            clearvars ALGO_image_0
            SAM_score = SAM(I_ROI,t_GF'); %SAM(I_ROI,t_BCInner');
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
        ALGO_GT_data = reshape(ALGO_GT,[m*n,1]);
        ALGO_GT_data = ALGO_GT_data(idx_GT);
        ALGO_GT_data = sort(ALGO_GT_data, 'descend');

        % non-bloodstain data
        ALGO_image_0 = reshape(ALGO_image_0, [m*n,1]);
        ALGO_non_GT_data = ALGO_image_0(setdiff(idx_ROI, idx_GT));
        ALGO_non_GT_data = sort(ALGO_non_GT_data,'descend');
          
        %% ROC
        clearvars idx_bigger_than_p0001 idx_smaller_than_p0001 TPR_p0001
        [TPR, FPR] = ROC(ALGO_GT_data, ALGO_non_GT_data );
        idx_bigger_than_p0001 = min(find(FPR>10^(-4)==1));
        idx_smaller_than_p0001 = max(find(FPR<10^(-4)==1));
        if idx_bigger_than_p0001 - idx_smaller_than_p0001 == 1
            TPR_p0001 = interp1([FPR(idx_smaller_than_p0001), FPR(idx_bigger_than_p0001)],[TPR(idx_smaller_than_p0001), TPR(idx_bigger_than_p0001)], 10^(-4), 'linear');
        elseif (isempty(idx_smaller_than_p0001)) && (idx_bigger_than_p0001 == 1)
            % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            [unique_item_FPR, unique_idx_FPR] = unique(FPR(1:10));
            [unique_item_TPR, unique_idx_TPR] = unique(TPR(1:10));
            if (size(unique_idx_FPR,2) == 10) && (size(unique_idx_TPR,2) == 10)
                TPR_p0001 = interp1(FPR(1:10), TPR(1:10), 10^(-4), 'linear', 'extrap'); % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            else
                TPR_p0001 = interp1(FPR(intersect(unique_idx_FPR', unique_idx_TPR')), TPR(intersect(unique_idx_FPR, unique_idx_TPR)), 10^(-4), 'linear', 'extrap');
            end

            if TPR_p0001 < 0
                TPR_p0001 = 0;
            end
        end
        TPR_MF_CEM_ACE_SAM_p0001_WC(i) = TPR_p0001;

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


%%%%%%%%%%%%%%%%%%%%  GF %%%%%%%%%%%
clearvars t_GF I_ROI GT
load('GF.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
idx_ROI = find(ROI>0);
[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);
I_ROI = double(I(idx_ROI,:));

t_GF = double(reshape(I0(641, 1291,:),[1,3]));
%% algorithms
algos = {'MF','CEM','ACE','SAM'};
AUC_ROC_cell = cell(4);
AUC_PR_cell = cell(4);

%%
figure();h1=axes;hold on; grid on;
PR_line_color={'r','g','b','m'};
axis([0,1,0,1]);
xlabel('Recall');
ylabel('Precision');

figure();h2=axes;hold on;grid on;
axis([0,1,0,1]);
xlabel('False positive rate');
ylabel('True positive rate');

load('ROI_GF_bloodFullPixel.mat')  %ROI_GF_bloodFullPixel.mat
GT = ROI_GF_bloodFullPixel;

TPR_MF_CEM_ACE_SAM_p0001_GF = zeros(4,1); % p0001 means 0.0001=10^(-4).


for i = 1:length(algos)
    if i == 1  
        clearvars ALGO_image_0
        [MF_score_global] = MF(I_ROI,t_GF');
        if min(MF_score_global)<0
            ALGO_image_0 = 100*min(MF_score_global).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(MF_score_global)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=MF_score_global';
        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

       elseif i ==2
           
            clearvars ALGO_image_0
            CEM_score = CEM(I_ROI,t_GF'); %CEM(I_ROI,t_BCInner');
            if min(CEM_score)<0
                ALGO_image_0 = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(CEM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=CEM_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
          
       elseif i ==3
            clearvars ALGO_image_0
            ACE_score = ACE(I_ROI,t_GF'); %ACE(I_ROI,t_BCInner');
            if min(ACE_score)<0
                ALGO_image_0 = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(ACE_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=ACE_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
           
       elseif i==4
            clearvars ALGO_image_0
            SAM_score = SAM(I_ROI,t_GF'); %SAM(I_ROI,t_BCInner');
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
        ALGO_GT_data = reshape(ALGO_GT,[m*n,1]);
        ALGO_GT_data = ALGO_GT_data(idx_GT);
        ALGO_GT_data = sort(ALGO_GT_data, 'descend');

        % non-bloodstain data
        ALGO_image_0 = reshape(ALGO_image_0, [m*n,1]);
        ALGO_non_GT_data = ALGO_image_0(setdiff(idx_ROI, idx_GT));
        ALGO_non_GT_data = sort(ALGO_non_GT_data,'descend');
          
        %% ROC
        clearvars idx_bigger_than_p0001 idx_smaller_than_p0001 TPR_p0001
        [TPR, FPR] = ROC(ALGO_GT_data, ALGO_non_GT_data );
        idx_bigger_than_p0001 = min(find(FPR>10^(-4)==1));
        idx_smaller_than_p0001 = max(find(FPR<10^(-4)==1));
        if idx_bigger_than_p0001 - idx_smaller_than_p0001 == 1
            TPR_p0001 = interp1([FPR(idx_smaller_than_p0001), FPR(idx_bigger_than_p0001)],[TPR(idx_smaller_than_p0001), TPR(idx_bigger_than_p0001)], 10^(-4), 'linear');
        elseif (isempty(idx_smaller_than_p0001)) && (idx_bigger_than_p0001 == 1)
            % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            [unique_item_FPR, unique_idx_FPR] = unique(FPR(1:10));
            [unique_item_TPR, unique_idx_TPR] = unique(TPR(1:10));
            if (size(unique_idx_FPR,2) == 10) && (size(unique_idx_TPR,2) == 10)
                TPR_p0001 = interp1(FPR(1:10), TPR(1:10), 10^(-4), 'linear', 'extrap'); % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            else
                TPR_p0001 = interp1(FPR(intersect(unique_idx_FPR', unique_idx_TPR')), TPR(intersect(unique_idx_FPR, unique_idx_TPR)), 10^(-4), 'linear', 'extrap');
            end

            if TPR_p0001 < 0
                TPR_p0001 = 0;
            end
        end
        TPR_MF_CEM_ACE_SAM_p0001_GF(i) = TPR_p0001;

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

%%%%%%%%%%%%%%%%% GRNF %%%%%%%%%%%%%%
clearvars t_GF I_ROI GT
load('GRNF.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
idx_ROI = find(ROI>0);
[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);
I_ROI = double(I(idx_ROI,:));

t_GRNF = double(reshape(I0(1816, 1880,:),[1,3]));
%% algorithms
algos = {'MF','CEM','ACE','SAM'};
AUC_ROC_cell = cell(4);
AUC_PR_cell = cell(4);

%%
figure();h1=axes;hold on; grid on;
PR_line_color={'r','g','b','m'};
axis([0,1,0,1]);
xlabel('Recall');
ylabel('Precision');

figure();h2=axes;hold on;grid on;
axis([0,1,0,1]);
xlabel('False positive rate');
ylabel('True positive rate');

load('GreenFeltBlood.mat');
GT = ROI_GRF;
t_GF = t_GRNF;

TPR_MF_CEM_ACE_SAM_p0001_GRNF = zeros(4,1); % p0001 means 0.0001=10^(-4).


for i = 1:length(algos)
    if i == 1  
        clearvars ALGO_image_0
        [MF_score_global] = MF(I_ROI,t_GF');
        if min(MF_score_global)<0
            ALGO_image_0 = 100*min(MF_score_global).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(MF_score_global)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=MF_score_global';
        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

       elseif i ==2
           
            clearvars ALGO_image_0
            CEM_score = CEM(I_ROI,t_GF'); %CEM(I_ROI,t_BCInner');
            if min(CEM_score)<0
                ALGO_image_0 = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(CEM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=CEM_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
          
       elseif i ==3
            clearvars ALGO_image_0
            ACE_score = ACE(I_ROI,t_GF'); %ACE(I_ROI,t_BCInner');
            if min(ACE_score)<0
                ALGO_image_0 = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(ACE_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=ACE_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
           
       elseif i==4
            clearvars ALGO_image_0
            SAM_score = SAM(I_ROI,t_GF'); %SAM(I_ROI,t_BCInner');
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
        ALGO_GT_data = reshape(ALGO_GT,[m*n,1]);
        ALGO_GT_data = ALGO_GT_data(idx_GT);
        ALGO_GT_data = sort(ALGO_GT_data, 'descend');

        % non-bloodstain data
        ALGO_image_0 = reshape(ALGO_image_0, [m*n,1]);
        ALGO_non_GT_data = ALGO_image_0(setdiff(idx_ROI, idx_GT));
        ALGO_non_GT_data = sort(ALGO_non_GT_data,'descend');
          
        %% ROC 
        clearvars idx_bigger_than_p0001 idx_smaller_than_p0001 TPR_p0001
        [TPR, FPR] = ROC(ALGO_GT_data, ALGO_non_GT_data );
        idx_bigger_than_p0001 = min(find(FPR>10^(-4)==1));
        idx_smaller_than_p0001 = max(find(FPR<10^(-4)==1));
        if idx_bigger_than_p0001 - idx_smaller_than_p0001 == 1
            TPR_p0001 = interp1([FPR(idx_smaller_than_p0001), FPR(idx_bigger_than_p0001)],[TPR(idx_smaller_than_p0001), TPR(idx_bigger_than_p0001)], 10^(-4), 'linear');
        elseif (isempty(idx_smaller_than_p0001)) && (idx_bigger_than_p0001 == 1)
            % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            [unique_item_FPR, unique_idx_FPR] = unique(FPR(1:10));
            [unique_item_TPR, unique_idx_TPR] = unique(TPR(1:10));
            if (size(unique_idx_FPR,2) == 10) && (size(unique_idx_TPR,2) == 10)
                TPR_p0001 = interp1(FPR(1:10), TPR(1:10), 10^(-4), 'linear', 'extrap'); % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            else
                TPR_p0001 = interp1(FPR(intersect(unique_idx_FPR', unique_idx_TPR')), TPR(intersect(unique_idx_FPR, unique_idx_TPR)), 10^(-4), 'linear', 'extrap');
            end

            if TPR_p0001 < 0
                TPR_p0001 = 0;
            end
        end
        TPR_MF_CEM_ACE_SAM_p0001_GRNF(i) = TPR_p0001;

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


%%%%%%%%%%%%%%%%%%  RF %%%%%%%%%%%%%%5
clearvars t_GF I_ROI GT
load('RF.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
idx_ROI = find(ROI>0);
[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);
I_ROI = double(I(idx_ROI,:));

t_RF = double(reshape(I0(759, 1961,:),[1,3]));
%% algorithms
algos = {'MF','CEM','ACE','SAM'};
AUC_ROC_cell = cell(4);
AUC_PR_cell = cell(4);

%%
figure();h1=axes;hold on; grid on;
PR_line_color={'r','g','b','m'};
axis([0,1,0,1]);
xlabel('Recall');
ylabel('Precision');

figure();h2=axes;hold on;grid on;
axis([0,1,0,1]);
xlabel('False positive rate');
ylabel('True positive rate');

load('RedFeltBlood.mat');
GT = ROI_RF;
t_GF = t_RF;

TPR_MF_CEM_ACE_SAM_p0001_RF = zeros(4,1); % p0001 means 0.0001=10^(-4).


for i = 1:length(algos)
    if i == 1  
        clearvars ALGO_image_0
        [MF_score_global] = MF(I_ROI,t_GF');
        if min(MF_score_global)<0
            ALGO_image_0 = 100*min(MF_score_global).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(MF_score_global)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=MF_score_global';
        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

       elseif i ==2
           
            clearvars ALGO_image_0
            CEM_score = CEM(I_ROI,t_GF'); %CEM(I_ROI,t_BCInner');
            if min(CEM_score)<0
                ALGO_image_0 = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(CEM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=CEM_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
          
       elseif i ==3
            clearvars ALGO_image_0
            ACE_score = ACE(I_ROI,t_GF'); %ACE(I_ROI,t_BCInner');
            if min(ACE_score)<0
                ALGO_image_0 = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(ACE_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=ACE_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
           
       elseif i==4
            clearvars ALGO_image_0
            SAM_score = SAM(I_ROI,t_GF'); %SAM(I_ROI,t_BCInner');
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
        ALGO_GT_data = reshape(ALGO_GT,[m*n,1]);
        ALGO_GT_data = ALGO_GT_data(idx_GT);
        ALGO_GT_data = sort(ALGO_GT_data, 'descend');

        % non-bloodstain data
        ALGO_image_0 = reshape(ALGO_image_0, [m*n,1]);
        ALGO_non_GT_data = ALGO_image_0(setdiff(idx_ROI, idx_GT));
        ALGO_non_GT_data = sort(ALGO_non_GT_data,'descend');
          
        %% ROC 
        clearvars idx_bigger_than_p0001 idx_smaller_than_p0001 TPR_p0001
        [TPR, FPR] = ROC(ALGO_GT_data, ALGO_non_GT_data );
        idx_bigger_than_p0001 = min(find(FPR>10^(-4)==1));
        idx_smaller_than_p0001 = max(find(FPR<10^(-4)==1));
        if idx_bigger_than_p0001 - idx_smaller_than_p0001 == 1
            TPR_p0001 = interp1([FPR(idx_smaller_than_p0001), FPR(idx_bigger_than_p0001)],[TPR(idx_smaller_than_p0001), TPR(idx_bigger_than_p0001)], 10^(-4), 'linear');
        elseif (isempty(idx_smaller_than_p0001)) && (idx_bigger_than_p0001 == 1)
            % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            [unique_item_FPR, unique_idx_FPR] = unique(FPR(1:10));
            [unique_item_TPR, unique_idx_TPR] = unique(TPR(1:10));
            if (size(unique_idx_FPR,2) == 10) && (size(unique_idx_TPR,2) == 10)
                TPR_p0001 = interp1(FPR(1:10), TPR(1:10), 10^(-4), 'linear', 'extrap'); % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            else
                TPR_p0001 = interp1(FPR(intersect(unique_idx_FPR', unique_idx_TPR')), TPR(intersect(unique_idx_FPR, unique_idx_TPR)), 10^(-4), 'linear', 'extrap');
            end

            if TPR_p0001 < 0
                TPR_p0001 = 0;
            end
        end
        TPR_MF_CEM_ACE_SAM_p0001_RF(i) = TPR_p0001;

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

%%%%%%%%%%%%%%%% BF %%%%%%%%%%%%%%%
clearvars t_GF I_ROI GT
load('BF.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
idx_ROI = find(ROI>0);
[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);
I_ROI = double(I(idx_ROI,:));

t_BF = double(reshape(I0(976,334,:),[1,3]));
%% algorithms
algos = {'MF','CEM','ACE','SAM'};
AUC_ROC_cell = cell(4);
AUC_PR_cell = cell(4);

%%
figure();h1=axes;hold on; grid on;
PR_line_color={'r','g','b','m'};
axis([0,1,0,1]);
xlabel('Recall');
ylabel('Precision');

figure();h2=axes;hold on;grid on;
axis([0,1,0,1]);
xlabel('False positive rate');
ylabel('True positive rate');

load('BlackFeltBlood.mat');
GT = ROI_BF;
t_GF = t_BF;


TPR_MF_CEM_ACE_SAM_p0001_BF = zeros(4,1); % p0001 means 0.0001=10^(-4).


for i = 1:length(algos)
    if i == 1  
        clearvars ALGO_image_0
        [MF_score_global] = MF(I_ROI,t_GF');
        if min(MF_score_global)<0
            ALGO_image_0 = 100*min(MF_score_global).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(MF_score_global)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=MF_score_global';
        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

       elseif i ==2
           
            clearvars ALGO_image_0
            CEM_score = CEM(I_ROI,t_GF'); %CEM(I_ROI,t_BCInner');
            if min(CEM_score)<0
                ALGO_image_0 = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(CEM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=CEM_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
          
       elseif i ==3
            clearvars ALGO_image_0
            ACE_score = ACE(I_ROI,t_GF'); %ACE(I_ROI,t_BCInner');
            if min(ACE_score)<0
                ALGO_image_0 = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(ACE_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=ACE_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
           
       elseif i==4
            clearvars ALGO_image_0
            SAM_score = SAM(I_ROI,t_GF'); %SAM(I_ROI,t_BCInner');
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
        ALGO_GT_data = reshape(ALGO_GT,[m*n,1]);
        ALGO_GT_data = ALGO_GT_data(idx_GT);
        ALGO_GT_data = sort(ALGO_GT_data, 'descend');

        % non-bloodstain data
        ALGO_image_0 = reshape(ALGO_image_0, [m*n,1]);
        ALGO_non_GT_data = ALGO_image_0(setdiff(idx_ROI, idx_GT));
        ALGO_non_GT_data = sort(ALGO_non_GT_data,'descend');
          
        %% ROC 
        clearvars idx_bigger_than_p0001 idx_smaller_than_p0001 TPR_p0001
        [TPR, FPR] = ROC(ALGO_GT_data, ALGO_non_GT_data );
        idx_bigger_than_p0001 = min(find(FPR>10^(-4)==1));
        idx_smaller_than_p0001 = max(find(FPR<10^(-4)==1));
        if idx_bigger_than_p0001 - idx_smaller_than_p0001 == 1
            TPR_p0001 = interp1([FPR(idx_smaller_than_p0001), FPR(idx_bigger_than_p0001)],[TPR(idx_smaller_than_p0001), TPR(idx_bigger_than_p0001)], 10^(-4), 'linear');
        elseif (isempty(idx_smaller_than_p0001)) && (idx_bigger_than_p0001 == 1)
            % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            [unique_item_FPR, unique_idx_FPR] = unique(FPR(1:10));
            [unique_item_TPR, unique_idx_TPR] = unique(TPR(1:10));
            if (size(unique_idx_FPR,2) == 10) && (size(unique_idx_TPR,2) == 10)
                TPR_p0001 = interp1(FPR(1:10), TPR(1:10), 10^(-4), 'linear', 'extrap'); % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            else
                TPR_p0001 = interp1(FPR(intersect(unique_idx_FPR', unique_idx_TPR')), TPR(intersect(unique_idx_FPR, unique_idx_TPR)), 10^(-4), 'linear', 'extrap');
            end
            
            if TPR_p0001 < 0
                TPR_p0001 = 0;
            end
        end
        TPR_MF_CEM_ACE_SAM_p0001_BF(i) = TPR_p0001;

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

%%%%%%%%%%%%%%%%%  BCInner %%%%%%%%%%%%%55
clearvars t_GF I_ROI GT
load('BCInner.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
idx_ROI = find(ROI>0);
[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);
I_ROI = double(I(idx_ROI,:));

t_BCInner = double(reshape(I0(1400, 2023,:),[1,3]));
%% algorithms
algos = {'MF','CEM','ACE','SAM'};
AUC_ROC_cell = cell(4);
AUC_PR_cell = cell(4);

%%
figure();h1=axes;hold on; grid on;
PR_line_color={'r','g','b','m'};
axis([0,1,0,1]);
xlabel('Recall');
ylabel('Precision');

figure();h2=axes;hold on;grid on;
axis([0,1,0,1]);
xlabel('False positive rate');
ylabel('True positive rate');

load('BlackCotnInnerBlood.mat');
GT = ROI_BCInner;
t_GF = t_BCInner;

TPR_MF_CEM_ACE_SAM_p0001_BCInner = zeros(4,1); % p0001 means 0.0001=10^(-4).

for i = 1:length(algos)
    if i == 1  
        clearvars ALGO_image_0
        [MF_score_global] = MF(I_ROI,t_GF');
        if min(MF_score_global)<0
            ALGO_image_0 = 100*min(MF_score_global).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(MF_score_global)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=MF_score_global';
        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

       elseif i ==2
           
            clearvars ALGO_image_0
            CEM_score = CEM(I_ROI,t_GF'); %CEM(I_ROI,t_BCInner');
            if min(CEM_score)<0
                ALGO_image_0 = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(CEM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=CEM_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
          
       elseif i ==3
            clearvars ALGO_image_0
            ACE_score = ACE(I_ROI,t_GF'); %ACE(I_ROI,t_BCInner');
            if min(ACE_score)<0
                ALGO_image_0 = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(ACE_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=ACE_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
           
       elseif i==4
            clearvars ALGO_image_0
            SAM_score = SAM(I_ROI,t_GF'); %SAM(I_ROI,t_BCInner');
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
        ALGO_GT_data = reshape(ALGO_GT,[m*n,1]);
        ALGO_GT_data = ALGO_GT_data(idx_GT);
        ALGO_GT_data = sort(ALGO_GT_data, 'descend');

        % non-bloodstain data
        ALGO_image_0 = reshape(ALGO_image_0, [m*n,1]);
        ALGO_non_GT_data = ALGO_image_0(setdiff(idx_ROI, idx_GT));
        ALGO_non_GT_data = sort(ALGO_non_GT_data,'descend');
          
        %% ROC 
        clearvars idx_bigger_than_p0001 idx_smaller_than_p0001 TPR_p0001
        [TPR, FPR] = ROC(ALGO_GT_data, ALGO_non_GT_data );
        idx_bigger_than_p0001 = min(find(FPR>10^(-4)==1));
        idx_smaller_than_p0001 = max(find(FPR<10^(-4)==1));
        if idx_bigger_than_p0001 - idx_smaller_than_p0001 == 1
            TPR_p0001 = interp1([FPR(idx_smaller_than_p0001), FPR(idx_bigger_than_p0001)],[TPR(idx_smaller_than_p0001), TPR(idx_bigger_than_p0001)], 10^(-4), 'linear');
        elseif (isempty(idx_smaller_than_p0001)) && (idx_bigger_than_p0001 == 1)
            % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            [unique_item_FPR, unique_idx_FPR] = unique(FPR(1:10));
            [unique_item_TPR, unique_idx_TPR] = unique(TPR(1:10));
            if (size(unique_idx_FPR,2) == 10) && (size(unique_idx_TPR,2) == 10)
                TPR_p0001 = interp1(FPR(1:10), TPR(1:10), 10^(-4), 'linear', 'extrap'); % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            else
                TPR_p0001 = interp1(FPR(intersect(unique_idx_FPR', unique_idx_TPR')), TPR(intersect(unique_idx_FPR, unique_idx_TPR)), 10^(-4), 'linear', 'extrap');
            end
            
            if TPR_p0001 < 0
                TPR_p0001 = 0;
            end
        end
        TPR_MF_CEM_ACE_SAM_p0001_BCInner(i) = TPR_p0001;

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

%%%%%%%%%%%%%%%%%% BCMid %%%%%%%%%%%%%%%%%%
clearvars t_GF I_ROI GT
load('BCmid.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
idx_ROI = find(ROI>0);
[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);
I_ROI = double(I(idx_ROI,:));

t_BCMid = double(reshape(I0(1079, 2547,:),[1,3]));

%% algorithms
algos = {'MF','CEM','ACE','SAM'};
AUC_ROC_cell = cell(4);
AUC_PR_cell = cell(4);

%%
figure();h1=axes;hold on; grid on;
PR_line_color={'r','g','b','m'};
axis([0,1,0,1]);
xlabel('Recall');
ylabel('Precision');

figure();h2=axes;hold on;grid on;
axis([0,1,0,1]);
xlabel('False positive rate');
ylabel('True positive rate');

load('BlackCotnMidBlood.mat');
GT = ROI_BCMid;
t_GF = t_BCMid;

TPR_MF_CEM_ACE_SAM_p0001_BCMid = zeros(4,1); % p0001 means 0.0001=10^(-4).

for i = 1:length(algos)
    if i == 1  
        clearvars ALGO_image_0
        [MF_score_global] = MF(I_ROI,t_GF');
        if min(MF_score_global)<0
            ALGO_image_0 = 100*min(MF_score_global).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(MF_score_global)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=MF_score_global';
        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

       elseif i ==2
           
            clearvars ALGO_image_0
            CEM_score = CEM(I_ROI,t_GF'); %CEM(I_ROI,t_BCInner');
            if min(CEM_score)<0
                ALGO_image_0 = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(CEM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=CEM_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
          
       elseif i ==3
            clearvars ALGO_image_0
            ACE_score = ACE(I_ROI,t_GF'); %ACE(I_ROI,t_BCInner');
            if min(ACE_score)<0
                ALGO_image_0 = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(ACE_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=ACE_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
           
       elseif i==4
            clearvars ALGO_image_0
            SAM_score = SAM(I_ROI,t_GF'); %SAM(I_ROI,t_BCInner');
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
        ALGO_GT_data = reshape(ALGO_GT,[m*n,1]);
        ALGO_GT_data = ALGO_GT_data(idx_GT);
        ALGO_GT_data = sort(ALGO_GT_data, 'descend');

        % non-bloodstain data
        ALGO_image_0 = reshape(ALGO_image_0, [m*n,1]);
        ALGO_non_GT_data = ALGO_image_0(setdiff(idx_ROI, idx_GT));
        ALGO_non_GT_data = sort(ALGO_non_GT_data,'descend');
          
        %% ROC 
        clearvars idx_bigger_than_p0001 idx_smaller_than_p0001 TPR_p0001
        [TPR, FPR] = ROC(ALGO_GT_data, ALGO_non_GT_data );
        idx_bigger_than_p0001 = min(find(FPR>10^(-4)==1));
        idx_smaller_than_p0001 = max(find(FPR<10^(-4)==1));
        if idx_bigger_than_p0001 - idx_smaller_than_p0001 == 1
            TPR_p0001 = interp1([FPR(idx_smaller_than_p0001), FPR(idx_bigger_than_p0001)],[TPR(idx_smaller_than_p0001), TPR(idx_bigger_than_p0001)], 10^(-4), 'linear');
        elseif (isempty(idx_smaller_than_p0001)) && (idx_bigger_than_p0001 == 1)
            [unique_item_FPR, unique_idx_FPR] = unique(FPR(1:10));
            [unique_item_TPR, unique_idx_TPR] = unique(TPR(1:10));
            if (size(unique_idx_FPR,2) == 10) && (size(unique_idx_TPR,2) == 10)
                TPR_p0001 = interp1(FPR(1:10), TPR(1:10), 10^(-4), 'linear', 'extrap'); % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            else
                TPR_p0001 = interp1(FPR(intersect(unique_idx_FPR', unique_idx_TPR')), TPR(intersect(unique_idx_FPR, unique_idx_TPR)), 10^(-4), 'linear', 'extrap');
            end
            
            if TPR_p0001 < 0
                TPR_p0001 = 0;
            end
        end
        TPR_MF_CEM_ACE_SAM_p0001_BCMid(i) = TPR_p0001;

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



%%%%%%%%%%%%%%%%% BCOutter %%%%%%%%%%%%%5%
clearvars t_GF I_ROI GT
load('BCOutter.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
idx_ROI = find(ROI>0);
[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);
I_ROI = double(I(idx_ROI,:));

 t_BCOutter = double(reshape(I0(868, 2949,:),[1,3]));
%% algorithms
algos = {'MF','CEM','ACE','SAM'};
AUC_ROC_cell = cell(4);
AUC_PR_cell = cell(4);

%%
figure();h1=axes;hold on; grid on;
PR_line_color={'r','g','b','m'};
axis([0,1,0,1]);
xlabel('Recall');
ylabel('Precision');

figure();h2=axes;hold on;grid on;
axis([0,1,0,1]);
xlabel('False positive rate');
ylabel('True positive rate');

load('BlackCotnOutterBlood.mat');
GT = ROI_BCOutter;
t_GF = t_BCOutter;

TPR_MF_CEM_ACE_SAM_p0001_BCOutter = zeros(4,1); % p0001 means 0.0001=10^(-4).

for i = 1:length(algos)
    if i == 1  
        clearvars ALGO_image_0
        [MF_score_global] = MF(I_ROI,t_GF');
        if min(MF_score_global)<0
            ALGO_image_0 = 100*min(MF_score_global).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(MF_score_global)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=MF_score_global';
        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

       elseif i ==2
           
            clearvars ALGO_image_0
            CEM_score = CEM(I_ROI,t_GF'); %CEM(I_ROI,t_BCInner');
            if min(CEM_score)<0
                ALGO_image_0 = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(CEM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=CEM_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
          
       elseif i ==3
            clearvars ALGO_image_0
            ACE_score = ACE(I_ROI,t_GF'); %ACE(I_ROI,t_BCInner');
            if min(ACE_score)<0
                ALGO_image_0 = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(ACE_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=ACE_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
           
       elseif i==4
            clearvars ALGO_image_0
            SAM_score = SAM(I_ROI,t_GF'); %SAM(I_ROI,t_BCInner');
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
        ALGO_GT_data = reshape(ALGO_GT,[m*n,1]);
        ALGO_GT_data = ALGO_GT_data(idx_GT);
        ALGO_GT_data = sort(ALGO_GT_data, 'descend');

        % non-bloodstain data
        ALGO_image_0 = reshape(ALGO_image_0, [m*n,1]);
        ALGO_non_GT_data = ALGO_image_0(setdiff(idx_ROI, idx_GT));
        ALGO_non_GT_data = sort(ALGO_non_GT_data,'descend');
          
        %% ROC 
        clearvars idx_bigger_than_p0001 idx_smaller_than_p0001 TPR_p0001
        [TPR, FPR] = ROC(ALGO_GT_data, ALGO_non_GT_data );
        idx_bigger_than_p0001 = min(find(FPR>10^(-4)==1));
        idx_smaller_than_p0001 = max(find(FPR<10^(-4)==1));
        if idx_bigger_than_p0001 - idx_smaller_than_p0001 == 1
            TPR_p0001 = interp1([FPR(idx_smaller_than_p0001), FPR(idx_bigger_than_p0001)],[TPR(idx_smaller_than_p0001), TPR(idx_bigger_than_p0001)], 10^(-4), 'linear');
        elseif (isempty(idx_smaller_than_p0001)) && (idx_bigger_than_p0001 == 1)
      [unique_item_FPR, unique_idx_FPR] = unique(FPR(1:10));
            [unique_item_TPR, unique_idx_TPR] = unique(TPR(1:10));
            if (size(unique_idx_FPR,2) == 10) && (size(unique_idx_TPR,2) == 10)
                TPR_p0001 = interp1(FPR(1:10), TPR(1:10), 10^(-4), 'linear', 'extrap'); % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            else
                TPR_p0001 = interp1(FPR(intersect(unique_idx_FPR', unique_idx_TPR')), TPR(intersect(unique_idx_FPR, unique_idx_TPR)), 10^(-4), 'linear', 'extrap');
            end
            
            if TPR_p0001 < 0
                TPR_p0001 = 0;
            end
        end
        TPR_MF_CEM_ACE_SAM_p0001_BCOutter(i) = TPR_p0001;

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

%%%%%%%%%%%%%%%%%%% Jeans %%%%%%%%%%%%%%%%
clearvars t_GF I_ROI GT
load('J.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
idx_ROI = find(ROI>0);
[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);
I_ROI = double(I(idx_ROI,:));

t_J = double(reshape(I0(1762, 1338,:),[1,3]));

%% algorithms
algos = {'MF','CEM','ACE','SAM'};
AUC_ROC_cell = cell(4);
AUC_PR_cell = cell(4);

%%
figure();h1=axes;hold on; grid on;
PR_line_color={'r','g','b','m'};
axis([0,1,0,1]);
xlabel('Recall');
ylabel('Precision');

figure();h2=axes;hold on;grid on;
axis([0,1,0,1]);
xlabel('False positive rate');
ylabel('True positive rate');

load('JeanBlood.mat');
GT = ROI_J;
t_GF = t_J;

TPR_MF_CEM_ACE_SAM_p0001_Jeans = zeros(4,1); % p0001 means 0.0001=10^(-4).

for i = 1:length(algos)
    if i == 1  
        clearvars ALGO_image_0
        [MF_score_global] = MF(I_ROI,t_GF');
        if min(MF_score_global)<0
            ALGO_image_0 = 100*min(MF_score_global).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(MF_score_global)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=MF_score_global';
        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

       elseif i ==2
           
            clearvars ALGO_image_0
            CEM_score = CEM(I_ROI,t_GF'); %CEM(I_ROI,t_BCInner');
            if min(CEM_score)<0
                ALGO_image_0 = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(CEM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=CEM_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
          
       elseif i ==3
            clearvars ALGO_image_0
            ACE_score = ACE(I_ROI,t_GF'); %ACE(I_ROI,t_BCInner');
            if min(ACE_score)<0
                ALGO_image_0 = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(ACE_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=ACE_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
           
       elseif i==4
            clearvars ALGO_image_0
            SAM_score = SAM(I_ROI,t_GF'); %SAM(I_ROI,t_BCInner');
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
        ALGO_GT_data = reshape(ALGO_GT,[m*n,1]);
        ALGO_GT_data = ALGO_GT_data(idx_GT);
        ALGO_GT_data = sort(ALGO_GT_data, 'descend');

        % non-bloodstain data
        ALGO_image_0 = reshape(ALGO_image_0, [m*n,1]);
        ALGO_non_GT_data = ALGO_image_0(setdiff(idx_ROI, idx_GT));
        ALGO_non_GT_data = sort(ALGO_non_GT_data,'descend');
          
        %% ROC 
        clearvars idx_bigger_than_p0001 idx_smaller_than_p0001 TPR_p0001
        [TPR, FPR] = ROC(ALGO_GT_data, ALGO_non_GT_data );
        idx_bigger_than_p0001 = min(find(FPR>10^(-4)==1));
        idx_smaller_than_p0001 = max(find(FPR<10^(-4)==1));
        if idx_bigger_than_p0001 - idx_smaller_than_p0001 == 1
            TPR_p0001 = interp1([FPR(idx_smaller_than_p0001), FPR(idx_bigger_than_p0001)],[TPR(idx_smaller_than_p0001), TPR(idx_bigger_than_p0001)], 10^(-4), 'linear');
        elseif (isempty(idx_smaller_than_p0001)) && (idx_bigger_than_p0001 == 1)
            [unique_item_FPR, unique_idx_FPR] = unique(FPR(1:10));
            [unique_item_TPR, unique_idx_TPR] = unique(TPR(1:10));
            if (size(unique_idx_FPR,2) == 10) && (size(unique_idx_TPR,2) == 10)
                TPR_p0001 = interp1(FPR(1:10), TPR(1:10), 10^(-4), 'linear', 'extrap'); % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            else
                TPR_p0001 = interp1(FPR(intersect(unique_idx_FPR', unique_idx_TPR')), TPR(intersect(unique_idx_FPR, unique_idx_TPR)), 10^(-4), 'linear', 'extrap');
            end

            if TPR_p0001 < 0
                TPR_p0001 = 0;
            end
        end
        TPR_MF_CEM_ACE_SAM_p0001_Jeans(i) = TPR_p0001;

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

%%%%%%%%%%%%%%%%%%%% Wood %%%%%%%%%%%%%
clearvars t_GF I_ROI GT
load('WOOD.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, RF.mat, J.mat, WC.mat, WOOD.mat   
idx_ROI = find(ROI>0);
[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);
I_ROI = double(I(idx_ROI,:));

t_W = double(reshape(I0(1685,470,:),[1,3]));
%% algorithms
algos = {'MF','CEM','ACE','SAM'};
AUC_ROC_cell = cell(4);
AUC_PR_cell = cell(4);

%%
figure();h1=axes;hold on; grid on;
PR_line_color={'r','g','b','m'};
axis([0,1,0,1]);
xlabel('Recall');
ylabel('Precision');

figure();h2=axes;hold on;grid on;
axis([0,1,0,1]);
xlabel('False positive rate');
ylabel('True positive rate');

load('WoodBlood.mat');
GT = ROI_W;
t_GF = t_W;

TPR_MF_CEM_ACE_SAM_p0001_Wood = zeros(4,1); % p0001 means 0.0001=10^(-4).

for i = 1:length(algos)
    if i == 1  
        clearvars ALGO_image_0
        [MF_score_global] = MF(I_ROI,t_GF');
        if min(MF_score_global)<0
            ALGO_image_0 = 100*min(MF_score_global).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
            else ALGO_image_0 = (-100 + min(MF_score_global)).*ones(m*n,1);
        end
        % store scores to the ROI region
        ALGO_image_0(idx_ROI)=MF_score_global';
        ALGO_image_0 = reshape(ALGO_image_0,[m,n]);

       elseif i ==2
           
            clearvars ALGO_image_0
            CEM_score = CEM(I_ROI,t_GF'); %CEM(I_ROI,t_BCInner');
            if min(CEM_score)<0
                ALGO_image_0 = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(CEM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=CEM_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
          
       elseif i ==3
            clearvars ALGO_image_0
            ACE_score = ACE(I_ROI,t_GF'); %ACE(I_ROI,t_BCInner');
            if min(ACE_score)<0
                ALGO_image_0 = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(ACE_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=ACE_score';

            ALGO_image_0 = reshape(ALGO_image_0,[m,n]);
           
       elseif i==4
            clearvars ALGO_image_0
            SAM_score = SAM(I_ROI,t_GF'); %SAM(I_ROI,t_BCInner');
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
        ALGO_GT_data = reshape(ALGO_GT,[m*n,1]);
        ALGO_GT_data = ALGO_GT_data(idx_GT);
        ALGO_GT_data = sort(ALGO_GT_data, 'descend');

        % non-bloodstain data
        ALGO_image_0 = reshape(ALGO_image_0, [m*n,1]);
        ALGO_non_GT_data = ALGO_image_0(setdiff(idx_ROI, idx_GT));
        ALGO_non_GT_data = sort(ALGO_non_GT_data,'descend');
          
        %% ROC 
        clearvars idx_bigger_than_p0001 idx_smaller_than_p0001 TPR_p0001
        [TPR, FPR] = ROC(ALGO_GT_data, ALGO_non_GT_data );
        idx_bigger_than_p0001 = min(find(FPR>10^(-4)==1));
        idx_smaller_than_p0001 = max(find(FPR<10^(-4)==1));
        if idx_bigger_than_p0001 - idx_smaller_than_p0001 == 1
            TPR_p0001 = interp1([FPR(idx_smaller_than_p0001), FPR(idx_bigger_than_p0001)],[TPR(idx_smaller_than_p0001), TPR(idx_bigger_than_p0001)], 10^(-4), 'linear');
        elseif (isempty(idx_smaller_than_p0001)) && (idx_bigger_than_p0001 == 1)
            [unique_item_FPR, unique_idx_FPR] = unique(FPR(1:10));
            [unique_item_TPR, unique_idx_TPR] = unique(TPR(1:10));
            if (size(unique_idx_FPR,2) == 10) && (size(unique_idx_TPR,2) == 10)
                TPR_p0001 = interp1(FPR(1:10), TPR(1:10), 10^(-4), 'linear', 'extrap'); % use the smallest 10 data, to avoid sometimes the whole FPR and TPR are not unique, since interp1 requires both TPR and FPR arrays to be uniqe.
            else
                TPR_p0001 = interp1(FPR(intersect(unique_idx_FPR', unique_idx_TPR')), TPR(intersect(unique_idx_FPR, unique_idx_TPR)), 10^(-4), 'linear', 'extrap');
            end


            if TPR_p0001 < 0
                TPR_p0001 = 0;
            end
        end
        TPR_MF_CEM_ACE_SAM_p0001_Wood(i) = TPR_p0001;

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

%% AUC PR stats, records each run
% 'MF','CEM','ACE','SAM'

AUC_PR_WP = [0.9138 0.0850 0.6240 0.8759];
AUC_PR_WC= [0.7187 0.0040 0.1984 0.5090];
AUC_PR_GF = [0.8799 0.3986 0.5092 0.7780];
AUC_PR_GRNF = [0.6156 0.0052 0.1487 0.2341];
AUC_PR_RF = [0.9790 0.0065 0.3262 0.9606];
AUC_PR_BF = [0.0080 0.0085 0.0093 0.0086];
AUC_PR_BCInner =[0.9063 0.0102 0.4225 0.3375];
AUC_PR_BCMid = [0.8772 0.0061 0.2093 0.3274];
AUC_PR_BCOutter = [0.9019 0.0093 0.2853 0.3208];
AUC_PR_Jeans = [0.9584 0.0112 0.6938 0.9147];
AUC_PR_Wood = [0.8533 0.0277 0.2030 0.8608];
% WP, WC, GF, GRNF, RF, BF,BCInner, BCMid, BCOutter, Jeans, Wood
AUC_PR_MF_list = [AUC_PR_WP(1) AUC_PR_WC(1) AUC_PR_GF(1) AUC_PR_GRNF(1) AUC_PR_RF(1) AUC_PR_BF(1) AUC_PR_BCInner(1) AUC_PR_BCMid(1) AUC_PR_BCOutter(1) AUC_PR_Jeans(1) AUC_PR_Wood(1)];
AUC_PR_CEM_list = [AUC_PR_WP(2) AUC_PR_WC(2) AUC_PR_GF(2) AUC_PR_GRNF(2) AUC_PR_RF(2) AUC_PR_BF(2) AUC_PR_BCInner(2) AUC_PR_BCMid(2) AUC_PR_BCOutter(2) AUC_PR_Jeans(2) AUC_PR_Wood(2)];
AUC_PR_ACE_list = [AUC_PR_WP(3) AUC_PR_WC(3) AUC_PR_GF(3) AUC_PR_GRNF(3) AUC_PR_RF(3) AUC_PR_BF(3) AUC_PR_BCInner(3) AUC_PR_BCMid(3) AUC_PR_BCOutter(3) AUC_PR_Jeans(3) AUC_PR_Wood(3)];
AUC_PR_SAM_list = [AUC_PR_WP(4) AUC_PR_WC(4) AUC_PR_GF(4) AUC_PR_GRNF(4) AUC_PR_RF(4) AUC_PR_BF(4) AUC_PR_BCInner(4) AUC_PR_BCMid(4) AUC_PR_BCOutter(4) AUC_PR_Jeans(4) AUC_PR_Wood(4)];

AUC_PR = [AUC_PR_MF_list; AUC_PR_CEM_list; AUC_PR_ACE_list; AUC_PR_SAM_list];

MF_x = {'MF-WP','MF-WC','MF-GF','MF-GRNF','MF-RF','MF-BF','MF-BCInner','MF-BCMid','MF-BCOutter','MF-Jeans','MF-Wood'};
CEM_x = {'CEM-WP','CEM-WC','CEM-GF','CEM-GRNF','CEM-RF','CEM-BF','CEM-BCInner','CEM-BCMid','CEM-BCOutter','CEM-Jeans','CEM-Wood'};
ACE_x = {'ACE-WP','ACE-WC','ACE-GF','ACE-GRNF','ACE-RF','ACE-BF','ACE-BCInner','ACE-BCMid','ACE-BCOutter','ACE-Jeans','ACE-Wood'};
SAM_x = {'SAM-WP','SAM-WC','SAM-GF','SAM-GRNF','SAM-RF','SAM-BF','SAM-BCInner','SAM-BCMid','SAM-BCOutter','SAM-Jeans','SAM-Wood'};
%x = [MF_x; CEM_x; ACE_x; SAM_x];
%X = categorical(x);
%X = reordercats(X, x);

X = categorical({'MF','CEM','ACE','SAM'});
X = reordercats(X, {'MF','CEM','ACE','SAM'});

figure
b = bar(X, AUC_PR, 'FaceColor', 'flat');

RGBTriplet_blue = [0 0.4470 0.7410];
RGBTriplet_red = [0.8500 0.3250 0.0980];
RGBTriplet_orange = [0.9290 0.6940 0.1250];
RGBTriplet_green= [0.4660 0.6740 0.1880];

b(1).CData(1,:) = RGBTriplet_blue; 
b(2).CData(1,:) = RGBTriplet_blue;
b(3).CData(1,:) = RGBTriplet_blue;
b(4).CData(1,:) = RGBTriplet_blue;
b(5).CData(1,:) = RGBTriplet_blue;
b(6).CData(1,:) = RGBTriplet_blue;
b(7).CData(1,:) = RGBTriplet_blue;
b(8).CData(1,:) = RGBTriplet_blue;
b(9).CData(1,:) = RGBTriplet_blue;
b(10).CData(1,:) = RGBTriplet_blue;
b(11).CData(1,:) = RGBTriplet_blue;


b(1).CData(2,:) = RGBTriplet_red;
b(2).CData(2,:) = RGBTriplet_red;
b(3).CData(2,:) = RGBTriplet_red;
b(4).CData(2,:) = RGBTriplet_red;
b(5).CData(2,:) = RGBTriplet_red;
b(6).CData(2,:) = RGBTriplet_red;
b(7).CData(2,:) = RGBTriplet_red;
b(8).CData(2,:) = RGBTriplet_red;
b(9).CData(2,:) = RGBTriplet_red;
b(10).CData(2,:) = RGBTriplet_red;
b(11).CData(2,:) = RGBTriplet_red;


b(1).CData(3,:) = RGBTriplet_orange; 
b(2).CData(3,:) = RGBTriplet_orange;
b(3).CData(3,:) = RGBTriplet_orange; 
b(4).CData(3,:) = RGBTriplet_orange; 
b(5).CData(3,:) = RGBTriplet_orange; 
b(6).CData(3,:) = RGBTriplet_orange; 
b(7).CData(3,:) = RGBTriplet_orange; 
b(8).CData(3,:) = RGBTriplet_orange; 
b(9).CData(3,:) = RGBTriplet_orange; 
b(10).CData(3,:) = RGBTriplet_orange; 
b(11).CData(3,:) = RGBTriplet_orange; 


b(1).CData(4,:) = RGBTriplet_green;
b(2).CData(4,:) = RGBTriplet_green;
b(3).CData(4,:) = RGBTriplet_green;
b(4).CData(4,:) = RGBTriplet_green;
b(5).CData(4,:) = RGBTriplet_green;
b(6).CData(4,:) = RGBTriplet_green;
b(7).CData(4,:) = RGBTriplet_green;
b(8).CData(4,:) = RGBTriplet_green;
b(9).CData(4,:) = RGBTriplet_green;
b(10).CData(4,:) = RGBTriplet_green;
b(11).CData(4,:) = RGBTriplet_green;
grid on;

%%%%%%%%%%%%%%%%%%%%%55  TPR_pp0001 %%%%%%%%%%%%%%%%%%%
TPR_p0001_MF_list = [TPR_MF_CEM_ACE_SAM_p0001_WP(1) TPR_MF_CEM_ACE_SAM_p0001_WC(1) TPR_MF_CEM_ACE_SAM_p0001_GF(1) TPR_MF_CEM_ACE_SAM_p0001_GRNF(1) TPR_MF_CEM_ACE_SAM_p0001_RF(1) ,...
    TPR_MF_CEM_ACE_SAM_p0001_BF(1) TPR_MF_CEM_ACE_SAM_p0001_BCInner(1) TPR_MF_CEM_ACE_SAM_p0001_BCMid(1) TPR_MF_CEM_ACE_SAM_p0001_BCOutter(1) TPR_MF_CEM_ACE_SAM_p0001_Jeans(1) TPR_MF_CEM_ACE_SAM_p0001_Wood(1)];

TPR_p0001_CEM_list = [TPR_MF_CEM_ACE_SAM_p0001_WP(2) TPR_MF_CEM_ACE_SAM_p0001_WC(2) TPR_MF_CEM_ACE_SAM_p0001_GF(2) TPR_MF_CEM_ACE_SAM_p0001_GRNF(2) TPR_MF_CEM_ACE_SAM_p0001_RF(2) ,...
    TPR_MF_CEM_ACE_SAM_p0001_BF(2) TPR_MF_CEM_ACE_SAM_p0001_BCInner(2) TPR_MF_CEM_ACE_SAM_p0001_BCMid(2) TPR_MF_CEM_ACE_SAM_p0001_BCOutter(2) TPR_MF_CEM_ACE_SAM_p0001_Jeans(2) TPR_MF_CEM_ACE_SAM_p0001_Wood(2)];

TPR_p0001_ACE_list = [TPR_MF_CEM_ACE_SAM_p0001_WP(3) TPR_MF_CEM_ACE_SAM_p0001_WC(3) TPR_MF_CEM_ACE_SAM_p0001_GF(3) TPR_MF_CEM_ACE_SAM_p0001_GRNF(3) TPR_MF_CEM_ACE_SAM_p0001_RF(3) ,...
    TPR_MF_CEM_ACE_SAM_p0001_BF(3) TPR_MF_CEM_ACE_SAM_p0001_BCInner(3) TPR_MF_CEM_ACE_SAM_p0001_BCMid(3) TPR_MF_CEM_ACE_SAM_p0001_BCOutter(3) TPR_MF_CEM_ACE_SAM_p0001_Jeans(3) TPR_MF_CEM_ACE_SAM_p0001_Wood(3)];

TPR_p0001_SAM_list = [TPR_MF_CEM_ACE_SAM_p0001_WP(4) TPR_MF_CEM_ACE_SAM_p0001_WC(4) TPR_MF_CEM_ACE_SAM_p0001_GF(4) TPR_MF_CEM_ACE_SAM_p0001_GRNF(4) TPR_MF_CEM_ACE_SAM_p0001_RF(4) ,...
    TPR_MF_CEM_ACE_SAM_p0001_BF(4) TPR_MF_CEM_ACE_SAM_p0001_BCInner(4) TPR_MF_CEM_ACE_SAM_p0001_BCMid(4) TPR_MF_CEM_ACE_SAM_p0001_BCOutter(4) TPR_MF_CEM_ACE_SAM_p0001_Jeans(4) TPR_MF_CEM_ACE_SAM_p0001_Wood(4)];

TPR_p0001_MF_CEM_ACE_SAM_all = [TPR_p0001_MF_list; TPR_p0001_CEM_list; TPR_p0001_ACE_list; TPR_p0001_SAM_list];

X = categorical({'MF','CEM','ACE','SAM'});
X = reordercats(X, {'MF','CEM','ACE','SAM'});
figure
b = bar(X, TPR_p0001_MF_CEM_ACE_SAM_all, 'FaceColor', 'flat');

RGBTriplet_blue = [0 0.4470 0.7410];
RGBTriplet_red = [0.8500 0.3250 0.0980];
RGBTriplet_orange = [0.9290 0.6940 0.1250];
RGBTriplet_green= [0.4660 0.6740 0.1880];

b(1).CData(1,:) = RGBTriplet_blue; 
b(2).CData(1,:) = RGBTriplet_blue;
b(3).CData(1,:) = RGBTriplet_blue;
b(4).CData(1,:) = RGBTriplet_blue;
b(5).CData(1,:) = RGBTriplet_blue;
b(6).CData(1,:) = RGBTriplet_blue;
b(7).CData(1,:) = RGBTriplet_blue;
b(8).CData(1,:) = RGBTriplet_blue;
b(9).CData(1,:) = RGBTriplet_blue;
b(10).CData(1,:) = RGBTriplet_blue;
b(11).CData(1,:) = RGBTriplet_blue;


b(1).CData(2,:) = RGBTriplet_red;
b(2).CData(2,:) = RGBTriplet_red;
b(3).CData(2,:) = RGBTriplet_red;
b(4).CData(2,:) = RGBTriplet_red;
b(5).CData(2,:) = RGBTriplet_red;
b(6).CData(2,:) = RGBTriplet_red;
b(7).CData(2,:) = RGBTriplet_red;
b(8).CData(2,:) = RGBTriplet_red;
b(9).CData(2,:) = RGBTriplet_red;
b(10).CData(2,:) = RGBTriplet_red;
b(11).CData(2,:) = RGBTriplet_red;


b(1).CData(3,:) = RGBTriplet_orange; 
b(2).CData(3,:) = RGBTriplet_orange;
b(3).CData(3,:) = RGBTriplet_orange; 
b(4).CData(3,:) = RGBTriplet_orange; 
b(5).CData(3,:) = RGBTriplet_orange; 
b(6).CData(3,:) = RGBTriplet_orange; 
b(7).CData(3,:) = RGBTriplet_orange; 
b(8).CData(3,:) = RGBTriplet_orange; 
b(9).CData(3,:) = RGBTriplet_orange; 
b(10).CData(3,:) = RGBTriplet_orange; 
b(11).CData(3,:) = RGBTriplet_orange; 


b(1).CData(4,:) = RGBTriplet_green;
b(2).CData(4,:) = RGBTriplet_green;
b(3).CData(4,:) = RGBTriplet_green;
b(4).CData(4,:) = RGBTriplet_green;
b(5).CData(4,:) = RGBTriplet_green;
b(6).CData(4,:) = RGBTriplet_green;
b(7).CData(4,:) = RGBTriplet_green;
b(8).CData(4,:) = RGBTriplet_green;
b(9).CData(4,:) = RGBTriplet_green;
b(10).CData(4,:) = RGBTriplet_green;
b(11).CData(4,:) = RGBTriplet_green;
grid on;ylim([0.0 1.0])



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
y = [10 15 20; 30 35 20; 10 20 20];
b = bar(y, 'FaceColor','flat');

b(1).CData(1,:) = [0 1 1];
b(2).CData(1,:) = [0 1 1];
b(3).CData(1,:) = [0 1 1];


b(1).CData(2,:) = [1 0 0];
b(2).CData(2,:) = [1 0 0];
b(3).CData(2,:) = [1 0 0];

b(1).CData(3,:) = [0 0 1];
b(2).CData(3,:) = [0 0 1];
b(3).CData(3,:) = [0 0 1];

figure
y = [10 15; 30 35; 10 20];
b = bar(y);
b(1).FaceColor = 'flat';
b(1).CData(1,:) = [0 1 1];
b(2).CData(1,:) = [0 1 1];


b(2).FaceColor = 'flat';
b(1).CData(2,:) = [1 0 0];
b(2).CData(2,:) = [1 0 0];

%b(3).FaceColor = 'flat';
b(1).CData(3,:) = [0 0 1];
b(2).CData(3,:) = [0 0 1];


%%%%%%%%%%%%%%%%%%%%%%%%  AoV %%%%%%%%%%%%%%%%%%%5

