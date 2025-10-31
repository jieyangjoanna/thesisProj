%%05/03/2018
% JYang

%% This script is used to plot the same RBD graph as the modeled RBD data published in first journal paper.
%% instead of using the ASD spectra, this script uses measured RBD image

%% Bloodstain ground truth
path_GT = '../../data/blood ground truth/';
addpath(path_GT);
[ROI_BLD_RF, ROI_BLD_GF, ROI_BLD_WP, ROI_BLD_BC, ROI_BLD_GRNF, ROI_BLD_J, ROI_BLD_WC, ROI_BLD_W, ROI_BLD_BF]=BloodGroundTruth(I_MSI);
BloodTruth = ROI_BLD_RF + ROI_BLD_GF + ROI_BLD_WP + ROI_BLD_BC + ROI_BLD_GRNF + ROI_BLD_J + ROI_BLD_WC + ROI_BLD_W + ROI_BLD_BF;
figure();imshow(BloodTruth,[])

%% single band ref.
path_cal_panel = '../../data/20180416_cal_panel/';
addpath(path_cal_panel);
load 04162018_IF550_2_correct_alignedto690_ref_RegTo_04162018_IF690_noCalPanel_correct
Ref550 = Recovered;
figure();imshow(Ref550,[])
load 04162018_IF690_correct_ref_RegTo_04162018_IF690_noCalPanel_correct
Ref690 = Recovered;

load 04162018_IF850_correct_alignedto690_ref_RegTo_04162018_IF690_noCalPanel_correct
Ref850 = Recovered;
figure();imshow(Ref850,[])

%% ref. padding
Im_ref550 = zeros(2748,3840);
Im_ref550(7:2744, 1:3700) = Ref550;

Im_ref690 = zeros(2748,3840);
Im_ref690(7:2744, 1:3700) = Ref690;

Im_ref850 = zeros(2748,3840);
Im_ref850(7:2744, 1:3700) = Ref850;
%% red felt ROI, the ROI should only include red felt, without empty earas between fabric or drawing pins, etc.
path_data = '../../data/ROIs/';
addpath(path_data);
load ROI_RF
ROI_RF = ROI;

%% blood on RF
Ref550_BLD_RF = ROI_BLD_RF.*Im_ref550;
Ref690_BLD_RF = ROI_BLD_RF.*Im_ref690;
Ref850_BLD_RF = ROI_BLD_RF.*Im_ref850;

figure();hold on;
plot(550*ones(length(Ref550_BLD_RF),1), Ref550_BLD_RF,'g*')
plot(690*ones(length(Ref690_BLD_RF),1), Ref690_BLD_RF,'r*')
plot(850*ones(length(Ref850_BLD_RF),1), Ref850_BLD_RF,'b*')
%%

RBD_RF = ROI_RF.*Im_ref;
RBD_BLD_RF = ROI_BLD_RF.*I_RBD;

idx_RF = find(ROI_RF>0);
RBD_RF = reshape(RBD_RF,[m*n,1]);

idx_BLD_RF = find(ROI_BLD_RF>0);
RBD_BLD_RF = reshape(RBD_BLD_RF,[m*n,1]);

idx_NON_BLD_RF = setdiff(idx_RF, idx_BLD_RF);

figure();hold on;grid on;
plot(ones(length(idx_NON_BLD_RF),1), RBD_RF(idx_NON_BLD_RF),'*')
plot(10*ones(length(idx_BLD_RF),1), RBD_BLD_RF(idx_BLD_RF),'r*');


