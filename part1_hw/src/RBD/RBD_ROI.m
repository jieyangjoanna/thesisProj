
path_GT = '../../data/blood ground truth/';
addpath(path_GT);
load RF_x_NoSubPix_1
load RF_x_NoSubPix_2
load RF_x_NoSubPix_3
load RF_x_NoSubPix_4
load RF_x_NoSubPix_5
load RF_x_NoSubPix_6
load RF_x_NoSubPix_7
load RF_x_NoSubPix_8
load RF_x_NoSubPix_9
load RF_x_NoSubPix_10
load RF_x_NoSubPix_11
load RF_x_NoSubPix_12
load RF_x_NoSubPix_13
load RF_x_NoSubPix_14
load RF_x_NoSubPix_15
load RF_x_NoSubPix_16
load RF_x_NoSubPix_17
load RF_x_NoSubPix_18

load RF_y_NoSubPix_1
load RF_y_NoSubPix_2
load RF_y_NoSubPix_3
load RF_y_NoSubPix_4
load RF_y_NoSubPix_5
load RF_y_NoSubPix_6
load RF_y_NoSubPix_7
load RF_y_NoSubPix_8
load RF_y_NoSubPix_9
load RF_y_NoSubPix_10
load RF_y_NoSubPix_11
load RF_y_NoSubPix_12
load RF_y_NoSubPix_13
load RF_y_NoSubPix_14
load RF_y_NoSubPix_15
load RF_y_NoSubPix_16
load RF_y_NoSubPix_17
load RF_y_NoSubPix_18



[m,n]=size(I_RBD);
GT = zeros(m,n);
for i = 1:18
    GT = GT + roipoly(I_RBD, eval(strcat('RF_x_NoSubPix_',num2str(i))), eval(strcat('RF_y_NoSubPix_',num2str(i))));
end

GT_ROI = GT;


path_ketchup_GT = '../../data/Ketchup ground truth/';
addpath(path_ketchup_GT);
load K_RF_x_1
load K_RF_x_2
load K_RF_x_3
load K_RF_x_4
load K_RF_x_5
load K_RF_x_6
load K_RF_x_7
load K_RF_x_8
load K_RF_x_9
load K_RF_x_10
load K_RF_x_11
load K_RF_x_12
load K_RF_x_13
load K_RF_x_14
load K_RF_x_15
load K_RF_x_16
load K_RF_x_17
load K_RF_x_18

load K_RF_y_1
load K_RF_y_2
load K_RF_y_3
load K_RF_y_4
load K_RF_y_5
load K_RF_y_6
load K_RF_y_7
load K_RF_y_8
load K_RF_y_9
load K_RF_y_10
load K_RF_y_11
load K_RF_y_12
load K_RF_y_13
load K_RF_y_14
load K_RF_y_15
load K_RF_y_16
load K_RF_y_17
load K_RF_y_18

[m,n]=size(I_RBD);
K_GT = zeros(m,n);
for i = 1:18
    K_GT = K_GT + roipoly(I_RBD, eval(strcat('K_RF_x_',num2str(i))), eval(strcat('K_RF_y_',num2str(i))));
end

function [ ] = RBD_ROI(I_MSI, I_RBD, GT_ROI )
% RBD_ROI calculates RBD values on each region of interest.
%   I_MSI is the input original multispectral image, this image is used to
%   subset ROI. 
%   I_RBD is the RBD value image, each value is double type.
%   GT_ROI is bloodstains ground truth on this particular ROI

figure();imshow(I_MSI,[]);
ROI = double(image_subsetting(I_MSI,1));% ROI outter
ROI_Mid = double(image_subsetting(I_MSI,1));
ROI_Inner = double(image_subsetting(I_MSI,1));
ROI = ROI + ROI_Mid + ROI_Inner;

idx_ROI = find(ROI>0);
RBD_ROI = ROI.*I_RBD;
RBD_ROI = reshape(RBD_ROI,[m*n,1]);

idx_GT = find(GT_ROI>0);
RBD_GT_ROI = GT_ROI.*I_RBD;
RBD_GT_ROI = reshape(RBD_GT_ROI,[m*n,1]);

idx_non_blood = setdiff(idx_ROI, idx_GT);

figure();hold on;grid on;
plot(ones(length(idx_non_blood),1), RBD_ROI(idx_non_blood),'*')
plot(10*ones(length(idx_GT),1), RBD_GT_ROI(idx_GT),'r*');

end

%% modeled RBD
e = 0.00;
lambda = 350:2500;
spec = 400-350+1:1000-350+1;

path_IF = '../../data/IF_T/';
addpath(path_IF);
load IF_T_850nm
IF_T_850 = Vq;
load IF_T_550nm
IF_T_550 = Vq;
load IF_T_690nm
IF_T_690 = Vq;

