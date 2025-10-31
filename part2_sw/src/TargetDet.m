
clear all; close all;clc;
% TARGETdEC performs target detection algorithms on original image, ROI on
% image.

%   This function can change target detection algorithms, background
%   cluster pixels.

% I0 image path
path_img = '../data/20180212/image processing2/';
addpath(path_img);
%fileIm = dir(fullfile(path,'I_GF.bmp'));
fileIm = dir(fullfile(path_img, '02122018_correct_R690G550B850_FalseColorWithChromAbr_com.bmp'));
I0 = fullfile(path_img, fileIm.name);
I0 = imread(I0);figure();imshow(I0,[]);title('Original Image')

%% subset of image, load image mat
%load('BlackCotnInnerBlood.mat')
%figure,imshow(ROI_BCInner,[])
%load('blood_BCInner_data.mat')
%addpath('D:\JieThesisLastWork\algorithmEvaluation\ROI');
%load('ROI_BF.mat')

%% Subset of image
% Black cotton including three positions
%ROI = image_subsetting(I0,1);
%load('BCInner.mat') %J.mat
%save('Wood.mat','ROI')

path_data = '../data/';
addpath(path_data);
load('GF.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, 
figure,imshow(ROI,[0,1]);
%load('ROI_GF_less_bckgrd.mat')
%figure,imshow(ROI_GF_less_bckgrd,[])
%reshape image

%{
ROI_GF_less_bckgrd_R = double(ROI_GF_less_bckgrd).*double(I0(:,:,1));
figure,imshow(uint8(ROI_GF_less_bckgrd_R),[])

figure();imshow(ROI_GF_less_bckgrd,[0,1]);title('ROI')
ROI = ROI_GF_less_bckgrd;
%}

idx_ROI = find(ROI>0);

[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);

% selected ROI on image.
I_ROI = double(I(idx_ROI,:));

figure,histogram(I_ROI(:,1),"BinWidth",1 ), title("1st channel");ylim([0 100])
figure,histogram(I_ROI(:,2),"BinWidth",1 ), title("2nd channel");ylim([0 100])
figure,histogram(I_ROI(:,3),"BinWidth",1 ), title("3rd channel");ylim([0 100])
%{
%% kmeans clustering
% initianization
cate=3;

[idx5, C, sumdist3]=kmeans(I_ROI,5,'Distance', 'cityblock',...
                            'Display', 'final');
                        
%}
%% ground truth
%load('GrayFeltBlood.mat');%BlackCotnOutterBlood.mat, BlackCotnMidBlood, BlackFeltBlood, WhitePolyBlood.mat, GrayFeltBlood, GreenFeltBlood, JeanBlood, RedFeltBlood,WhiteCotnBlood,WoodBlood  
%figure,imshow(ROI_GF)
%figure,imshow(ROI_GF,[]) %ROI_BCInner, ROI_WP, 

% GT without sub-pixels
%ROI_GF_bloodFullPixel = image_subsetting(I0,1);
%save('ROI_GF_bloodFullPixel.mat','ROI_GF_bloodFullPixel')
%load('ROI_GF_bloodFullandSubPixel.mat')  %ROI_GF_bloodFullPixel.mat
load('ROI_GF_bloodFullPixel.mat')
figure,imshow(ROI_GF_bloodFullPixel, [])

%figure,imshow(ROI_GF_bloodFullandSubPixel,[])

%idx_ROI_GF_bloodFullandSubPixel = find(ROI_GF_bloodFullandSubPixel>0);

idx_ROI_GF_bloodFullPixel = find(ROI_GF_bloodFullPixel>0);
%reshape image
[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);
% selected ROI on image.
%  I_ROI_GF_bloodFullPixel = double(I(idx_ROI_GF_bloodFullandSubPixel,:));
I_ROI_GF_bloodFullPixel = double(I(idx_ROI_GF_bloodFullPixel,:));
figure,histogram(I_ROI_GF_bloodFullPixel(:,1),"BinWidth",1 ), title("1st channel GF blood full pixel"); ylim([0 100])
figure,histogram(I_ROI_GF_bloodFullPixel(:,2),"BinWidth",1 ), title("2nd channel GF blood full pixel");ylim([0 100])
figure,histogram(I_ROI_GF_bloodFullPixel(:,3),"BinWidth",1 ), title("3rd channel GF blood full pixel")

t_GF_fullPixel = ROI_GF_bloodFullPixel;
%ROI_GF_bloodFullandSubPixel = image_subsetting(I0,1);
%save('ROI_GF_bloodFullandSubPixel.mat','ROI_GF_bloodFullandSubPixel')
load('ROI_GF_bloodFullandSubPixel.mat')
t_GF_subPixel = ROI_GF_bloodFullandSubPixel; 
%GT = ROI_GF; %ROI_BCInner
ROI_GF=ROI;
I_add = zeros(m,n,k);
I_add(:,:,1)=0.5*double(I0(:,:,1))+0.5*255*double(ROI_GF(:,:,1));
I_add(:,:,2)=0.5*double(I0(:,:,2))+0.5*255*double(ROI_GF(:,:,1));
I_add(:,:,3)=0.5*double(I0(:,:,3))+0.5*255*double(ROI_GF(:,:,1));

figure,imagesc(I0)
figure,imagesc(uint8(I_add));
figure,imshow(GT,[])
t_BCInner = t_W;
%% non-blood contaminates ROI
%ROI_GF_coffee = image_subsetting(I0,1);
%save('ROI_GF_coffee.mat','ROI_GF_coffee')
%ROI_GF_ketchup = image_subsetting(I0,1);
%save('ROI_GF_ketchup.mat','ROI_GF_ketchup')
%ROI_GF_orangejuice = image_subsetting(I0,1);
%save('ROI_GF_orangejuice.mat','ROI_GF_orangejuice')
%ROI_GF_redwine = image_subsetting(I0,1);
%save('ROI_GF_redwine.mat','ROI_GF_redwine')

load('ROI_GF_coffee.mat')
load('ROI_GF_ketchup.mat')
load('ROI_GF_orangejuice.mat')
load('ROI_GF_redwine.mat')
ROI_GF_substrate = ROI_GF - ROI_GF_coffee - ROI_GF_ketchup - ROI_GF_orangejuice - ROI_GF_redwine - ROI_GF_bloodFullandSubPixel;
figure,imshow(ROI_GF_substrate,[]);title('GF substrate')
%% target spectrum, use one pixel, or use an average
%t_BCInner = double(reshape(I0(1400, 2023,:),[1,3]));
%t_BCMid = double(reshape(I0(1079, 2547,:),[1,3]));
%t_BCOutter = double(reshape(I0(868, 2949,:),[1,3]));
%t_WP = double(reshape(I0(1070,731,:),[1,3]));
%t_BF = double(reshape(I0(976,334,:),[1,3]));
t_GF = double(reshape(I0(641, 1291,:),[1,3]));
%t_RF = double(reshape(I0(759, 1961,:),[1,3]));
%t_GRNF = double(reshape(I0(1816, 1880,:),[1,3]));
%t_J = double(reshape(I0(1762, 1338,:),[1,3]));
%t_WC = double(reshape(I0(1666,853,:),[1,3]));
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
GT = ROI_GF_bloodFullPixel;
%load('ROI_GF_bloodFullPixel.mat')  %ROI_GF_bloodFullPixel.mat
%GT = ROI_GF_bloodFullPixel;
%load('BlackCotnInnerBlood.mat');
%GT = ROI_BCInner;
%t_GF = t_BCInner;
%load('BlackCotnMidBlood.mat');
%GT = ROI_BCMid;
%t_GF = t_BCMid;
%load('BlackCotnOutterBlood.mat');
%GT = ROI_BCOutter;
%t_GF = t_BCOutter;
%load('BlackFeltBlood.mat');
%GT = ROI_BF;
%t_GF = t_BF;

%load('WhitePolyBlood.mat');
% GT = ROI_WP;
% t_GF = t_WP;

path_algos = './target_detection_algos/';
addpath(path_algos);

idx_bckgrd = TargetDet_background_pixels_detection('GF');
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
        %figure();imshow(ALGO_image_0,[0 50]);title('MF score global with background extraction, sigma mean subtracted');colorbar;
       %figure();imshow(ALGO_image_0,[min(MF_score_global) max(MF_score_global)]);colorbar;title('MF score global with background extraction, sigma mean subtracted')

        %figure();imshow(ALGO_image_0,[-10 2]);title('MF score global with background extraction, sigma mean subtracted');colorbar;
       %}
        
        
        %{
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
            %figure();imshow(ALGO_image_0,[min(CEM_score) max(CEM_score)]);title('CEM score of ROI with background extraction')
            %figure();imshow(ALGO_image_0,[0 1]);title('CEM score of ROI with background extraction')
           %}

            %{
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
            %figure();imshow(ALGO_image_0,[min(ACE_score) max(ACE_score)]);colorbar;title('ACE score of ROI')
            %figure();imshow(ALGO_image_0,[-6*10^(-6) 6*10^(-6)]);colorbar;title('ACE score of ROI with background extraction')
            %}
            
            %{
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
            SAM_score = SAM_bckground(I_ROI, idx_bckgrd, t_GF'); %SAM(I_ROI,t_BCInner');
            if min(SAM_score)<0
                ALGO_image_0 = 100*min(SAM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(SAM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=SAM_score';

            ALGO_image_0 = reshape(ALGO_image_0, [m,n]);
            %figure();imshow(ALGO_image_0,[min(SAM_score) max(SAM_score)]);colorbar;title('SAM score of ROI')

           %{
            clearvars ALGO_image_0
            SAM_score = SAM(I_ROI, t_GF'); %SAM(I_ROI,t_BCInner');
            if min(SAM_score)<0
                ALGO_image_0 = 100*min(SAM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
                else ALGO_image_0 = (-100 + min(SAM_score)).*ones(m*n,1);
            end
            % store scores to the ROI region
            ALGO_image_0(idx_ROI)=SAM_score';

            ALGO_image_0 = reshape(ALGO_image_0, [m,n]);
            figure();imshow(ALGO_image_0,[min(SAM_score) max(SAM_score)]);colorbar;title('SAM score of ROI')
       end
           %}
     
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
       %  ALGO_non_GT_data = ALGO_image_0(setdiff(idx_ROI, idx_GT));
        ALGO_non_GT_data = ALGO_image_0(setdiff(idx_bckgrd, idx_GT));
        ALGO_non_GT_data = sort(ALGO_non_GT_data,'descend');
        
        
        %% ROC
        [TPR, FPR] = ROC(ALGO_GT_data, ALGO_non_GT_data );
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

saveas(h1,'PR Using In-scene Bloodstain on Wood.png')
saveas(h2,'ROC Using In-scene Bloodstain on Wood.png')

%%
%{        
%% MF, and map it to the ROI region

[ MF_score ] = MF(I_ROI,t_BCInner');
if min(MF_score)<0
    MF_image = 100*min(MF_score).*ones(m*n,1);% ensure MF_score for not calculated image is much less than the min of MF_score
    else MF_image = (-100 + min(MF_score)).*ones(m*n,1);
end
% store scores to the ROI region
MF_image(idx_ROI)=MF_score';

MF_image = reshape(MF_image,[m,n]);
figure();imshow(MF_image,[min(MF_score) max(MF_score)]);title('MF score of ROI')


%% SAM, and map it to the ROI region
SAM_score = SAM(I_ROI,t_BCInner');
if min(SAM_score)<0
    SAM_image = 100*min(SAM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
    else SAM_image = (-100 + min(SAM_score)).*ones(m*n,1);
end
% store scores to the ROI region
SAM_image(idx_ROI)=SAM_score';

SAM_image = reshape(SAM_image,[m,n]);
figure();imshow(SAM_image,[min(SAM_score) max(SAM_score)]);title('SAM score of ROI')


%% ACE, and map it to the ROI region
ACE_score = ACE(I_ROI,t_BCInner');
if min(ACE_score)<0
    ACE_image = 100*min(ACE_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
    else ACE_image = (-100 + min(ACE_score)).*ones(m*n,1);
end
% store scores to the ROI region
ACE_image(idx_ROI)=ACE_score';

ACE_image = reshape(ACE_image,[m,n]);
figure();imshow(ACE_image,[min(ACE_score) max(ACE_score)]);title('ACE score of ROI')


%% CEM, and map it to the ROI region
CEM_score = CEM(I_ROI,t_BCInner');
if min(CEM_score)<0
    CEM_image = 100*min(CEM_score).*ones(m*n,1);% ensure SAM_score for not calculated image is much less than the min of MF_score
    else CEM_image = (-100 + min(CEM_score)).*ones(m*n,1);
end
% store scores to the ROI region
CEM_image(idx_ROI)=CEM_score';

CEM_image = reshape(CEM_image,[m,n]);
figure();imshow(CEM_image,[min(CEM_score) max(CEM_score)]);title('ACE score of ROI')

%% ground truth
load('BlackCotnInnerBlood.mat');
figure,imshow(ROI_BCInner,[])
GT = ROI_BCInner;

%GT = image_subsetting(I0,1);

MF_GT = MF_image.*GT;
idx_GT = find(GT>0);
% bloodstain data 
MF_GT_data = reshape(MF_GT,[m*n,1]);
MF_GT_data = MF_GT_data(idx_GT);
MF_GT_data = sort(MF_GT_data, 'descend');
figure();imshow(MF_GT,[min(MF_GT_data) max(MF_GT_data)]);title('Estimated Bloodstain Ground Truth');colorbar;

% non-bloodstain data
MF_image = reshape(MF_image, [m*n,1]);
MF_non_GT_data = MF_image(setdiff(idx_ROI, idx_GT));
MF_non_GT_data = sort(MF_non_GT_data,'descend');


%% ROC
[TPR, FPR] = ROC(MF_GT_data, MF_non_GT_data );

%% AUC
AUC = trapz(FPR, TPR);
if TPR (end) == 1 & FPR(end) <1
    AUC = AUC + ( (1- FPR(end))*1);
end
%}
%%
save('AUC_ROC_cell_GF_FullPixelBlood_bckground.mat','AUC_ROC_cell')
save('AUC_PR_cell_GF_FullPixelBlood_bckground.mat','AUC_PR_cell')
%% plot AUC ROC
%{
%load('AUC_cell_BlackCotnInnerBlood.mat')
figure();hold on;
bar([AUC_ROC_cell{1}, AUC_ROC_cell{2}, AUC_ROC_cell{3}, AUC_ROC_cell{4}],0.4, 'FaceColor',[0.5 0.5 0.5])
ylim([0 1]);ylabel('AUC ROC');%title('AUC Using In-scene Bloodstain on Mid Black Cotton')
for i = 0.2:0.2:0.8
plot(0:0.1:5, i*ones(1,length(0:0.1:5)),'k-.');
end
%Algorithms = {'ACE'; 'CEM'; 'MF'; 'SAM'};
set(gca,'xtick',1:4,'xticklabel',algos)
saveas(gcf,'AUC ROC Using In-scene Bloodstain on Wood.png')
%save('AUC_ROC_cell_BlackCotnInnerBlood.mat','AUC_ROC_cell')
%}
%% plot AUC PR
%{
%load('AUC_cell_BlackCotnInnerBlood.mat')
figure();hold on;
bar([AUC_PR_cell{1}, AUC_PR_cell{2}, AUC_PR_cell{3}, AUC_PR_cell{4}],0.4, 'FaceColor',[0.5 0.5 0.5])
ylim([0 1]);ylabel('AUC PR');%title('AUC Using In-scene Bloodstain on Mid Black Cotton')
for i = 0.2:0.2:0.8
plot(0:0.1:5, i*ones(1,length(0:0.1:5)),'k-.');
end
%Algorithms = {'ACE'; 'CEM'; 'MF'; 'SAM'};
set(gca,'xtick',1:4,'xticklabel',algos)
saveas(gcf,'AUC PR Using In-scene Bloodstain on Wood.png')
%save('AUC_ROC_cell_BlackCotnInnerBlood.mat','AUC_ROC_cell')
%}
%% plot ROC
%{
figure();hold on; grid on;
plot(FPR, TPR, ':','LineWidth',2)
plot(0:0.01:1, 0:0.01:1, 'k-.', 'linewidth', 1.5);
%legend('GF as background', 'GF uniform part as background','Entire image as background');
axis([0,1,0,1]);
%title('ROC');
xlabel('False positive rate');
ylabel('True positive rate');
hold off;
saveas(gcf,'ROC Using In-scene Bloodstain on BCOutter.png')
%}
%% plot PR
%{
figure();hold on; grid on;
plot(recall, precision, ':','LineWidth',2)
%plot(0:0.01:1, 0:0.01:1, 'k-.', 'linewidth', 1.5);
%legend('GF as background', 'GF uniform part as background','Entire image as background');
axis([0,1,0,1]);
%title('PR');
xlabel('Recall');
ylabel('Precision');
hold off;
saveas(gcf,'ROC Using In-scene Bloodstain on BCOutter.png')
%}
%% bar plot for MF for all substrates

load('AUC_cell_WPBlood.mat');
MF_AUC_WP = AUC_cell{1};
SAM_AUC_WP = AUC_cell{2};
ACE_AUC_WP = AUC_cell{3};
CEM_AUC_WP = AUC_cell{4};
clearvars AUC_cell

load('AUC_cell_GFBlood.mat');
MF_AUC_GF = AUC_cell{1};
SAM_AUC_GF = AUC_cell{2};
ACE_AUC_GF = AUC_cell{3};
CEM_AUC_GF = AUC_cell{4};
clearvars AUC_cell

load('AUC_cell_RFBlood.mat')
MF_AUC_RF = AUC_cell{1};
SAM_AUC_RF = AUC_cell{2};
ACE_AUC_RF = AUC_cell{3};
CEM_AUC_RF = AUC_cell{4};
clearvars AUC_cell

load('AUC_cell_GRNFBlood.mat')
MF_AUC_GRNF = AUC_cell{1};
SAM_AUC_GRNF = AUC_cell{2};
ACE_AUC_GRNF = AUC_cell{3};
CEM_AUC_GRNF = AUC_cell{4};
clearvars AUC_cell

load('AUC_cell_JeanBlood.mat')
MF_AUC_J = AUC_cell{1};
SAM_AUC_J = AUC_cell{2};
ACE_AUC_J = AUC_cell{3};
CEM_AUC_J = AUC_cell{4};
clearvars AUC_cell

load('AUC_cell_WCBlood.mat')
MF_AUC_WC = AUC_cell{1};
SAM_AUC_WC = AUC_cell{2};
ACE_AUC_WC = AUC_cell{3};
CEM_AUC_WC = AUC_cell{4};
clearvars AUC_cell

load('AUC_cell_BlackCotnInnerBlood.mat')
MF_AUC_BCInner = AUC_cell{1};
SAM_AUC_BCInner = AUC_cell{2};
ACE_AUC_BCInner = AUC_cell{3};
CEM_AUC_BCInner = AUC_cell{4};
clearvars AUC_cell

load('AUC_cell_BlackCotnMidBlood.mat')
MF_AUC_BCMid = AUC_cell{1};
SAM_AUC_BCMid = AUC_cell{2};
ACE_AUC_BCMid = AUC_cell{3};
CEM_AUC_BCMid = AUC_cell{4};
clearvars AUC_cell

load('AUC_cell_BlackCotnOutterBlood.mat')
MF_AUC_BCOutter = AUC_cell{1};
SAM_AUC_BCOutter = AUC_cell{2};
ACE_AUC_BCOutter = AUC_cell{3};
CEM_AUC_BCOutter = AUC_cell{4};
clearvars AUC_cell

load('AUC_cell_BFBlood.mat')
MF_AUC_BF = AUC_cell{1};
SAM_AUC_BF = AUC_cell{2};
ACE_AUC_BF = AUC_cell{3};
CEM_AUC_BF = AUC_cell{4};
clearvars AUC_cell

load('AUC_cell_WoodBlood.mat')
MF_AUC_W = AUC_cell{1};
SAM_AUC_W = AUC_cell{2};
ACE_AUC_W = AUC_cell{3};
CEM_AUC_W = AUC_cell{4};
clearvars AUC_cell
%% MF
%{
figure();hold on;
bar([MF_AUC_WP, MF_AUC_GF, MF_AUC_RF, MF_AUC_GRNF, MF_AUC_J, MF_AUC_WC, MF_AUC_BCInner, MF_AUC_BCMid, MF_AUC_BCOutter, MF_AUC_BF, MF_AUC_W],0.4, 'FaceColor',[0.5 0.5 0.5])
ylim([0 1]);ylabel('AUC');%title('AUC Using In-scene Bloodstain on Mid Black Cotton')
for i = 0.2:0.2:0.8
plot(0:0.1:11, i*ones(1,length(0:0.1:11)),'k-.');
end
set(gca,'xtick',1:11,'xticklabel',{'WP', 'GF', 'RF', 'GRNF', 'J', 'WC', 'BCIn', 'BCMid', 'BCOut', 'BF', 'W'})
saveas(gcf,'MF AUC Using In-scene Bloodstain Target Spectrum.png')
%}
%% SAM
%{
figure();hold on;
bar([SAM_AUC_WP, SAM_AUC_GF, SAM_AUC_RF, SAM_AUC_GRNF, SAM_AUC_J, SAM_AUC_WC, SAM_AUC_BCInner, SAM_AUC_BCMid, SAM_AUC_BCOutter, SAM_AUC_BF, SAM_AUC_W],0.4, 'FaceColor',[0.5 0.5 0.5])
ylim([0 1]);ylabel('AUC');%title('AUC Using In-scene Bloodstain on Mid Black Cotton')
for i = 0.2:0.2:0.8
plot(0:0.1:11, i*ones(1,length(0:0.1:11)),'k-.');
end
set(gca,'xtick',1:11,'xticklabel',{'WP', 'GF', 'RF', 'GRNF', 'J', 'WC', 'BCIn', 'BCMid', 'BCOut', 'BF', 'W'})
saveas(gcf,'SAM AUC Using In-scene Bloodstain Target Spectrum.png')
%}

%% ACE
%{
figure();hold on;
bar([ACE_AUC_WP, ACE_AUC_GF, ACE_AUC_RF, ACE_AUC_GRNF, ACE_AUC_J, ACE_AUC_WC, ACE_AUC_BCInner, ACE_AUC_BCMid, ACE_AUC_BCOutter, ACE_AUC_BF, ACE_AUC_W],0.4, 'FaceColor',[0.5 0.5 0.5])
ylim([0 1]);ylabel('AUC');%title('AUC Using In-scene Bloodstain on Mid Black Cotton')
for i = 0.2:0.2:0.8
plot(0:0.1:11, i*ones(1,length(0:0.1:11)),'k-.');
end
set(gca,'xtick',1:11,'xticklabel',{'WP', 'GF', 'RF', 'GRNF', 'J', 'WC', 'BCIn', 'BCMid', 'BCOut', 'BF', 'W'})
saveas(gcf,'ACE AUC Using In-scene Bloodstain Target Spectrum.png')
%}
%% CEM
%{
figure();hold on;
bar([CEM_AUC_WP, CEM_AUC_GF, CEM_AUC_RF, CEM_AUC_GRNF, CEM_AUC_J, CEM_AUC_WC, CEM_AUC_BCInner, CEM_AUC_BCMid, CEM_AUC_BCOutter, CEM_AUC_BF, CEM_AUC_W],0.4, 'FaceColor',[0.5 0.5 0.5])
ylim([0 1]);ylabel('AUC');%title('AUC Using In-scene Bloodstain on Mid Black Cotton')
for i = 0.2:0.2:0.8
plot(0:0.1:11, i*ones(1,length(0:0.1:11)),'k-.');
end
set(gca,'xtick',1:11,'xticklabel',{'WP', 'GF', 'RF', 'GRNF', 'J', 'WC', 'BCIn', 'BCMid', 'BCOut', 'BF', 'W'})
saveas(gcf,'CEM AUC Using In-scene Bloodstain Target Spectrum.png')
%}
%% bar plot
figure();hold on;
bar([WP_ace_AUC, WP_cem_AUC, WP_mf_AUC, WP_sam_AUC],0.4, 'FaceColor',[0.5 0.5 0.5])
ylim([0 1]);ylabel('AUC');title('AUC Using In-scene Bloodstain on WP')
for i = 0.2:0.2:0.8
plot(0:0.1:5, i*ones(1,length(0:0.1:5)),'k-.');
end
Algorithms = {'ACE'; 'CEM'; 'MF'; 'SAM'};
set(gca,'xtick',1:4,'xticklabel',Algorithms)

%legend
ah1 = gca;
legend(ah1, h([1 2 3 4]), 'WP', 'GF','RF','BCInner');
ah2 = axes('position', get(gca, 'position'), 'visible','off');
legend(ah2, h([5 6 7]), 'BCMid', 'BCOutter', 'GRNF');
ah3 = axes('position',get(gca, 'position'),'visible','off');
legend(ah3, h([8 9 10]), 'J','WC','W');

%
figure();
errorbar(target_AUC_mean, target_AUC_std,'s','MarkerSize',10,'LineWidth',2);
ylim([0 1]);xlim([0 11])
set(gca,'xtick',1:10,'xticklabel',Substrates)
set(gca, 'XTickLabelRotation', 45)
grid on;
ylabel('AUC')
title('Target Performance Comparison: mean and standard deviation of four algorithms')

%% ROI
figure();imshow(uint8(I0),[]);
disp('Please select ROI (double click adds a final point. Press Return or Enter ends the selection without adding a final point. Pressing Backspace or Delete removes the previously selected point.):');
[GF_x, GF_y]=getpts
ROI_BF_bloodFullPixel_or_bloodFullandSubPixel = roipoly(I0, GF_x, GF_y);
figure,imshow(ROI_BF_bloodFullPixel_or_bloodFullandSubPixel ,[])
save('ROI_BF_bloodFullPixel_or_bloodFullandSubPixel.mat', 'ROI_BF_bloodFullPixel_or_bloodFullandSubPixel')

ROI_GF_uniform_region = roipoly(I0, GF_x, GF_y);
idx_ROI_GF_uniform_region = find(ROI_GF_uniform_region==1);
figure,imshow(ROI_GF_uniform_region,[0, 1])
save('ROI_GF_uniform_region.mat', 'ROI_GF_uniform_region')


ROI_RF_bloodFullPixel = roipoly(I0, GF_x, GF_y);
ROI_RF_less_bckgrd_sub = roipoly(I0, GF_x, GF_y);
idx_sub = find(ROI_RF_bloodFullPixel==1);
figure,imshow(ROI_RF_bloodFullPixel,[0,1])
save('ROI_RF_bloodFullPixel.mat', 'ROI_RF_bloodFullPixel')
save("ROI_GF_less_bckgrd.mat", "ROI_GF_less_bckgrd", '-mat')
blood = double(I0).*ROI_GF_less_bckgrd;

