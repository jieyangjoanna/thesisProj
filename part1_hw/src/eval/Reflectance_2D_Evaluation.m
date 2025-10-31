%Cal. performance evaluation

%% set up environment
path_BS = '../../data/BS_2ndEdition/';
addpath(path_BS);
%addpath('C:\AcademicProjects\CRISIS_Camra\MSI image processing\MSI images\RBD\BS_2ndEdition')

angle_lowLimit = 0:24;
IF_NO = '550'; % 550 nm
% myDir = 'C:\AcademicProjects\CRISIS_Camra\MSI image processing\MSI images\RBD';
myFiles = dir(fullfile(path_BS, strcat('*',IF_NO, '_2ndEdition.txt')));
if isempty(myFiles)
    filename = fullfile('BlueShiftAverage_2ndEdition.txt');
    BS = dlmread(strcat(path_BS, filename),'',1,0);
    CWL= round(str2double(IF_NO)+round(BS(angle_lowLimit*10+1,2)));
else 
    filename = fullfile(myFiles.name);
    BS = dlmread(strcat(path_BS, filename),'',1,0);%angle_lowLimit corresponds to BS(1,:)
    CWL= round(BS(angle_lowLimit*10+1,2));
end
%% ASD spectra
path_spectra = '../../data/ASDSpectra/';
file = dir(fullfile(path_spectra, '\BlackSandPaper04092018.txt'));
blackSandPaper = dlmread(fullfile(path_spectra, file.name), '', 1,0);
Reflectance_BlackPanel = blackSandPaper(:,2);

file = dir(fullfile(path_spectra, '\WhiteSandPaper04092018.txt'));
whiteSandPaper04092018 = dlmread(fullfile(path_spectra, file.name), '', 1,0);
Reflectance_WhitePanel = whiteSandPaper04092018(:,2);

file = dir(fullfile(path_spectra, '\WhiteLineFabric4Layers.txt'));
whiteLineFabric = dlmread(fullfile(path_spectra, file.name), '', 1,0);
Reflectance_WhiteLineFabric = whiteLineFabric(:,2);

Reflectance_BlackPaint_CWL_Evl = zeros(25,1);
Reflectance_WhitePaint_CWL_Evl = zeros(25,1);
Reflectance_WhiteLineFabric_CWL_Evl = zeros(25,1);

%% reflectance calibrated image
path_refImgs = '../../data/refImages/';
addpath(path_refImgs);
file = dir(fullfile(path_refImgs, '\04162018_IF850_NoLensCor_Ref_Registered_update.mat'));
Im_ref = cell2mat(struct2cell(load(fullfile(path_refImgs, file.name))));

%% input data
path_refEval = '../../data/refEvaluation/';
addpath(path_refEval);
file = dir(fullfile(path_refEval, '\04162018_IF850_Black_Panel_x_update.mat'));
Black_Panel_x = cell2mat(struct2cell(load(fullfile(path_refEval, file.name))));
file = dir(fullfile(path_refEval, '\04162018_IF850_Black_Panel_y_update.mat'));
Black_Panel_y = cell2mat(struct2cell(load(fullfile(path_refEval, file.name))));
file = dir(fullfile(path_refEval, '\04162018_IF850_White_Panel_x_update.mat'));
White_Panel_x = cell2mat(struct2cell(load(fullfile(path_refEval, file.name))));
file = dir(fullfile(path_refEval, '\04162018_IF850_White_Panel_y_update.mat'));
White_Panel_y = cell2mat(struct2cell(load(fullfile(path_refEval, file.name))));

%%
figure();imshow(Im_ref,[]);
display('Please select target points: ');
[Target_x, Target_y]=getpts



ROI_BlackPanel = roipoly(Im_ref, Black_Panel_x, Black_Panel_y);
ROI_WhitePanel = roipoly(Im_ref, White_Panel_x, White_Panel_y);
ROI_Target = roipoly(Im_ref, Target_x, Target_y);


%load(strcat(path_spectra, 'blksand.mat'));
%Reflectance_BlackPaint = blksand;

%load(strcat(path_spectra, 'whtsand.mat'));%Reflectance_WhitePaint = whtsand2_av;

path_inte_spectra = '../../data/Integrated Spectra/';
addpath(path_inte_spectra);
%file = dlmread('BlueCotnMean.mn.txt','',41,0);
%Reflectance_BlueCotn = file(:,2);
%file = dlmread('WhiteLineFabricMean.mn.txt', '', 41, 0);
%wall = dlmread('LightBlueWall04092018.txt','',1,0);
%Reflectance_WhiteLineFabric = wall(:,2);

%GF = dlmread('GrayFeltMean.mn.txt','',42,0);

%Reflectance_BlueCotn_CWL_Evl = zeros(21,1);
%spectrolon = dlmread('Spectrolon.txt','',1,0);
%Ref_spec = spectrolon(:,2);



%% ref. image padding
%Im_ref = zeros(2748,3840);
%Im_ref(7:2744, 1:3700) = Im_ref ;%Ref690;


%% fabric ROI

%{
figure();imshow(Im_ref,[]);
display('Please select black panel, white calibration panel, and target pints: ');
[Black_Panel_x, Black_Panel_y]=getpts
[White_Panel_x, White_Panel_y]=getpts
[Target_x, Target_y]=getpts
%}

% RF without bloodstains or confusors.
path_sub_ROIs = '../../data/ROIs/substrateOnly/';
addpath(path_sub_ROIs);
load RF_x
load RF_y
ROI_RFOnly = roipoly(Im_ref, RF_x, RF_y);

load GF_x
load GF_y
ROI_GFOnly = roipoly(Im_ref, GF_x, GF_y);