path_spectra = '../../data/Integrared Spectra/';
addpath(path_spectra);
filename = fullfile('Integrated Spectra','BloodOnRedFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
for i=1:250
ref_cor_550(i) = spectrum(spec)'*IF_T_550(:,i)/trapz(IF_T_550(:,i));
ref_cor_690(i) = spectrum(spec)'*IF_T_690(:,i)/trapz(IF_T_690(:,i));
ref_cor_850(i) = spectrum(spec)'*IF_T_850(:,i)/trapz(IF_T_850(:,i));% hlaf AoV
end
I8_blood_REDFELT = Index3_Index4_VIS_Idx8(BS_550, ref_cor_550', BS_850, ref_cor_850', BS_690, ref_cor_690');
figure();
plot(350:2500, spectrum);

%% measured RBD
% bloodstains on RF
path_cal_panel = '../../data/20180416_cal_panel/';
addpath(path_cal_panel);
load 04162018_IF550_2_correct_alignedto690_ref_RegTo_04162018_IF690_noCalPanel_correct
Ref550 = Recovered;
GT_550 = GT_ROI.*Ref550;
figure();imshow(GT_550,[])

load 04162018_IF690_correct_ref_RegTo_04162018_IF690_noCalPanel_correct
Ref690 = Recovered;
GT_690 = GT_ROI.*Ref690;
figure();imshow(GT_690,[])

load 04162018_IF850_correct_alignedto690_ref_RegTo_04162018_IF690_noCalPanel_correct
Ref850 = Recovered;
figure();imshow(Ref850,[])
GT_850 = GT_ROI.*Recovered;
figure();imshow(GT_850,[])

%% conclusion
% Ref. of bloodstains at 550nm and 690 nm are within tolerance, but ref. of
% 850 nm are too high, resulting decrese of RBD of bloodstains. The high
% ref. of 850 nm is due to blurring from surrounding high ref. of red felt
% at 850 nm. 
% this should be able to validate via ref. of red felt and ref. of ketchup
% at 850 nm.

%% ref felt validation

filename = fullfile('Integrated Spectra','RedFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
for i=1:250
ref_cor_550(i) = spectrum(spec)'*IF_T_550(:,i)/trapz(IF_T_550(:,i));
ref_cor_690(i) = spectrum(spec)'*IF_T_690(:,i)/trapz(IF_T_690(:,i));
ref_cor_850(i) = spectrum(spec)'*IF_T_850(:,i)/trapz(IF_T_850(:,i));% hlaf AoV
end
I8_blood_REDFELT = Index3_Index4_VIS_Idx8(BS_550, ref_cor_550', BS_850, ref_cor_850', BS_690, ref_cor_690');
figure();title('Red felt')
plot(350:2500, spectrum);


load RF_x
load RF_y
ROI_RF = roipoly(I_RBD, RF_x, RF_y);
figure();imshow(ROI_RF,[])
RF_550 = ROI_RF.*Ref550;
figure();imshow(RF_550,[])
RF_690 = ROI_RF.*Ref690;
figure();imshow(RF_690,[])
RF_850 = ROI_RF.*Ref850;
figure();imshow(RF_850,[])

RBD_RF = ROI_RF.*I_RBD;

idx_RF = find(ROI_RF>0);
RBD_RF = reshape(RBD_RF,[m*n,1]);

figure();hold on;
plot(ones(length(idx_non_blood),1), RBD_ROI(idx_non_blood),'*')
plot(10*ones(length(idx_GT),1), RBD_GT_ROI(idx_GT),'r*');
plot(20*ones(length(idx_RF),1), RBD_RF(idx_RF),'g*')
grid on;title('Measured RBD')

% ground truth
filename = fullfile('Integrated Spectra','RedFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
for i=1:250
ref_cor_550(i) = spectrum(spec)'*IF_T_550(:,i)/trapz(IF_T_550(:,i));
ref_cor_690(i) = spectrum(spec)'*IF_T_690(:,i)/trapz(IF_T_690(:,i));
ref_cor_850(i) = spectrum(spec)'*IF_T_850(:,i)/trapz(IF_T_850(:,i));% hlaf AoV
end
I8_REDFELT = Index3_Index4_VIS_Idx8(BS_550, ref_cor_550', BS_850, ref_cor_850', BS_690, ref_cor_690');
figure();plot(350:2500, spectrum);title('RF spectra')
%% conclusion: RF measured RBD does not change much as modeled RBD, because each reflectance band does not change much

%% ketchup, its measured RBD should spread large

RBD_K_RF = K_GT.*I_RBD;
idx_K_RF = find(K_GT>0);
RBD_K_RF = reshape(RBD_K_RF,[m*n,1]);


figure();hold on;grid on;title('Measured RBD')
plot(ones(length(idx_non_blood),1), RBD_ROI(idx_non_blood),'*')
plot(10*ones(length(idx_GT),1), RBD_GT_ROI(idx_GT),'r*');
plot(20*ones(length(idx_RF),1), RBD_RF(idx_RF),'g*')
plot(30*ones(length(idx_K_RF),1), RBD_K_RF(idx_K_RF),'b*')

filename = fullfile('Integrated Spectra','KetchupOnRedFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
for i=1:250
ref_cor_550(i) = spectrum(spec)'*IF_T_550(:,i)/trapz(IF_T_550(:,i));
ref_cor_690(i) = spectrum(spec)'*IF_T_690(:,i)/trapz(IF_T_690(:,i));
ref_cor_850(i) = spectrum(spec)'*IF_T_850(:,i)/trapz(IF_T_850(:,i));% hlaf AoV
end
I8_K_REDFELT = Index3_Index4_VIS_Idx8(BS_550, ref_cor_550', BS_850, ref_cor_850', BS_690, ref_cor_690');
figure();plot(350:2500, spectrum);title('Ketchup on RF spectra')