%% red felt non-blood
path_spectra = '../../data/Integrated Spectra/';
addpath(path_spectra);
filename = fullfile('Integrated Spectra','RedFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(strcat(path_spectra, filename), '', 0, 0);%noise incorporated reflectance spectrum
for i=1:250
ref_cor_550(i) = spectrum(spec)'*IF_T_550(:,i)/trapz(IF_T_550(:,i));
ref_cor_690(i) = spectrum(spec)'*IF_T_690(:,i)/trapz(IF_T_690(:,i));
ref_cor_850(i) = spectrum(spec)'*IF_T_850(:,i)/trapz(IF_T_850(:,i));% hlaf AoV
end
I8_blood_REDFELT = Index3_Index4_VIS_Idx8(BS_550, ref_cor_550', BS_850, ref_cor_850', BS_690, ref_cor_690');
figure();title('Red felt')
plot(350:2500, spectrum);


path_ROIs = '../../data/ROIs/substrateOnly/';
addpath(path_ROIs);
load RF_x
load RF_y
RF = roipoly(I_RBD, RF_x, RF_y);
figure();imshow(RF,[])
RF_550 = RF.*Ref550;
figure();imshow(RF_550,[])
RF_690 = RF.*Ref690;
figure();imshow(RF_690,[])
RF_850 = RF.*Ref850;
figure();imshow(RF_850,[])


%%               
%load 04162018_correct_falseColor_registered_RBD
path_RBD = '../../data/RBD/';
addpath(path_RBD);
load 04162018_correct_RegTo_04162018_IF690_noCalPanel_scaled_RBD
I_RBD = RBD_value_Index8;
RBD_RF = RF.*I_RBD;
figure();imshow(RBD_RF,[0 1])

idx_RF = find(RF>0);
RBD_RF = reshape(RBD_RF,[m*n,1]);

figure();hold on;grid on;
plot(20*ones(length(idx_RF),1), RBD_RF(idx_RF),'g*')
plot(10*ones(length(idx_BLD_RF),1), RBD_BLD_RF(idx_BLD_RF),'r*');

%% gray felt
ROI_GF_Inner = double(image_subsetting(I_MSI,1));% ROI outter
ROI_GF_Mid = double(image_subsetting(I_MSI,1));
ROI_GF_Outter = double(image_subsetting(I_MSI,1));
ROI_GF = ROI_GF_Inner + ROI_GF_Mid + ROI_GF_Outter;

RBD_GF = ROI_GF.*I_RBD;
RBD_BLD_GF = ROI_BLD_GF.*I_RBD;

idx_GF = find(ROI_GF>0);
RBD_GF = reshape(RBD_GF,[m*n,1]);

idx_BLD_GF = find(ROI_BLD_GF>0);
RBD_BLD_GF = reshape(RBD_BLD_GF,[m*n,1]);

idx_NON_BLD_GF = setdiff(idx_GF, idx_BLD_GF);

figure();hold on;grid on;
plot(ones(length(idx_NON_BLD_RF),1), RBD_RF(idx_NON_BLD_RF)/255,'b*')
plot(ones(length(idx_BLD_RF),1), RBD_BLD_RF(idx_BLD_RF)/255,'r*');

plot(10*ones(length(idx_NON_BLD_GF),1), RBD_GF(idx_NON_BLD_GF)/255,'b*')
plot(10*ones(length(idx_BLD_GF),1), RBD_BLD_GF(idx_BLD_GF)/255,'r*');

%% white poly
ROI_WP = double(image_subsetting(I_MSI,1));

RBD_WP = ROI_WP.*I_RBD;
RBD_BLD_WP = ROI_BLD_WP.*I_RBD;

idx_WP = find(ROI_WP>0);
RBD_WP = reshape(RBD_WP,[m*n,1]);

idx_BLD_WP = find(ROI_BLD_WP>0);
RBD_BLD_WP = reshape(RBD_BLD_WP,[m*n,1]);

idx_NON_BLD_WP = setdiff(idx_WP, idx_BLD_WP);

figure();hold on;grid on;
plot(ones(length(idx_NON_BLD_RF),1), RBD_RF(idx_NON_BLD_RF),'b*')
plot(ones(length(idx_BLD_RF),1), RBD_BLD_RF(idx_BLD_RF),'r*');

plot(10*ones(length(idx_NON_BLD_GF),1), RBD_GF(idx_NON_BLD_GF),'b*')
plot(10*ones(length(idx_BLD_GF),1), RBD_BLD_GF(idx_BLD_GF),'r*');

plot(20*ones(length(idx_NON_BLD_WP),1), RBD_WP(idx_NON_BLD_WP),'b*')
plot(20*ones(length(idx_BLD_WP),1), RBD_BLD_WP(idx_BLD_WP),'r*');

%% black cotton
ROI_BC_Inner = double(image_subsetting(I_MSI,1));
ROI_BC_Outter = double(image_subsetting(I_MSI,1));
ROI_BC = ROI_BC_Inner + ROI_BC_Outter;

RBD_BC = ROI_BC.*I_RBD;
RBD_BLD_BC = ROI_BLD_BC.*I_RBD;

idx_BC = find(ROI_BC>0);
RBD_BC = reshape(RBD_BC,[m*n,1]);

idx_BLD_BC = find(ROI_BLD_BC>0);
RBD_BLD_BC = reshape(RBD_BLD_BC,[m*n,1]);

idx_NON_BLD_BC = setdiff(idx_BC, idx_BLD_BC);

figure();hold on;grid on;
plot(ones(length(idx_NON_BLD_RF),1), RBD_RF(idx_NON_BLD_RF),'b*')
plot(ones(length(idx_BLD_RF),1), RBD_BLD_RF(idx_BLD_RF),'r*');

plot(10*ones(length(idx_NON_BLD_GF),1), RBD_GF(idx_NON_BLD_GF),'b*')
plot(10*ones(length(idx_BLD_GF),1), RBD_BLD_GF(idx_BLD_GF),'r*');

plot(30*ones(length(idx_NON_BLD_BC),1), RBD_BC(idx_NON_BLD_BC),'b*')
plot(30*ones(length(idx_BLD_BC),1), RBD_BLD_BC(idx_BLD_BC),'r*');

%% Green felt
ROI_GRNF_Inner = double(image_subsetting(I_MSI,1));% ROI outter
ROI_GRNF_Mid = double(image_subsetting(I_MSI,1));
ROI_GRNF_Outter = double(image_subsetting(I_MSI,1));
ROI_GRNF = ROI_GRNF_Inner + ROI_GRNF_Mid + ROI_GRNF_Outter;

RBD_GRNF = ROI_GRNF.*I_RBD;
RBD_BLD_GRNF = ROI_BLD_GRNF.*I_RBD;

idx_GRNF = find(ROI_GRNF>0);
RBD_GRNF = reshape(RBD_GRNF,[m*n,1]);

idx_BLD_GRNF = find(ROI_BLD_GRNF>0);
RBD_BLD_GRNF = reshape(RBD_BLD_GRNF,[m*n,1]);

idx_NON_BLD_GRNF = setdiff(idx_GRNF, idx_BLD_GRNF);

figure();hold on;grid on;
plot(ones(length(idx_NON_BLD_RF),1), RBD_RF(idx_NON_BLD_RF),'b*')
plot(ones(length(idx_BLD_RF),1), RBD_BLD_RF(idx_BLD_RF),'r*');

plot(10*ones(length(idx_NON_BLD_GF),1), RBD_GF(idx_NON_BLD_GF),'b*')
plot(10*ones(length(idx_BLD_GF),1), RBD_BLD_GF(idx_BLD_GF),'r*');

plot(30*ones(length(idx_NON_BLD_BC),1), RBD_BC(idx_NON_BLD_BC),'b*')
plot(30*ones(length(idx_BLD_BC),1), RBD_BLD_BC(idx_BLD_BC),'r*');

plot(40*ones(length(idx_NON_BLD_GRNF),1), RBD_GRNF(idx_NON_BLD_GRNF),'b*')
plot(40*ones(length(idx_BLD_GRNF),1), RBD_BLD_GRNF(idx_BLD_GRNF),'r*');