load WP_x
load WP_y
ROI_WPOnly = roipoly(Im_ref, WP_x, WP_y);

load BC_x
load BC_y
ROI_BCOnly = roipoly(Im_ref, BC_x, BC_y);

load GRNF_x
load GRNF_y
ROI_GRNFOnly = roipoly(Im_ref, GRNF_x, GRNF_y);

load J_x
load J_y
ROI_JOnly = roipoly(Im_ref, J_x, J_y);

load WC_x
load WC_y
ROI_WCOnly = roipoly(Im_ref, WC_x, WC_y);

load W_x
load W_y
ROI_WOnly = roipoly(Im_ref, W_x, W_y);

%ROI_BlackPanel = roipoly(Im_ref, Black_Panel_x, Black_Panel_y);
%ROI_WhitePanel = roipoly(Im_ref, White_Panel_x, White_Panel_y);
%ROI_Target = roipoly(Im_ref, Target_x, Target_y);
%% Fabric ground truth reflectance spectra
filename = fullfile('Integrated Spectra','BloodOnBlackCotnMean.mn_i.txt');
BLD_BC_spectrum = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','BloodOnBlackFeltMean.mn_i.txt');
BLD_BF_spectrum = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','BloodOnGrayFeltMean.mn_i.txt');
BLD_GF_spectrum = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','BloodOnGreenFeltMean.mn_i.txt');
BLD_GRNF_spectrum = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','BloodOnRedFeltMean.mn_i.txt');
BLD_RF_spectrum = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','BloodOnJeansMean.mn_i.txt');
BLD_J_spectrum = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','BloodOnWhiteCotnMean.mn_i.txt');
BLD_WC_spectrum = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','BloodOnWhitePolyMean.mn_i.txt');
BLD_WP_spectrum = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','BloodOnWoodMean.mn_i.txt');
BLD_W_spectrum = dlmread(filename, '', 0, 0);
%%
%idx_RFOnly = find(ROI_RFOnly>0);
%ROI_RFOnly = reshape(ROI_RFOnly, [size(ROI_RFOnly,1)*size(ROI_RFOnly,2),1]);
%RFOnly_pixel = ROI_RFOnly(idx_RFOnly);

%% ground truth spectra for substrates only
filename = fullfile('Integrated Spectra','RedFeltMean.mn_i.txt');
RF = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','GreenFeltMean.mn_i.txt');
GRNF = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','blackCotnMean.mn_i.txt');
BC = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','BlackFeltMean.mn_i.txt');
BF = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','GrayFeltMean.mn_i.txt');
GF = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','JeansMean.mn_i.txt');
J = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','WhiteCotnMean_i.txt');
WC = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','PolyMean.mn_i.txt');
WP = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','WOODMean_i.txt');
W = dlmread(filename, '', 0, 0);

figure;hold on
plot(350:2500, BLD_J_spectrum,'r.')
plot(350:2500, J,'k.')
legend('Bloodstains on J','J')
xlim([350 1000])
xlabel('Wavelength (nm)')
ylabel('Reflectance')
grid on

figure();hold on;
plot(350:2500, RF);
plot(350:2500, GF);
plot(350:2500, WP);
plot(350:2500, BC);
plot(350:2500, GRNF);
plot(350:2500, J);
plot(350:2500,WC);
plot(350:2500, W);
plot(350:2500, BF);
legend('RF','GF','WP','BC','GRNF','J','WC','W','BF')
xlim([350 1000]);
grid on;
xlabel('Wavelength (nm)');
ylabel('Reflectance');
title('Cal. Ref. Fabric Ground Truth')

%% ROI substrates only vs. AoV
figure();imshow(ROI_RFOnly+ROI_GFOnly+ROI_WPOnly+ROI_BCOnly+ROI_GRNFOnly+ROI_JOnly+ROI_WCOnly+ROI_WOnly)

figure(); hold on;
imshow(ROI_BlackPanel + ROI_WhitePanel + ROI_Target)

