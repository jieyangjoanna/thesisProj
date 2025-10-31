function [AUC_PR_allSubstrates_allAlgos, TPR_p0001_allSubstrates_allAlgos] = TargetDet_bckgrd_summary_plot()

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
        clearvars ALGO_image_result ROI ALGO_GT_data ALGO_non_GT_data idx_bckgrd
        % ROI
        load(strcat(path_data, 'WP.mat'))
        % GT
        load('WhitePolyBlood.mat');
        GT_WP = ROI_WP;
        % target spectrum
        % t_WP = double(reshape(I0(1070,731,:),[1,3]));
        % t_WP = double(uint8([0.638*255, 0.082*255, 0.419*255])); % averaged 100 reflectance spectra measured by spectrometer multiply by the 8bit digital count.
        % t_WP = [160.188436830835	60.6245538900785	146.321199143469]; % averaged 1401 pixels of blood full pixel regions.
        t_WP = [162.346408839779	75.3370165745856	150.960773480663]; % averaged 1810 full and sub-pixels 
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
        % t_WC = double(reshape(I0(1666,853,:),[1,3]));
        % t_WC = double(uint8([0.490*255, 0.034*255, 0.325*255])); % averaged 100 spectra multiply by the 8bit digital count.
        % t_WC = [188.232323232323	108.454545454545	192.732323232323]; % averaged 198 pixels of blood full pixel regions.
        t_WC = [193.041564792176	140.809290953545	202.190709046455]; % averaged 409 full and sub-pixels 

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
       % t_GF = double(reshape(I0(641, 1291,:),[1,3])); % image extracted one pixel
       % t_GF = double(uint8([0.543*255, 0.164*255, 0.401*255])); % averaged 100 reflectance spectra measured by spectrometer multiply by the 8bit digital count.
       % t_GF = [143.542713567839	52.0067001675042	104.721943048576]; % averaged 597 pixels of blood full pixel regions.
       t_GF = [143.879057924889	77.1056651814131	122.362189688097]; % averaged 1571 full and sub-pixels 
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
       % t_GRNF = double(reshape(I0(1816, 1880,:),[1,3]));
       % t_GRNF = double(uint8([0.299*255, 0.208*255, 0.395*255])); % averaged 100 reflectance spectra measured by spectrometer multiply by the 8bit digital count.
       % t_GRNF = [39.7704918032787	38.6536885245902	75.2704918032787]; % averaged 488 pixels of blood full pixel regions.
       t_GRNF = [39.9906213364596	44.3153575615475	78.0633059788980]; % averaged 853 full and sub-pixels 
       load('idx_bckgrd_GRNF.mat');
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
       % t_RF = double(reshape(I0(759, 1961,:),[1,3]));
       % t_RF = double(uint8([0.632*255, 0.111*255, 0.404*255])); % averaged 100 reflectance spectra measured by spectrometer multiply by the 8bit digital count.
       % t_RF = [181	38.1480263157895	147.452302631579]; % averaged 608 pixels of blood full pixel regions.
       t_RF = [182.090000000000	38.2240000000000	159.255000000000]; % averaged 1000 full and sub-pixels 
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
       % t_BF = double(reshape(I0(976,334,:),[1,3]));
       % t_BF = double(uint8([0.217*255, 0.096*255, 0.171*255])); % averaged 100 reflectance spectra measured by spectrometer multiply by the 8bit digital count.
       % t_BF = [33.5054432348367	27.4370139968896	1.82426127527216]; % averaged 643 pixels of blood full pixel regions.
       t_BF = [33.5054432348367	27.4370139968896	1.82426127527216]; % averaged 643 full and sub-pixels 
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
       % t_BCInner = double(reshape(I0(1400, 2023,:),[1,3]));
       % t_BCInner = double(uint8([0.044*255, 0.022*255, 0.274*255])); % averaged 100 reflectance spectra measured by spectrometer multiply by the 8bit digital count. BCInner, BCMid, and BCOutter are the same
       % t_BCInner = [55.8684684684685	30.1063063063063	178.827027027027]; % averaged 555 pixels of blood full pixel regions.
       t_BCInner = [55.8717015468608	29.8462238398544	186.509554140127]; % averaged 1099 full and sub-pixels
        load('idx_bckgrd_BCinner.mat');
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
        % t_BCMid = double(reshape(I0(1079, 2547,:),[1,3]));
        % t_BCMid = double(uint8([0.044*255, 0.022*255, 0.274*255])); % averaged 100 reflectance spectra measured by spectrometer multiply by the 8bit digital count. BCInner, BCMid, and BCOutter are the same
        % t_BCMid = [47.9458128078818	27.7413793103448	177.788177339901]; % averaged 406 pixels of blood full pixel regions.
        t_BCMid = [48.2345132743363	27.5648967551622	182.775811209440]; % averaged 678 full and sub-pixels 
         load('idx_bckgrd_BCmid.mat');
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
        % t_BCOutter = double(reshape(I0(868, 2949,:),[1,3]));
        % t_BCOutter = double(uint8([0.044*255, 0.022*255, 0.274*255])); % averaged 100 reflectance spectra measured by spectrometer multiply by the 8bit digital count. BCInner, BCMid, and BCOutter are the same
        % t_BCOutter = [41.6539855072464	22.7681159420290	172.076086956522]; % averaged 552 pixels of blood full pixel regions.
        t_BCOutter = [42.2705882352941	22.9614973262032	177.823529411765]; % averaged 935 full and sub-pixels 
        load('idx_bckgrd_BCOutter.mat');
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
       % t_J = double(reshape(I0(1762, 1338,:),[1,3]));
       % t_J = double(uint8([0.095*255, 0.048*255, 0.377*255])); % averaged 100 reflectance spectra measured by spectrometer multiply by the 8bit digital count.
       % t_J = [87.8156732891832	50.1622516556291	176.368653421634]; % averaged 906 pixels of blood full pixel regions.
       t_J = [89.8884180790960	59.0833333333333	182.669491525424]; % averaged 1416 full and sub-pixels 
        load('idx_bckgrd_J.mat');
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
        % t_W = double(reshape(I0(1685,470,:),[1,3]));
        % t_W = double(uint8([1.00*255, 0.313*255, 0.925*255])); % averaged 100 spectra multiply by the 8bit digital count.
        % t_W = [141.842010771993	75.4883303411131	166.865350089767]; % averaged 557 pixels of blood full pixel regions.
        t_W = [143.883806038426	81.8618481244282	174.681610247027]; % averaged 1093 full and sub-pixels 
        load('idx_bckgrd_Wood.mat');
        idx_bckgrd_Wood = idx_bckgrd;
        [TPR_p0001_allSubstrates_allAlgos(i,:), AUC_PR_allSubstrates_allAlgos(i,:), AUC_ROC_allSubstrates_allAlgos(i,:)]= algo_image_plot_background(I0, ROI, idx_bckgrd_Wood, t_W, GT_W, 'Wood');
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


end