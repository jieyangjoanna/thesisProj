%10252017
%Jie Yang, data processing for OE Journal first paper
%same volume (1ml) of blood and substances on various substrates

clearvars; close all; clc;
lambda = 350:2500;
path_BS = '../../data/BS_2ndEdition/';
addpath(path_BS);
lambda_filter = dlmread('RBD_index8_Wavelength_Round_1MLAll_MSI.txt','',1,0);
BS_Ave_M = dlmread('BlueShiftAverage_2ndEdition.txt', '', 1,0);%blue shift
%angle = BS_Ave_M(:,1);
BS_Ave = round(BS_Ave_M(:,2));

e = 0.00;% reflectance accuracy

AOV= length(BS_Ave);

%%%%%%%%%%%%%%%%%%%%       1ML  On  Black Cotton         %%%%%%%%%%%%%%%%%%%%%%
path_spectra = '../../data/';
addpath(path_spectra);
filename = fullfile('Integrated Spectra','BloodOnBlackCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_blood_BLKCOTN = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

figure();hold on;
plot(350:2500, spectrum);

filename = fullfile('Integrated Spectra','ColaOnBlackCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_CO_BLKCOTN = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','CoffeeOnBlackCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_COF_BLKCOTN = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','KetchupOnBlackCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_K_BLKCOTN = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0,(UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','OrangeJuiceOnBlackCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_OJ_BLKCOTN = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','RedWineOnBlackCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_RW_BLKCOTN = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','TeaOnBlackCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_T_BLKCOTN = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','blackCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_BLKCOTN = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');
%}
%%%%%%%%%%%%%%%%%%%%%%%% 1ML  On  Black Felt  %%%%%%%%%%%%%
filename = fullfile('Integrated Spectra','BloodOnBlackFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(2,1)+BS_Ave;
x2 = lambda_filter(2,2)+BS_Ave;
x0 = lambda_filter(2,3)+BS_Ave;
I8_blood_BLKFELT = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

plot(350:2500, spectrum);

filename = fullfile('Integrated Spectra','ColaOnBlackFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_CO_BLKFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','CoffeeOnBlackFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_COF_BLKFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','KetchupOnBlackFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_K_BLKFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0,(UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','OrangeJuiceOnBlackFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_OJ_BLKFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','RedWineOnBlackFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_RW_BLKFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','TeaOnBlackFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_T_BLKFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','BlackFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_BLKFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');


%%%%%%%%%%%%%%%%%%%%%% 1ML On Gray Felt   %%%%%%%%%%%%%%%%%%%
filename = fullfile('Integrated Spectra','BloodOnGrayFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(3,1)+BS_Ave;
x2 = lambda_filter(3,2)+BS_Ave;
x0 = lambda_filter(3,3)+BS_Ave;
I8_blood_GRYFELT = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

plot(350:2500, spectrum);

filename = fullfile('Integrated Spectra','ColaOnGrayFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_CO_GRYFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','CoffeeOnGrayFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_COF_GRYFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','KetchupOnGrayFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_K_GRYFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0,(UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','OrangeJuiceOnGrayFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_OJ_GRYFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','RedWineOnGrayFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_RW_GRYFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','TeaOnGrayFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_T_GRYFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','GrayFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_GRYFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 1ML on Green Felt  %%%%%%%%%%%%%
filename = fullfile('Integrated Spectra','BloodOnGreenFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(4,1)+BS_Ave;
x2 = lambda_filter(4,2)+BS_Ave;
x0 = lambda_filter(4,3)+BS_Ave;
I8_blood_GRNFELT = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

plot(350:2500, spectrum);

filename = fullfile('Integrated Spectra','ColaOnGreenFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_CO_GRNFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','CoffeeOnGreenFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_COF_GRNFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','KetchupOnGreenFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_K_GRNFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0,(UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','OrangeJuiceOnGreenFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_OJ_GRNFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','RedWineOnGreenFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_RW_GRNFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','TeaOnGreenFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_T_GRNFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','GreenFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_GRNFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');
%}

%%%%%%%%%%%%%%%%%% 1ML On Red Felt  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = fullfile('Integrated Spectra','BloodOnRedFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(5,1)+BS_Ave;
x2 = lambda_filter(5,2)+BS_Ave;
x0 = lambda_filter(5,3)+BS_Ave;
I8_blood_REDFELT = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

plot(350:2500, spectrum);

filename = fullfile('Integrated Spectra','ColaOnRedFEltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_CO_REDFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','CoffeeOnGreenFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_COF_REDFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','CoffeeOnRedFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_K_REDFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0,(UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','OrangeJuiceOnRedFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_OJ_REDFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','RedWineOnRedFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_RW_REDFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','TeaOnRedFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_T_REDFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','RedFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_REDFELT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%%%%%%%%%%%%%%%%%% 1ML On Jeans  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = fullfile('Integrated Spectra','BloodOnJeansMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(5,1)+BS_Ave;
x2 = lambda_filter(5,2)+BS_Ave;
x0 = lambda_filter(5,3)+BS_Ave;
I8_blood_JEANS = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

plot(350:2500, spectrum);

filename = fullfile('Integrated Spectra','ColaOnJeansMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_CO_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','CoffeeOnGreenFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_COF_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','CoffeeOnJeansMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_K_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0,(UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','OrangeJuiceOnJeansMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_OJ_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','RedWineOnJeansMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_RW_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','TeaOnJeansMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_T_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','JeansMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');


%%%%%%%%%%%%%%%%%% 1ML On White Cotton %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = fullfile('Integrated Spectra','BloodOnWhiteCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(6,1)+BS_Ave;
x2 = lambda_filter(6,2)+BS_Ave;
x0 = lambda_filter(6,3)+BS_Ave;
I8_blood_WhiteCotn = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

plot(350:2500, spectrum);

filename = fullfile('Integrated Spectra','ColaOnWhiteCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_CO_WhiteCotn = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','CoffeeOnGreenFeltMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_COF_WhiteCotn = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','KetchupOnWhiteCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_K_WhiteCotn = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0,(UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','OrangeJuiceOnWhiteCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_OJ_WhiteCotn = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','RedWineOnWhiteCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_RW_WhiteCotn = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','TeaOnWhiteCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_T_WhiteCotn = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','WhiteCotnMean_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_WhiteCotn = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%%%%%%%%%%%%%%%%%% 1ML On White Poly %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = fullfile('Integrated Spectra','BloodOnWhitePolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(7,1)+BS_Ave;
x2 = lambda_filter(7,2)+BS_Ave;
x0 = lambda_filter(7,3)+BS_Ave;
I8_blood_WhitePoly = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

plot(350:2500, spectrum);

filename = fullfile('Integrated Spectra','ColaOnWhitePolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_CO_WhitePoly = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','CoffeeOnPolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_COF_WhitePoly = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','KetchupOnWhitePolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_K_WhitePoly = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0,(UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','OrangeJuiceOnWhitePolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_OJ_WhitePoly = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','RedWineOnPolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_RW_WhitePoly = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','TeaOnWhitePolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_T_WhitePoly = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','PolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_WhitePoly = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%%%%%%%%%%%%%%%%%% 1ML On Wood %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
filename = fullfile('Integrated Spectra','BloodOnWoodMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(7,1)+BS_Ave;
x2 = lambda_filter(7,2)+BS_Ave;
x0 = lambda_filter(7,3)+BS_Ave;
I8_blood_WOOD = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

plot(350:2500, spectrum);
xlim([350 1000]);
hold off;
legend('Black cotton','Black felt','Gray felt','Green felt','Red felt','Jeans','White cotton','White polyester','Wood');
grid on;
xlabel('Wavelength(nm)');ylabel('Reflectance');

filename = fullfile('Integrated Spectra','ColaOnWoodMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_CO_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','CoffeeOnWoodMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_COF_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','KetchupOnWoodMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_K_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0,(UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','OrangeJuiceOnWoodMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_OJ_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','RedWineOnWoodMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_RW_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','TeaOnWoodMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_T_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile('Integrated Spectra','WOODMean_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');


%%%%%%%%%%%%%%% PLOT FIGURE  %%%%%%%%%%%%%%%%%%%%%%%%
figure('color', 'w'); hold on;
ax=gca;
ax.FontSize=14;
plot(10.5*ones(1,length(-4.5:0.005:2)), -4.5:0.005:2, 'k-');
plot(20.5*ones(1,length(-4.5:0.005:2)), -4.5:0.005:2, 'k-');
plot(30.5*ones(1,length(-4.5:0.005:2)), -4.5:0.005:2, 'k-');
plot(40.5*ones(1,length(-4.5:0.005:2)), -4.5:0.005:2, 'k-');
plot(50.5*ones(1,length(-4.5:0.005:2)), -4.5:0.005:2, 'k-');
plot(60.5*ones(1,length(-4.5:0.005:2)), -4.5:0.005:2, 'k-');
plot(70.5*ones(1,length(-4.5:0.005:2)), -4.5:0.005:2, 'k-');
plot(80.5*ones(1,length(-4.5:0.005:2)), -4.5:0.005:2, 'k-');
plot(90.5*ones(1,length(-4.5:0.005:2)), -4.5:0.005:2, 'k-');

%title('Blood Separation from Confusors');
xlabel('Substrate representation');ylabel('RBD value');
xlim([0 91]);
ylim ([-1 1.2]);

h(7)= scatter(1*ones(250,1), -I8_blood_BLKCOTN, 'r', 'filled');
h(8) = scatter(1*ones(250,1), -I8_BLKCOTN, 'go','filled');

h(1) = plot(2*ones(250,1), -I8_CO_BLKCOTN, 'k*');
h(2) = plot(3*ones(250,1), -I8_COF_BLKCOTN, 'k+');
h(3) = plot(4*ones(250,1), -I8_K_BLKCOTN, 'ks');
h(4) = plot(5*ones(250,1), -I8_OJ_BLKCOTN, 'kd');
h(5) = plot(6*ones(250,1), -I8_RW_BLKCOTN, 'kv');
h(6) = plot(7*ones(250,1), -I8_T_BLKCOTN, 'k<');
%}
h(7)=scatter(11*ones(250,1), -I8_blood_BLKFELT, 'r', 'filled');
h(8)=scatter(11*ones(250,1), -I8_BLKFELT,'go','filled');

h(1) = plot(12*ones(250,1), -I8_CO_BLKFELT, 'k*');
h(2) = plot(13*ones(250,1), -I8_COF_BLKFELT, 'k+');
h(3) = plot(14*ones(250,1), -I8_K_BLKFELT, 'ks');
h(4) = plot(15*ones(250,1), -I8_OJ_BLKFELT, 'kd');
h(5) = plot(16*ones(250,1), -I8_RW_BLKFELT, 'kv');
h(6) = plot(17*ones(250,1), -I8_T_BLKFELT, 'k<');



scatter(21*ones(250,1), -I8_blood_GRYFELT, 'r', 'filled');
scatter(21*ones(250,1),-I8_GRYFELT,'go','filled');

h(1) = plot(22*ones(250,1), -I8_CO_GRYFELT, 'k*');
h(2) = plot(23*ones(250,1), -I8_COF_GRYFELT, 'k+');
h(3) = plot(24*ones(250,1), -I8_K_GRYFELT, 'ks');
h(4) = plot(25*ones(250,1), -I8_OJ_GRYFELT, 'kd');
h(5) = plot(26*ones(250,1), -I8_RW_GRYFELT, 'kv');
h(6) = plot(27*ones(250,1), -I8_T_GRYFELT, 'k<');

scatter(31*ones(250,1), -I8_blood_GRNFELT, 'r', 'filled');
scatter(31*ones(250,1), -I8_GRNFELT, 'go','filled');

h(1) = plot(32*ones(250,1), -I8_CO_GRNFELT, 'k*');
h(2) = plot(33*ones(250,1), -I8_COF_GRNFELT, 'k+');
h(3) = plot(34*ones(250,1), -I8_K_GRNFELT, 'ks');
h(4) = plot(36*ones(250,1), -I8_OJ_GRNFELT, 'kd');
h(5) = plot(37*ones(250,1), -I8_RW_GRNFELT, 'kv');
h(6) = plot(38*ones(250,1), -I8_T_GRNFELT, 'k<');
%}

scatter(41*ones(250,1), -I8_blood_REDFELT, 'r', 'filled');
scatter(41*ones(250,1),-I8_REDFELT,'go','filled');

h(1) = plot(42*ones(250,1), -I8_CO_REDFELT, 'k*');
h(2) = plot(43*ones(250,1), -I8_COF_REDFELT, 'k+');
h(3) = plot(44*ones(250,1), -I8_K_REDFELT, 'ks');
h(4) = plot(45*ones(250,1), -I8_OJ_REDFELT, 'kd');
h(5) = plot(46*ones(250,1), -I8_RW_REDFELT, 'kv');
h(6) = plot(47*ones(250,1), -I8_T_REDFELT, 'k<');

scatter(51*ones(250,1), -I8_blood_JEANS, 'r', 'filled');
scatter(51*ones(250,1),-I8_JEANS,'go','filled');

h(1) = plot(52*ones(250,1), -I8_CO_JEANS, 'k*');
h(2) = plot(53*ones(250,1), -I8_COF_JEANS, 'k+');
h(3) = plot(54*ones(250,1), -I8_K_JEANS, 'ks');
h(4) = plot(55*ones(250,1), -I8_OJ_JEANS, 'kd');
h(5) = plot(56*ones(250,1), -I8_RW_JEANS, 'kv');
h(6) = plot(57*ones(250,1), -I8_T_JEANS, 'k<');

scatter(61*ones(250,1), -I8_blood_WhiteCotn, 'r', 'filled');
scatter(61*ones(250,1), -I8_WhiteCotn,'go','filled');

h(1) = plot(62*ones(250,1), -I8_CO_WhiteCotn, 'k*');
h(2) = plot(63*ones(250,1), -I8_COF_WhiteCotn, 'k+');
h(3) = plot(64*ones(250,1), -I8_K_WhiteCotn, 'ks');
h(4) = plot(65*ones(250,1), -I8_OJ_WhiteCotn, 'kd');
h(5) = plot(66*ones(250,1), -I8_RW_WhiteCotn, 'kv');
h(6) = plot(67*ones(250,1), -I8_T_WhiteCotn, 'k<');


scatter(71*ones(250,1), -I8_blood_WhitePoly, 'r', 'filled');
scatter(71*ones(250,1),-I8_WhitePoly, 'go','filled');

h(1) = plot(72*ones(250,1), -I8_CO_WhitePoly, 'k*');
h(2) = plot(73*ones(250,1), -I8_COF_WhitePoly, 'k+');
h(3) = plot(74*ones(250,1), -I8_K_WhitePoly, 'ks');
h(4) = plot(75*ones(250,1), -I8_OJ_WhitePoly, 'kd');
h(5) = plot(76*ones(250,1), -I8_RW_WhitePoly, 'kv');
h(6) = plot(77*ones(250,1), -I8_T_WhitePoly, 'k<');

scatter(81*ones(250,1), -I8_blood_WOOD, 'r', 'filled');
scatter(81*ones(250,1),-I8_WOOD, 'go','filled');

h(1) = plot(82*ones(250,1), -I8_CO_WOOD, 'k*');
h(2) = plot(83*ones(250,1), -I8_COF_WOOD, 'k+');
h(3) = plot(84*ones(250,1), -I8_K_WOOD, 'ks');
h(4) = plot(85*ones(250,1), -I8_OJ_WOOD, 'kd');
h(5) = plot(86*ones(250,1), -I8_RW_WOOD, 'kv');
h(6) = plot(87*ones(250,1), -I8_T_WOOD, 'k<');
 

ah1 = gca;
legend(ah1, h([7 8]), 'Blood', 'Substrate');
set(legend, 'FontSize', 10);
ah2 = axes('position', get(gca, 'position'), 'visible','off');
legend(ah2, h([1 2 3]), 'Cola', 'Coffee', 'Ketchup');
ah3 = axes('position',get(gca, 'position'),'visible','off');
legend(ah3, h([4 5 6]), 'Orange juice', 'Red wine', 'Tea');
set(legend, 'FontSize', 10);

mTB1 = uicontrol('style', 'text');% mTextBox1 = mTB1
set(mTB1, 'String', 'BC')
set(mTB1, 'Units', 'Characters')
set(mTB1, 'FontSize', 10)
set(mTB1, 'Position', [14 5 5 2])
set(mTB1, 'BackgroundColor', [1 1 1])
%}

mTB6 = uicontrol('style', 'text');
set(mTB6, 'String', 'BF')
set(mTB6, 'Units', 'Characters')
set(mTB6, 'FontSize', 10)
set(mTB6, 'Position', [24 5 5 2])
set(mTB6, 'BackgroundColor', [1 1 1])

mTB12 = uicontrol('style', 'text');
set(mTB12, 'String', 'GF')%gray felt
set(mTB12, 'Units', 'Characters')
set(mTB12, 'FontSize', 10)
set(mTB12, 'Position', [33 5 5 2])
set(mTB12, 'BackgroundColor', [1 1 1])
 
mTB27 = uicontrol('style', 'text');
set(mTB27, 'String', 'GRNF')
set(mTB27, 'Units', 'Characters')
set(mTB27, 'FontSize', 10)
set(mTB27, 'Position', [41 26 5 2])
set(mTB27, 'BackgroundColor', [1 1 1])


 mTB24 = uicontrol('style', 'text');
set(mTB24, 'String', 'RF')
set(mTB24, 'Units', 'Characters')
set(mTB24, 'FontSize', 10)
set(mTB24, 'Position', [50 26 5 2.2])
set(mTB24, 'BackgroundColor', [1 1 1])
%}

mTB26 = uicontrol('style', 'text');
set(mTB26, 'String', 'J')
set(mTB26, 'Units', 'Characters')
set(mTB26, 'FontSize', 10)
set(mTB26, 'Position', [58 26 5 2])
set(mTB26, 'BackgroundColor', [1 1 1])

mTB28 = uicontrol('style', 'text');
set(mTB28, 'String', 'WC')
set(mTB28, 'Units', 'Characters')
set(mTB28, 'FontSize', 10)
set(mTB28, 'Position', [67 26 5 2])
set(mTB28, 'BackgroundColor', [1 1 1])

mTB29 = uicontrol('style', 'text');
set(mTB29, 'String', 'WP')
set(mTB29, 'Units', 'Characters')
set(mTB29, 'FontSize', 10)
set(mTB29, 'Position', [75 5 5 2])
set(mTB29, 'BackgroundColor', [1 1 1])

mTB29 = uicontrol('style', 'text');
set(mTB29, 'String', 'W')
set(mTB29, 'Units', 'Characters')
set(mTB29, 'FontSize', 10)
set(mTB29, 'Position', [83 5 5 2])
set(mTB29, 'BackgroundColor', [1 1 1])
%}
%%
%Another way to plot data
%------------------------------------------------------------
figure();
subplot(5,2,1); hold on
plot(0.1:0.1:25, -I8_blood_BLKCOTN, 'ro', 'MarkerSize',2);
plot(0.1:0.1:25, -I8_CO_BLKCOTN, 'k*', 'MarkerSize',2);
plot(0.1:0.1:25, -I8_COF_BLKCOTN,'k+', 'MarkerSize',2);
plot(0.1:0.1:25, -I8_K_BLKCOTN, 'ks','MarkerSize',2);
plot(0.1:0.1:25, -I8_OJ_BLKCOTN, 'kd', 'MarkerSize',2);
plot(0.1:0.1:25, -I8_RW_BLKCOTN, 'kv','MarkerSize',2);
plot(0.1:0.1:25, -I8_T_BLKCOTN, 'k<','MarkerSize',2);
plot(0.1:0.1:25, -I8_BLKCOTN, 'go', 'MarkerSize',2);
ylim([-1 1.2]);xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('BC', 'FontSize',10)

subplot(5,2,2);hold on;
h1=plot(0.1:0.1:25, -I8_blood_BLKFELT,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_CO_BLKFELT', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_COF_BLKFELT', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_K_BLKFELT', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_OJ_BLKFELT', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_RW_BLKFELT', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_T_BLKFELT', 'k<','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_BLKFELT,'go','MarkerSize',2)
ylim([-1 1.2]);xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('BF', 'FontSize',10)

subplot(5,2,3); hold on
plot(0.1:0.1:25, -I8_blood_GRYFELT', 'ro','MarkerSize',2) 
plot(0.1:0.1:25, -I8_CO_GRYFELT', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_COF_GRYFELT', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_K_GRYFELT', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_OJ_GRYFELT', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_RW_GRYFELT', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_T_GRYFELT', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_GRYFELT','go','MarkerSize',2)
ylim([-1 1.2]);xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('GF','FontSize',10)

subplot(5,2,4);hold on
plot(0.1:0.1:25, -I8_blood_GRNFELT', 'ro','MarkerSize',2)
plot(0.1:0.1:25, -I8_CO_GRNFELT', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_COF_GRNFELT', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_K_GRNFELT', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_OJ_GRNFELT', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_RW_GRNFELT', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_T_GRNFELT', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_GRNFELT', 'go','MarkerSize',2)
ylim([-1 1.2]);xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('GRNF','FontSize',10)

subplot(5,2,5);hold on
plot(0.1:0.1:25, -I8_blood_REDFELT', 'ro','MarkerSize',2)
plot(0.1:0.1:25, -I8_CO_REDFELT', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_COF_REDFELT', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_K_REDFELT', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_OJ_REDFELT', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_RW_REDFELT', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_T_REDFELT', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_REDFELT', 'go','MarkerSize',2)
ylim([-1 1.2]);xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('RF','FontSize',10)



subplot(5,2,6);hold on;
plot(0.1:0.1:25, -I8_blood_JEANS', 'ro','MarkerSize',2)
plot(0.1:0.1:25, -I8_CO_JEANS', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_COF_JEANS', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_K_JEANS', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_OJ_JEANS', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_RW_JEANS', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_T_JEANS', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_JEANS','go','MarkerSize',2)
ylim([-1 1.2]);xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('J','FontSize',10)

subplot(5,2,7);hold on
plot(0.1:0.1:25, -I8_blood_WhiteCotn', 'ro','MarkerSize',2)
plot(0.1:0.1:25, -I8_CO_WhiteCotn', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_COF_WhiteCotn', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_K_WhiteCotn', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_OJ_WhiteCotn', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_RW_WhiteCotn', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_T_WhiteCotn', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_WhiteCotn','go','MarkerSize',2)
ylim([-1 1.2]);xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('WC','FontSize',10)

subplot(5,2,8);hold on
plot(0.1:0.1:25, -I8_blood_WhitePoly', 'ro','Markersize',2) 
plot(0.1:0.1:25, -I8_CO_WhitePoly', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_COF_WhitePoly', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_K_WhitePoly', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_OJ_WhitePoly', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_RW_WhitePoly', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_T_WhitePoly', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_WhitePoly','go','MarkerSize',2)
ylim([-1 1.2]);xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('WP','FontSize',10)

subplot(5,2,9);hold on
plot(1:250, -I8_blood_WOOD', 'ro','MarkerSize',2)
plot(1:250, -I8_CO_WOOD', 'k*','MarkerSize',2)
plot(1:250, -I8_COF_WOOD', 'k+','MarkerSize',2)
plot(1:250, -I8_K_WOOD', 'ks','MarkerSize',2)
plot(1:250, -I8_OJ_WOOD', 'kd','MarkerSize',2)
plot(1:250, -I8_RW_WOOD', 'kv','MarkerSize',2)
plot(1:250, -I8_T_WOOD', 'k<','MarkerSize',2)
plot(1:250, -I8_WOOD','go','MarkerSize',2)
ylim([-1 1.2]);xlim([0 250]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('W','FontSize',10)

legend([h1,h2,h3],{'Bloodstain','Substance','Substrate'})
%subtitle('RBD Values for Various Substances on Varoiues Substrates')