for angle_lowLimit=0:24
    RF_CWL_Evl(angle_lowLimit+1) = mean(RF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    GF_CWL_Evl(angle_lowLimit+1) = mean(GF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    WP_CWL_Evl(angle_lowLimit+1) = mean(WP(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    BC_CWL_Evl(angle_lowLimit+1) = mean(BC(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    GRNF_CWL_Evl(angle_lowLimit+1) = mean(GRNF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    J_CWL_Evl(angle_lowLimit+1) = mean(J(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    WC_CWL_Evl(angle_lowLimit+1) = mean(WC(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    W_CWL_Evl(angle_lowLimit+1) = mean(W(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    BF_CWL_Evl(angle_lowLimit+1) = mean(BF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));

    %Reflectance_BlackPanel_CWL_Evl(angle_lowLimit+1) = mean(Reflectance_BlackPanel(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %Reflectance_WhitePanel_CWL_Evl(angle_lowLimit+1) = mean(Reflectance_WhitePanel(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %Reflectance_WhiteLineFabric_CWL_Evl(angle_lowLimit+1) = mean(Reflectance_WhiteLineFabric(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
end

%% BLD on substrate spectra vs. AoV


for angle_lowLimit=0:24
    BLD_RF_CWL_Evl(angle_lowLimit+1) = mean(BLD_RF_spectrum(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    BLD_GF_CWL_Evl(angle_lowLimit+1) = mean(BLD_GF_spectrum(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    BLD_WP_CWL_Evl(angle_lowLimit+1) = mean(BLD_WP_spectrum(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    BLD_BC_CWL_Evl(angle_lowLimit+1) = mean(BLD_BC_spectrum(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    BLD_GRNF_CWL_Evl(angle_lowLimit+1) = mean(BLD_GRNF_spectrum(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    BLD_J_CWL_Evl(angle_lowLimit+1) = mean(BLD_J_spectrum(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    BLD_WC_CWL_Evl(angle_lowLimit+1) = mean(BLD_WC_spectrum(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    BLD_W_CWL_Evl(angle_lowLimit+1) = mean(BLD_W_spectrum(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    BLD_BF_CWL_Evl(angle_lowLimit+1) = mean(BLD_BF_spectrum(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));

    Reflectance_BlackPanel_CWL_Evl(angle_lowLimit+1) = mean(Reflectance_BlackPanel(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    Reflectance_WhitePanel_CWL_Evl(angle_lowLimit+1) = mean(Reflectance_WhitePanel(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    Reflectance_WhiteLineFabric_CWL_Evl(angle_lowLimit+1) = mean(Reflectance_WhiteLineFabric(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
end
%%
%Black panel
angle=[];
ROI_BlackPanel_cal = zeros(25,1);
for angle_lowLimit=1:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_BlackPanel_cut = Radial_Cut_I.*ROI_BlackPanel;
    if isempty(nonzeros(ROI_BlackPanel_cut))
         ROI_BlackPanel_cal(angle_lowLimit+1) = 99;
       % error('No Black panel calibration points selected! ');
    else
        angle = [angle; angle_lowLimit+1];
        ROI_BlackPanel_cal(angle_lowLimit+1)= mean(nonzeros(ROI_BlackPanel_cut));
    end
end

figure();hold on;grid on;
plot(angle-1, Reflectance_BlackPanel_CWL_Evl(angle),'k*');
plot(angle-1, ROI_BlackPanel_cal(angle),'b*-');
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal.'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','Black sand paper')

%% White panel
angle=[];
ROI_WhitePanel_cal = zeros(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_WhitePanel_cut = Radial_Cut_I.*ROI_WhitePanel;
    if isempty(nonzeros(ROI_WhitePanel_cut))
        %error('No white panel calibration points selected! ');
        ROI_WhitePanel_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        ROI_WhitePanel_cal(angle_lowLimit+1)= mean(nonzeros(ROI_WhitePanel_cut));
    end
end

figure();hold on; grid on;
plot(angle-1, Reflectance_WhitePanel_CWL_Evl(angle),'k*');
plot(angle-1, ROI_WhitePanel_cal(angle),'b*-');
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal.'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','White sand paper')

%% Target cal.
% white line fabric
angle=[];
ROI_WhiteLineFabric_cal = zeros(25,1);
for angle_lowLimit = 0:20
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_WhiteLineFabric_cut = Radial_Cut_I.*ROI_Target;
    if isempty(nonzeros(ROI_WhiteLineFabric_cut))
        ROI_WhiteLineFabric_cal(angle_lowLimit+1) = 99;
        %error('No white panel calibration points selected! ');
    else
        angle = [angle; angle_lowLimit+1];
        ROI_WhiteLineFabric_cal(angle_lowLimit+1)= mean(nonzeros(ROI_WhiteLineFabric_cut));
    end
end

% cal target and panels
figure();hold on;grid on;
plot(angle-1, Reflectance_BlackPaint_CWL_Evl(angle),'k-*');
plot(angle-1, ROI_BlackPanel_cal(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, Reflectance_WhitePaint_CWL_Evl(angle),'k-<');
plot(angle-1, ROI_WhitePanel_cal(angle),'-<','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, Reflectance_WhiteLineFabric_CWL_Evl(angle),'k-s');
plot(angle-1, ROI_WhiteLineFabric_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, Reflectance_WhiteLineFabric_CWL_Evl(angle).*1.1,'k--');
plot(angle-1, Reflectance_WhiteLineFabric_CWL_Evl(angle).*0.9, 'k--')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal.'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Black panel truth','Black panel calibrated','White panel truth','White panel calibrated','White line fabric truth','WhiteLine fabric calibrated','+/-10% error')




%% RF substrate only
angle=[];
ROI_RF_cal = zeros(25,1);
for angle_lowLimit = 2:20
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_RFOnly;
    if isempty(nonzeros(ROI_Target_cut))
        ROI_RF_cal(angle_lowLimit+1) = 99;
    else
          angle = [angle; angle_lowLimit+1];
        ROI_RF_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end

figure();hold on;grid on;
plot(angle-1, RF_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, ROI_RF_cal(angle),'b*-');
plot(angle-1, ROI_RF_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, ROI_RF_cal(angle).*1.15,'k--');
plot(angle-1, ROI_RF_cal(angle).*0.85, 'k--')
hold off;
%title(strcat('IF',IF_NO, '  Ref. Cal. for RF'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ref. truth','Cal. ref','115% of cal. ref.','85% of cal. ref.')

%% BLD on RF 
angle=[];
BLD_RF_cal = zeros(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_BLD_RF;
    if isempty(nonzeros(ROI_Target_cut))
        BLD_RF_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        BLD_RF_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end

figure();hold on;grid on;
plot(angle-1, BLD_RF_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, BLD_RF_cal(angle),'b*-');
plot(angle-1, BLD_RF_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, BLD_RF_cal(angle).*1.15,'k--');
plot(angle-1, BLD_RF_cal(angle).*0.85, 'k--')
hold off;
%title(strcat('IF',IF_NO, '  Ref. Cal. for Bloodstain on RF'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ref. truth','Cal. ref.','115% of cal. ref.','85% of cal. ref.')


%% GF substrate only
angle=[];
ROI_GF_cal = zeros(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_GFOnly;
    if isempty(nonzeros(ROI_Target_cut))
       ROI_RF_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        ROI_GF_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end


figure();hold on;grid on;
plot(angle-1, GF_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, ROI_GF_cal(angle),'b*-');
plot(angle-1, ROI_GF_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, ROI_GF_cal(angle).*1.15,'k--');
plot(angle-1, ROI_GF_cal(angle).*0.85, 'k--')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for GF'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ref. truth','Cal. ref.','115% of cal. ref.','85% of cal. ref.')

%% BLD on GF 
angle=[];
BLD_GF_cal = zeros(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_BLD_GF;
    if isempty(nonzeros(ROI_Target_cut))
        BLD_GF_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        BLD_GF_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end

figure();hold on;grid on;
plot(angle-1, BLD_GF_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, BLD_GF_cal(angle),'b*-');
plot(angle-1, BLD_GF_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, BLD_GF_cal(angle).*1.15,'k--');
plot(angle-1, BLD_GF_cal(angle).*0.85, 'k--')
hold off;
%title(strcat('IF',IF_NO, '  Ref. Cal. for Bloodstain on GF'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ref. truth','Cal. ref.','115% of cal. ref.','85% of cal. ref.')

%% WP substrate only
angle=[];
ROI_WP_cal = zeros(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_WPOnly;
    if isempty(nonzeros(ROI_Target_cut))
       ROI_RF_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        ROI_WP_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end
figure();hold on;grid on;
plot(angle-1, WP_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, ROI_WP_cal(angle),'b*-');
plot(angle-1, ROI_WP_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, ROI_WP_cal(angle).*1.15,'k--');
plot(angle-1, ROI_WP_cal(angle).*0.85, 'k--')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for WP'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','WP calibrated','115% of Cal. Ref.','85% of Cal. Ref.')

%% BLD on WP
angle=[];
BLD_WP_cal = zeros(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_BLD_WP;
    if isempty(nonzeros(ROI_Target_cut))
        BLD_WP_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        BLD_WP_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end

figure();hold on;grid on;
plot(angle-1, BLD_WP_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, BLD_WP_cal(angle),'b*-');
plot(angle-1, BLD_WP_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, BLD_WP_cal(angle).*1.15,'k--');
plot(angle-1, BLD_WP_cal(angle).*0.85, 'k--')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for Bloodstain on WP'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','Blood on WP calibrated','115% of Cal. Ref.','85% of Cal. Ref.')

%% BC substrate only
angle=[];
ROI_BC_cal = zeros(25,1);
for angle_lowLimit = 5:21
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_BCOnly;
    if isempty(nonzeros(ROI_Target_cut))
       ROI_RF_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        ROI_BC_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end
figure();hold on;grid on;
plot(angle-1, BC_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, ROI_BC_cal(angle),'b*-');
plot(angle-1, ROI_BC_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, ROI_BC_cal(angle).*1.15,'k--');
plot(angle-1, ROI_BC_cal(angle).*0.85, 'k--')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for BC'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','BC calibrated','115% of Cal. Ref.','85% of Cal. Ref.')

%% BLD on BC 
angle=[];
BLD_BC_cal = zeros(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_BLD_BC;
    if isempty(nonzeros(ROI_Target_cut))
        BLD_BC_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        BLD_BC_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end

figure();hold on;grid on;
plot(angle-1, BLD_BC_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, BLD_BC_cal(angle),'b*-');
plot(angle-1, BLD_BC_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, BLD_BC_cal(angle).*1.15,'k--');
plot(angle-1, BLD_BC_cal(angle).*0.85, 'k--')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for Bloodstain on BC'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ref. truth','Cal. ref.','115% of cal. ref.','85% of cal. ref.')

%% GRNF substrate only
angle=[];
ROI_GRNF_cal = zeros(25,1);
for angle_lowLimit = 1:17
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_GRNFOnly;
    if isempty(nonzeros(ROI_Target_cut))
        ROI_RF_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        ROI_GRNF_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end
figure();hold on;grid on;
plot(angle-1, GRNF_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, ROI_GRNF_cal(angle),'b*-');
plot(angle-1, ROI_GRNF_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, ROI_GRNF_cal(angle).*1.15,'k--');
plot(angle-1, ROI_GRNF_cal(angle).*0.85, 'k--')
hold off;
%title(strcat('IF',IF_NO, '  Ref. Cal. for GRNF'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ref. truth','Cal. ref.','115% of cal. ref.','85% of cal. ref.')

%% BLD on GRNF
angle=[];
BLD_GRNF_cal = zeros(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_BLD_GRNF;
    if isempty(nonzeros(ROI_Target_cut))
        BLD_GRNF_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        BLD_GRNF_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end

figure();hold on;grid on;
plot(angle-1, BLD_GRNF_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, BLD_GRNF_cal(angle),'b*-');
plot(angle-1, BLD_GRNF_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, BLD_GRNF_cal(angle).*1.15,'k--');
plot(angle-1, BLD_GRNF_cal(angle).*0.85, 'k--')
hold off;
%title(strcat('IF',IF_NO, '  Ref. Cal. for Bloodstain on GRNF'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ref. truth','Cal. ref.','115% of cal. ref.','85% of cal. ref.')

%% J substrate only
angle=[];
ROI_J_cal = zeros(25,1);
for angle_lowLimit = 2:18
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_JOnly;
    if isempty(nonzeros(ROI_Target_cut))
        ROI_RF_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        ROI_J_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end

figure();hold on;grid on;
plot(angle-1, J_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, ROI_J_cal(angle),'b*-');
plot(angle-1, ROI_J_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, ROI_J_cal(angle).*1.15,'k--');
plot(angle-1, ROI_J_cal(angle).*0.85, 'k--')
hold off;
%title(strcat('IF',IF_NO, '  Ref. Cal. for J'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ref. truth','Cal. ref.','115% of cal. ref.','85% of cal. ref.')

%% BLD on J
angle=[];
BLD_J_cal = zeros(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_BLD_J;
    if isempty(nonzeros(ROI_Target_cut))
        BLD_J_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        BLD_J_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end

figure();hold on;grid on;
plot(angle-1, BLD_J_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, BLD_J_cal(angle),'b*-');
plot(angle-1, BLD_J_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, BLD_J_cal(angle).*1.15,'k--');
plot(angle-1, BLD_J_cal(angle).*0.85, 'k--')
hold off;
%title(strcat('IF',IF_NO, '  Ref. Cal. for Bloodstain on J'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ref. truth','Cal. ref.','115% of cal. ref.','85% of cal. ref.')

%% WC substrate only
angle=[];
ROI_WC_cal = zeros(25,1);
for angle_lowLimit = 5:20
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_WCOnly;
    if isempty(nonzeros(ROI_Target_cut))
        ROI_RF_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        ROI_WC_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end
figure();hold on;grid on;
plot(angle-1, WC_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, ROI_WC_cal(angle),'b*-');
plot(angle-1, ROI_WC_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, ROI_WC_cal(angle).*1.15,'k--');
plot(angle-1, ROI_WC_cal(angle).*0.85, 'k--')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for WC'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','WC calibrated','115% of Cal. Ref.','85% of Cal. Ref.')

%% BLD on WC 
angle=[];
BLD_WC_cal = zeros(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_BLD_WC;
    if isempty(nonzeros(ROI_Target_cut))
        BLD_WC_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        BLD_WC_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end

figure();hold on;grid on;
plot(angle-1, BLD_WC_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, BLD_WC_cal(angle),'b*-');
plot(angle-1, BLD_WC_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, BLD_WC_cal(angle).*1.15,'k--');
plot(angle-1, BLD_WC_cal(angle).*0.85, 'k--')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for Bloodstain on WC'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','Blood on WC calibrated','115% of Cal. Ref.','85% of Cal. Ref.')

%% W substrate only
angle=[];
ROI_W_cal = zeros(25,1);
for angle_lowLimit = 5:20
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_WOnly;
    if isempty(nonzeros(ROI_Target_cut))
        ROI_RF_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        ROI_W_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end

figure();hold on;grid on;
plot(angle-1, W_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, ROI_W_cal(angle),'b*-');
plot(angle-1, ROI_W_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, ROI_W_cal(angle).*1.15,'k--');
plot(angle-1, ROI_W_cal(angle).*0.85, 'k--')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for W'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','W calibrated','115% of Cal. Ref.','85% of Cal. Ref.')

%% BLD on W
angle=[];
BLD_W_cal = zeros(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_BLD_W;
    if isempty(nonzeros(ROI_Target_cut))
        BLD_W_cal(angle_lowLimit+1) = 99;
    else
        angle = [angle; angle_lowLimit+1];
        BLD_W_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end

figure();hold on;grid on;
plot(angle-1, BLD_W_CWL_Evl(angle),'-*','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
%plot(angle-1, BLD_W_cal(angle),'b*-');
plot(angle-1, BLD_W_cal(angle),'-s','LineWidth',1.5,'Color',[0.5 0.5 0.5]);
plot(angle-1, BLD_W_cal(angle).*1.15,'k--');
plot(angle-1, BLD_W_cal(angle).*0.85, 'k--')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for Bloodstain on W'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','Blood on W calibrated','115% of Cal. Ref.','85% of Cal. Ref.')

%% detection performance (AUC) vs. AoV


%% RBD vs. AoV 
%% RF
%RBD_BLD_RF = I_RBD.*ROI_BLD_RF;
I_RBD = zeros(2748,3840);
I_RBD(7:2744, 1:3700) = RBD_value_update;

[m,n]=size(ROI_BLD_RF);
 I_RBD_shp = reshape(I_RBD,[m*n,1]);
angle=[];
RBD_BLD_RF_AOV = cell(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, ROI_BLD_RF);
    
    %ROI_Target_cut = Radial_Cut_I.*ROI_BLD_W;
    if isempty(nonzeros(Radial_Cut_I))
        RBD_BLD_RF_AOV{angle_lowLimit+1} = [];
    else
        angle = [angle; angle_lowLimit+1];
        idx = find(Radial_Cut_I>0);
        RBD_BLD_RF_AOV{angle_lowLimit+1} = I_RBD_shp(idx);
        %mean(nonzeros(ROI_Target_cut));
    end
end

RBD_group = cell2mat(RBD_BLD_RF_AOV);
angle_grp=[];
for i =1:length(angle)
angle_grp = [angle_grp; angle(i)*ones(length(RBD_BLD_RF_AOV{angle(i)}),1)]
end

figure;
boxplot(RBD_group, angle_grp)
title('RBD Value for Bloodstains on RF');
xlabel('Half AOV (degree)');ylabel('RBD value');


%% GF
%RBD_BLD_GF = I_RBD.*ROI_BLD_RF;
%[m,n]=size(ROI_BLD_RF);
 %I_RBD_shp = reshape(I_RBD,[m*n,1]);
angle=[];
RBD_BLD_GF_AOV = cell(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, ROI_BLD_GF);%ROI_BLD_GF, ROI_GFOnly
    
    %ROI_Target_cut = Radial_Cut_I.*ROI_BLD_W;
    if isempty(nonzeros(Radial_Cut_I))
        RBD_BLD_GF_AOV{angle_lowLimit+1} = [];
    else
        angle = [angle; angle_lowLimit+1];
        idx = find(Radial_Cut_I>0);
        RBD_BLD_GF_AOV{angle_lowLimit+1} = I_RBD_shp(idx);
        %mean(nonzeros(ROI_Target_cut));
    end
end

RBD_GF_group = cell2mat(RBD_BLD_GF_AOV);
angle_GF_grp=[];
for i =1:length(angle)
angle_GF_grp = [angle_GF_grp; angle(i)*ones(length(RBD_BLD_GF_AOV{angle(i)}),1)]
end

figure;
boxplot(RBD_GF_group, angle_GF_grp)
title('RBD Value for Bloodstains on GF');
xlabel('Half AOV (degree)');ylabel('RBD value');

%% WP
%RBD_BLD_GF = I_RBD.*ROI_BLD_RF;
%[m,n]=size(ROI_BLD_RF);
 %I_RBD_shp = reshape(I_RBD,[m*n,1]);
angle=[];
RBD_BLD_WP_AOV = cell(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, ROI_BLD_WP);
    
    %ROI_Target_cut = Radial_Cut_I.*ROI_BLD_W;
    if isempty(nonzeros(Radial_Cut_I))
        RBD_BLD_WP_AOV{angle_lowLimit+1} = [];
    else
        angle = [angle; angle_lowLimit+1];
        idx = find(Radial_Cut_I>0);
        RBD_BLD_WP_AOV{angle_lowLimit+1} = I_RBD_shp(idx);
        %mean(nonzeros(ROI_Target_cut));
    end
end

RBD_WP_group = cell2mat(RBD_BLD_WP_AOV);
angle_WP_grp=[];
for i =1:length(angle)
angle_WP_grp = [angle_WP_grp; angle(i)*ones(length(RBD_BLD_WP_AOV{angle(i)}),1)]
end

figure;
boxplot(RBD_WP_group, angle_WP_grp)
title('RBD Value for Bloodstains on WP');
xlabel('Half AOV (degree)');ylabel('RBD value');

%% BC
%RBD_BLD_GF = I_RBD.*ROI_BLD_RF;
%[m,n]=size(ROI_BLD_RF);
 %I_RBD_shp = reshape(I_RBD,[m*n,1]);
angle=[];
RBD_BLD_BC_AOV = cell(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, ROI_BLD_BC);
    
    %ROI_Target_cut = Radial_Cut_I.*ROI_BLD_W;
    if isempty(nonzeros(Radial_Cut_I))
        RBD_BLD_BC_AOV{angle_lowLimit+1} = [];
    else
        angle = [angle; angle_lowLimit+1];
        idx = find(Radial_Cut_I>0);
        RBD_BLD_BC_AOV{angle_lowLimit+1} = I_RBD_shp(idx);
        %mean(nonzeros(ROI_Target_cut));
    end
end

RBD_BC_group = cell2mat(RBD_BLD_BC_AOV);
angle_BC_grp=[];
for i =1:length(angle)
angle_BC_grp = [angle_BC_grp; angle(i)*ones(length(RBD_BLD_BC_AOV{angle(i)}),1)]
end

figure;
boxplot(RBD_BC_group, angle_BC_grp)
title('RBD Value for Bloodstains on BC');
xlabel('Half AOV (degree)');ylabel('RBD value');
%% GRNF
%RBD_BLD_GF = I_RBD.*ROI_BLD_RF;
%[m,n]=size(ROI_BLD_RF);
 %I_RBD_shp = reshape(I_RBD,[m*n,1]);
angle=[];
RBD_BLD_GRNF_AOV = cell(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, ROI_BLD_GRNF);
    
    %ROI_Target_cut = Radial_Cut_I.*ROI_BLD_W;
    if isempty(nonzeros(Radial_Cut_I))
        RBD_BLD_GRNF_AOV{angle_lowLimit+1} = [];
    else
        angle = [angle; angle_lowLimit+1];
        idx = find(Radial_Cut_I>0);
        RBD_BLD_GRNF_AOV{angle_lowLimit+1} = I_RBD_shp(idx);
        %mean(nonzeros(ROI_Target_cut));
    end
end

RBD_GRNF_group = cell2mat(RBD_BLD_GRNF_AOV);
angle_GRNF_grp=[];
for i =1:length(angle)
angle_GRNF_grp = [angle_GRNF_grp; angle(i)*ones(length(RBD_BLD_GRNF_AOV{angle(i)}),1)]
end

figure;
boxplot(RBD_GRNF_group, angle_GRNF_grp)
title('RBD Value for Bloodstains on GRNF');
xlabel('Half AOV (degree)');ylabel('RBD value');

%% J
%RBD_BLD_GF = I_RBD.*ROI_BLD_RF;
%[m,n]=size(ROI_BLD_RF);
 %I_RBD_shp = reshape(I_RBD,[m*n,1]);
angle=[];
RBD_BLD_J_AOV = cell(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, ROI_BLD_J);
    
    %ROI_Target_cut = Radial_Cut_I.*ROI_BLD_W;
    if isempty(nonzeros(Radial_Cut_I))
        RBD_BLD_J_AOV{angle_lowLimit+1} = [];
    else
        angle = [angle; angle_lowLimit+1];
        idx = find(Radial_Cut_I>0);
        RBD_BLD_J_AOV{angle_lowLimit+1} = I_RBD_shp(idx);
        %mean(nonzeros(ROI_Target_cut));
    end
end

RBD_J_group = cell2mat(RBD_BLD_J_AOV);
angle_J_grp=[];
for i =1:length(angle)
angle_J_grp = [angle_J_grp; angle(i)*ones(length(RBD_BLD_J_AOV{angle(i)}),1)]
end

figure;
boxplot(RBD_J_group, angle_J_grp)
title('RBD Value for Bloodstains on J');
xlabel('Half AOV (degree)');ylabel('RBD value');
%% WC
%RBD_BLD_GF = I_RBD.*ROI_BLD_RF;
%[m,n]=size(ROI_BLD_RF);
 %I_RBD_shp = reshape(I_RBD,[m*n,1]);
angle=[];
RBD_BLD_WC_AOV = cell(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, ROI_BLD_WC);
    
    %ROI_Target_cut = Radial_Cut_I.*ROI_BLD_W;
    if isempty(nonzeros(Radial_Cut_I))
        RBD_BLD_WC_AOV{angle_lowLimit+1} = [];
    else
        angle = [angle; angle_lowLimit+1];
        idx = find(Radial_Cut_I>0);
        RBD_BLD_WC_AOV{angle_lowLimit+1} = I_RBD_shp(idx);
        %mean(nonzeros(ROI_Target_cut));
    end
end

RBD_WC_group = cell2mat(RBD_BLD_WC_AOV);
angle_WC_grp=[];
for i =1:length(angle)
angle_WC_grp = [angle_WC_grp; angle(i)*ones(length(RBD_BLD_WC_AOV{angle(i)}),1)]
end

figure;
boxplot(RBD_WC_group, angle_WC_grp)
title('RBD Value for Bloodstains on WC');
xlabel('Half AOV (degree)');ylabel('RBD value');
%% BF
%RBD_BLD_GF = I_RBD.*ROI_BLD_RF;
%[m,n]=size(ROI_BLD_RF);
 %I_RBD_shp = reshape(I_RBD,[m*n,1]);
angle=[];
RBD_BLD_BF_AOV = cell(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, ROI_BLD_BF);
    
    %ROI_Target_cut = Radial_Cut_I.*ROI_BLD_W;
    if isempty(nonzeros(Radial_Cut_I))
        RBD_BLD_BF_AOV{angle_lowLimit+1} = [];
    else
        angle = [angle; angle_lowLimit+1];
        idx = find(Radial_Cut_I>0);
        RBD_BLD_BF_AOV{angle_lowLimit+1} = I_RBD_shp(idx);
        %mean(nonzeros(ROI_Target_cut));
    end
end

RBD_BF_group = cell2mat(RBD_BLD_BF_AOV);
angle_BF_grp=[];
for i =1:length(angle)
angle_BF_grp = [angle_BF_grp; angle(i)*ones(length(RBD_BLD_BF_AOV{angle(i)}),1)]
end

figure;
boxplot(RBD_BF_group, angle_BF_grp)
title('RBD Value for Bloodstains on BF');
xlabel('Half AOV (degree)');ylabel('RBD value');

%% W
%RBD_BLD_GF = I_RBD.*ROI_BLD_RF;
%[m,n]=size(ROI_BLD_RF);
 %I_RBD_shp = reshape(I_RBD,[m*n,1]);
angle=[];
RBD_BLD_W_AOV = cell(25,1);
for angle_lowLimit = 0:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, ROI_BLD_W);
    
    %ROI_Target_cut = Radial_Cut_I.*ROI_BLD_W;
    if isempty(nonzeros(Radial_Cut_I))
        RBD_BLD_W_AOV{angle_lowLimit+1} = [];
    else
        angle = [angle; angle_lowLimit+1];
        idx = find(Radial_Cut_I>0);
        RBD_BLD_W_AOV{angle_lowLimit+1} = I_RBD_shp(idx);
        %mean(nonzeros(ROI_Target_cut));
    end
end

RBD_W_group = cell2mat(RBD_BLD_W_AOV);
angle_W_grp=[];
for i =1:length(angle)
angle_W_grp = [angle_W_grp; angle(i)*ones(length(RBD_BLD_W_AOV{angle(i)}),1)]
end

figure;
boxplot(RBD_W_group, angle_W_grp)
title('RBD Value for Bloodstains on W');
xlabel('Half AOV (degree)');ylabel('RBD value');



%{
WhiteLineFabric_ref_true = Reflectance_WhiteLineFabric_CWL_Evl(15:17)';
WhiteLineFabric_ref_cal = [mean(nonzeros(Im_ref.*Target_BW15)),mean(nonzeros(Im_ref.*Target_BW16)),mean(nonzeros(Im_ref.*Target_BW17))];

save(strcat('IF',IF_NO, '_WhiteLineFabric_ref_true'), 'WhiteLineFabric_ref_true');
save(strcat('IF',IF_NO, '_WhiteLineFabric_ref_cal'), 'WhiteLineFabric_ref_cal');

%plot figure
load('IF450_WhiteLineFabric_ref_cal.mat');
load('IF450_WhiteLineFabric_ref_true.mat');
IF450_WhiteLineFabric_ref_cal = WhiteLineFabric_ref_cal;
IF450_WhiteLineFabric_ref_true = WhiteLineFabric_ref_true; 
load('IF500_WhiteLineFabric_ref_cal.mat');
load('IF500_WhiteLineFabric_ref_true.mat');
IF500_WhiteLineFabric_ref_cal = WhiteLineFabric_ref_cal;
IF500_WhiteLineFabric_ref_true = WhiteLineFabric_ref_true; 
load('IF550_WhiteLineFabric_ref_cal.mat');
load('IF550_WhiteLineFabric_ref_true.mat');
IF550_WhiteLineFabric_ref_cal = WhiteLineFabric_ref_cal;
IF550_WhiteLineFabric_ref_true = WhiteLineFabric_ref_true; 
load('IF600_WhiteLineFabric_ref_cal.mat');
load('IF600_WhiteLineFabric_ref_true.mat');
IF600_WhiteLineFabric_ref_cal = WhiteLineFabric_ref_cal;
IF600_WhiteLineFabric_ref_true = WhiteLineFabric_ref_true; 
load('IF650_WhiteLineFabric_ref_cal.mat');
load('IF650_WhiteLineFabric_ref_true.mat');
IF650_WhiteLineFabric_ref_cal = WhiteLineFabric_ref_cal;
IF650_WhiteLineFabric_ref_true = WhiteLineFabric_ref_true; 
load('IF660_WhiteLineFabric_ref_cal.mat');
load('IF660_WhiteLineFabric_ref_true.mat');
IF660_WhiteLineFabric_ref_cal = WhiteLineFabric_ref_cal;
IF660_WhiteLineFabric_ref_true = WhiteLineFabric_ref_true;
load('IF750_WhiteLineFabric_ref_cal.mat');
load('IF750_WhiteLineFabric_ref_true.mat');
IF750_WhiteLineFabric_ref_cal = WhiteLineFabric_ref_cal;
IF750_WhiteLineFabric_ref_true = WhiteLineFabric_ref_true;
load('IF800_WhiteLineFabric_ref_cal.mat');
load('IF800_WhiteLineFabric_ref_true.mat');
IF800_WhiteLineFabric_ref_cal = WhiteLineFabric_ref_cal;
IF800_WhiteLineFabric_ref_true = WhiteLineFabric_ref_true;
load('IF850_WhiteLineFabric_ref_cal.mat');
load('IF850_WhiteLineFabric_ref_true.mat');
IF850_WhiteLineFabric_ref_cal = WhiteLineFabric_ref_cal;
IF850_WhiteLineFabric_ref_true = WhiteLineFabric_ref_true;

figure();hold on; grid on;
h1=plot([450 500 550 600 650 660 750 800 850], [IF450_WhiteLineFabric_ref_true(1), IF500_WhiteLineFabric_ref_true(1), IF550_WhiteLineFabric_ref_true(1), IF600_WhiteLineFabric_ref_true(1), IF650_WhiteLineFabric_ref_true(1), IF660_WhiteLineFabric_ref_true(1),IF750_WhiteLineFabric_ref_true(1),IF800_WhiteLineFabric_ref_true(1),IF850_WhiteLineFabric_ref_true(1)],'k*-');
h2=plot([450 500 550 600 650 660 750 800 850], [IF450_WhiteLineFabric_ref_cal(1), IF500_WhiteLineFabric_ref_cal(1), IF550_WhiteLineFabric_ref_cal(1), IF600_WhiteLineFabric_ref_cal(1), IF650_WhiteLineFabric_ref_cal(1), IF660_WhiteLineFabric_ref_cal(1),IF750_WhiteLineFabric_ref_cal(1),IF800_WhiteLineFabric_ref_cal(1),IF850_WhiteLineFabric_ref_cal(1)],'b*-');

plot([450 500 550 600 650 660 750 800 850], [IF450_WhiteLineFabric_ref_true(2), IF500_WhiteLineFabric_ref_true(2), IF550_WhiteLineFabric_ref_true(2), IF600_WhiteLineFabric_ref_true(2), IF650_WhiteLineFabric_ref_true(2), IF660_WhiteLineFabric_ref_true(2),IF750_WhiteLineFabric_ref_true(2),IF800_WhiteLineFabric_ref_true(2),IF850_WhiteLineFabric_ref_true(2)],'ko-');
h3=plot([450 500 550 600 650 660 750 800 850], [IF450_WhiteLineFabric_ref_cal(2), IF500_WhiteLineFabric_ref_cal(2), IF550_WhiteLineFabric_ref_cal(2), IF600_WhiteLineFabric_ref_cal(2), IF650_WhiteLineFabric_ref_cal(2), IF660_WhiteLineFabric_ref_cal(2),IF750_WhiteLineFabric_ref_cal(2),IF800_WhiteLineFabric_ref_cal(2),IF850_WhiteLineFabric_ref_cal(2)],'bo-');

plot([450 500 550 600 650 660 750 800 850], [IF450_WhiteLineFabric_ref_true(3), IF500_WhiteLineFabric_ref_true(3), IF550_WhiteLineFabric_ref_true(3), IF600_WhiteLineFabric_ref_true(3), IF650_WhiteLineFabric_ref_true(3), IF660_WhiteLineFabric_ref_true(3),IF750_WhiteLineFabric_ref_true(3),IF800_WhiteLineFabric_ref_true(3),IF850_WhiteLineFabric_ref_true(3)],'ks-');
h4=plot([450 500 550 600 650 660 750 800 850], [IF450_WhiteLineFabric_ref_cal(3), IF500_WhiteLineFabric_ref_cal(3), IF550_WhiteLineFabric_ref_cal(3), IF600_WhiteLineFabric_ref_cal(3), IF650_WhiteLineFabric_ref_cal(3), IF660_WhiteLineFabric_ref_cal(3),IF750_WhiteLineFabric_ref_cal(3),IF800_WhiteLineFabric_ref_cal(3),IF850_WhiteLineFabric_ref_cal(3)],'bs-');
xlabel('Wavelength (nm)');ylabel('Reflectance');title('White Line Fabric Ref. Cal.')
legend([h1, h2, h3, h4],{'Ground truth','Half AOV 14°','Half AOV 15°','Hlaf AOV 16°'});
hold off;
%}