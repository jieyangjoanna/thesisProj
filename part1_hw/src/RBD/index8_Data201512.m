%jie yang
%11/29/2017

clearvars; close all; clc;
lambda = 350:2500;
path_BS = '../../data/BS_2ndEdition/';
addpath(path_BS);
lambda_filter = dlmread('RBD_index8_Wavelength_Round_1MLAll_MSI.txt','',1,0);
BS_Ave_M = dlmread('BlueShiftAverage_2ndEdition.txt', '', 1,0);%blue shift
BS_Ave = round(BS_Ave_M(:,2));

e = 0.00;% reflectance accuracy

AOV= length(BS_Ave);
%%%%%%%%%%%% 4ml in petri dish
path_comp = '../../data/comparison_of_blood_and_non_blood/';
addpath(path_comp);
filename = fullfile(path_comp,'4BLD_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_4BLD_PETRI = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'AVD4_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4AVD_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO4PET_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4CO_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'C4_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4COF_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K4_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4K_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'OJ4_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4OJ_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'PD4_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4PD_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'RW4_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4RW_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'T4_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4T_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS4_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4TS_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp, 'PETRIREF_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%%%%%%%%%%%%%%  10ML in Petri Dish  %%%%%%%%%
filename = fullfile(path_comp,'10BLD_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_10BLD_PETRI = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'AVD10_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10AVD_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO10PET_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10CO_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'C10_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10COF_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K10_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10K_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'OJ10_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10OJ_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'PD10_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10PD_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'RW10_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10RW_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'T10_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10T_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS10_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10TS_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%%%%%%%%%%%%         18ML in Petri Dish        %%%%%%%%%%%%%%%%
filename = fullfile(path_comp,'18BLD_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_18BLD_PETRI = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'AVD18_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18AVD_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO18PET_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18CO_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'C18_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18COF_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K18_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18K_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'OJ18_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18OJ_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'PD18_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18PD_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'RW18_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18RW_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'T18_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18T_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS18_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18TS_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');
%%%%%%%%%%%%%      30ML in Petri Dish       %%%%%%%%%%%%%%%%
filename = fullfile(path_comp,'30BLD_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_30BLD_PETRI = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'AVD30_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30AVD_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO30PET_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30CO_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'C30_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30COF_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K30_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30K_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'OJ30_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30OJ_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'PD30_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30PD_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'RW30_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30RW_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'T30_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30T_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS30_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30TS_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');
%%%%%%%%%%%%%      40ML in Petri Dish       %%%%%%%%%%%%%%%%

filename = fullfile(path_comp,'40BLD_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_40BLD_PETRI = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'AVD40_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40AVD_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO40PET_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40CO_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'C40_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40COF_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K40_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40K_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'OJ40_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40OJ_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'PD40_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40PD_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'RW40_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40RW_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'T40_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40T_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS40_PETRI_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40TS_PETRI = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');
%%%%%%%%%%%%%%%%%   Black Felt   %%%%%%%%%%%%%%%%%%%%
%%%%%   4ML   %%%%
filename = fullfile(path_comp,'NBD4BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_4BLD_BLKF = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NAD4BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4AVD_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO4BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4CO_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCF4BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4COF_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NK4BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4K_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NOJ4BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4OJ_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NPD4BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4PD_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NRW4BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4RW_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NTE4BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4T_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NTS4BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4TS_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'BLKFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%%%%%%%%  10ML blood and confusors  %%%%%%%%%
filename = fullfile(path_comp,'NBD10BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_10BLD_BLKF = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NAD10BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10AVD_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO10BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10CO_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCF10BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10COF_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NK10BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10K_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NOJ10BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10OJ_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NPD10BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10PD_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NRW10BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10RW_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NTE10BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10T_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NTS10BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10TS_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');
%%%%%%%%  18ML blood and confusors  %%%%%%%%%
filename = fullfile(path_comp,'NBD18BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_18BLD_BLKF = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NAD18BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18AVD_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO18BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18CO_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCF18BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18COF_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K18BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18K_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NOJ18BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18OJ_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NPD18BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18PD_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NRW18BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18RW_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NTE18BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18T_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS18BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18TS_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');
%%%%%%%%  30ML blood and confusors  %%%%%%%%%
filename = fullfile(path_comp,'NBD30BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_30BLD_BLKF = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NAD30BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30AVD_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO30BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30CO_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCF30BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30COF_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K30BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30K_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NOJ30BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30OJ_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NPD30BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30PD_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NRW30BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30RW_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NTE30BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30T_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS30BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30TS_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');
%%%%%%%%  40ML blood and confusors  %%%%%%%%%
filename = fullfile(path_comp,'NBD40BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_40BLD_BLKF = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NAD40BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40AVD_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO40BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40CO_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCF40BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40COF_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K40BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40K_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NOJ40BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40OJ_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NPD40BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40PD_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NRW40BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40RW_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NTE40BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40T_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS40BLK_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40TS_BLKF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');
%%%%%%%%%%%%%%%%%   GREY Felt   %%%%%%%%%%%%%%%%%%%%
filename = fullfile(path_comp,'NBD4GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_4BLD_GRYF = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NAD4GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4AVD_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO4GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4CO_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCF4GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4COF_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NK4GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4K_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NOJ4GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4OJ_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NPD4GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4PD_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NRW4GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4RW_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NTE4GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4T_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NTS4GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4TS_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'GRYFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%%%%%%%%%%%%%%%%%   10 ml  %%%%%%%%%%%%%%%%%%%%
filename = fullfile(path_comp,'NBD10GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_10BLD_GRYF = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NAD10GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10AVD_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO10GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10CO_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCF10GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10COF_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NK10GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10K_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NOJ10GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10OJ_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NPD10GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10PD_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NRW10GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10RW_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NTE10GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10T_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NTS10GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_10TS_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');
%%%%%%%%%%%%%%%%%   18 ml  %%%%%%%%%%%%%%%%%%%%
filename = fullfile(path_comp,'NBD18GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_18BLD_GRYF = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NAD18GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18AVD_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO18GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18CO_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCF18GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18COF_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K18GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18K_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NOJ18GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18OJ_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NPD18GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18PD_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NRW18GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18RW_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NTE18GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18T_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS18GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_18TS_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');
%%%%%%%%%%%%%%%%%   30 ml  %%%%%%%%%%%%%%%%%%%%
filename = fullfile(path_comp,'NBD30GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_30BLD_GRYF = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NAD30GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30AVD_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO30GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30CO_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCF30GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30COF_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K30GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30K_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NOJ30GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30OJ_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NPD30GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30PD_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NRW30GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30RW_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NTE30GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30T_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS30GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_30TS_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');
%%%%%%%%%%%%%%%%%   40 ml  %%%%%%%%%%%%%%%%%%%%
filename = fullfile(path_comp,'NBD40GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_40BLD_GRYF = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NAD40GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40AVD_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO40GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40CO_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCF40GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40COF_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K40GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40K_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NOJ40GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40OJ_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NPD40GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40PD_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NRW40GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40RW_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NTE40GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40T_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS40GRY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_40TS_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');
%%%%%%%%%%%%%%%%%   RED Felt   %%%%%%%%%%%%%%%%%%%%
filename = fullfile(path_comp,'4blood_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_4BLD_REDF = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'AVD4_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4AVD_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO4RED_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4CO_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'C4_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4COF_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%filename = fullfile(path_comp,'NK40GRY_av_i.txt');
%spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
%I8_40K_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'OJ4_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4OJ_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'PD4_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4PD_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'RW4_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4RW_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'T4_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4T_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS2_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2TS_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%%%%%%%%%%%%%%%%%%%%%  8ml  %%%%%%%%%%%%%%%%%%%%%%%
filename = fullfile(path_comp,'8blood_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_8BLD_REDF = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'AVD8_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_8AVD_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO8RED_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_8CO_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'C8_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_8COF_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%filename = fullfile(path_comp,'NK40GRY_av_i.txt');
%spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
%I8_40K_GRYF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'OJ8_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_8OJ_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'PD8_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_8PD_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'RW8_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_8RW_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'T8_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_8T_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS4_REDFELT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_4TS_REDF = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');
%%%%%%%%%%%%%%%%%   Cotton T-shirt   %%%%%%%%%%%%%%%%%%%%
filename = fullfile(path_comp,'2blood_COTNTSHIT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_2BLD_COTNT = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'AVD2_WHICOTN_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2AVD_COTNT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO2CT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2CO_COTNT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'C2_WHICOTN_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2COF_COTNT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K2_WHICOTN_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2K_COTNT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'OJ2_WHICOTN_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2OJ_COTNT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'PD2_WHICOTN_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2PD_COTNT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'RW2_WHICOTN_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2RW_COTNT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'T2_WHICOTN_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2T_COTNT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS2_WHICOTN_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2TS_COTNT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'WHITCOTN_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_COTNT = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%%%%%%%%%%%%%%%%%   POLYESTER T-shirt   %%%%%%%%%%%%%%%%%%%%
filename = fullfile(path_comp,'2blood_POLY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_2BLD_POLY = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'AVD2_WHIPOLY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2AVD_POLY = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO2PT_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2CO_POLY = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'C2_WHIPOLY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2COF_POLY = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K2_WHIPOLY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2K_POLY = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'OJ2_WHIPOLY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2OJ_POLY = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'PD2_WHIPOLY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2PD_POLY = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'RW2_WHIPOLY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2RW_POLY = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'T2_WHIPOLY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2T_POLY = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS2_WHIPOLY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2TS_POLY = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'WHIPOLY_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_POLY = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%%%%%%%%%%%%%%%%%   JEANS   %%%%%%%%%%%%%%%%%%%%
filename = fullfile(path_comp,'2blood_JEANS_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_2BLD_JEANS = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'AVD2_JEANS_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2AVD_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO2J_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2CO_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'C2_JEANS_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2COF_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K2_JEANS_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2K_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'OJ2_JEANS_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2OJ_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'PD2_JEANS_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2PD_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'RW2_JEANS_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2RW_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'T2_JEANS_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2T_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS2_JEANS_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_2TS_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'JEAN_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_JEANS = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%%%%%%%%%%%%%%%%%   WOOD   %%%%%%%%%%%%%%%%%%%%
filename = fullfile(path_comp,'1blood_WOOD_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
x1 = lambda_filter(1,1)+BS_Ave;
x2 = lambda_filter(1,2)+BS_Ave;
x0 = lambda_filter(1,3)+BS_Ave;
I8_1BLD_WOOD = Index3_Index4_VIS_Idx8(x1,(UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'AVD1_WOOD_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_1AVD_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'NCO1W_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_1CO_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'C1_WOOD_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_1COF_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'K1_WOOD_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_1K_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'OJ1_WOOD_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_1OJ_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'PD1_WOOD_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_1PD_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'RW1_WOOD_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_1RW_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'T1_WOOD_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_1T_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'TS1_WOOD_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_1TS_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

filename = fullfile(path_comp,'WOODD2_av_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
I8_WOOD = Index3_Index4_VIS_Idx8(x1, (UniFilter(spectrum, AOV,x1))', x2, (UniFilter(spectrum, AOV,x2))', x0, (UniFilter(spectrum, AOV,x0))');

%%%%%%%%%%%%%%%  FIGURE %%%%%%%%%%%%%%%%%%%%%%%%

figure('color', 'w'); hold on;
ax=gca;
ax.FontSize=14;
plot(10.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(20.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(30.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(40.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(50.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(60.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(70.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(80.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(90.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(100.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(110.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(120.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(130.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(140.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(150.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(160.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(170.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(180.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(190.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(200.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
plot(210.5*ones(1,length(-4.5:0.005:2.2)), -4.5:0.005:2.2, 'k-');
%title('Blood Separation from Confusors');
xlabel('Substrate representation');ylabel('Index8');
xlim([0 211]);
ylim ([-1.5 2.2]);


h(10) = scatter(1*ones(250,1), -I8_4BLD_PETRI, 'r', 'filled');
h(11) = scatter(1*ones(250,1), -I8_PETRI, 'go','filled');

h(1) = plot(2*ones(250,1), -I8_4AVD_PETRI, 'k*');
h(2) = plot(3*ones(250,1), -I8_4CO_PETRI, 'k+');
h(3) = plot(4*ones(250,1), -I8_4COF_PETRI, 'ks');
h(4) = plot(5*ones(250,1), -I8_4K_PETRI, 'kd');
h(5) = plot(6*ones(250,1), -I8_4OJ_PETRI, 'kv');
h(6) = plot(7*ones(250,1), -I8_4PD_PETRI, 'k<');
h(7) = plot(8*ones(250,1), -I8_4RW_PETRI, 'k>');
h(8) = plot(9*ones(250,1), -I8_4T_PETRI,  'kh');
h(9) = plot(10*ones(250,1), -I8_4TS_PETRI, 'kp');


scatter(11*ones(250,1), -I8_10BLD_PETRI, 'r', 'filled');
scatter(11*ones(250,1), -I8_PETRI, 'go','filled');

h(1) = plot(12*ones(250,1), -I8_10AVD_PETRI, 'k*');
h(2) = plot(13*ones(250,1), -I8_10CO_PETRI, 'k+');
h(3) = plot(14*ones(250,1), -I8_10COF_PETRI, 'ks');
h(4) = plot(15*ones(250,1), -I8_10K_PETRI, 'kd');
h(5) = plot(16*ones(250,1), -I8_10OJ_PETRI, 'kv');
h(6) = plot(17*ones(250,1), -I8_10PD_PETRI, 'k<');
h(7) = plot(18*ones(250,1), -I8_10RW_PETRI, 'k>');
h(8) = plot(19*ones(250,1), -I8_10T_PETRI,  'kh');
h(9) = plot(20*ones(250,1), -I8_10TS_PETRI, 'kp');

scatter(21*ones(250,1), -I8_10BLD_PETRI, 'r', 'filled');
scatter(21*ones(250,1), -I8_PETRI, 'go','filled');

h(1) = plot(22*ones(250,1), -I8_18AVD_PETRI, 'k*');
h(2) = plot(23*ones(250,1), -I8_18CO_PETRI, 'k+');
h(3) = plot(24*ones(250,1), -I8_18COF_PETRI, 'ks');
h(4) = plot(25*ones(250,1), -I8_18K_PETRI, 'kd');
h(5) = plot(26*ones(250,1), -I8_18OJ_PETRI, 'kv');
h(6) = plot(27*ones(250,1), -I8_18PD_PETRI, 'k<');
h(7) = plot(28*ones(250,1), -I8_18RW_PETRI, 'k>');
h(8) = plot(29*ones(250,1), -I8_18T_PETRI,  'kh');
h(9) = plot(30*ones(250,1), -I8_18TS_PETRI, 'kp');

scatter(31*ones(250,1), -I8_30BLD_PETRI, 'r', 'filled');
scatter(31*ones(250,1), -I8_PETRI, 'go','filled');

h(1) = plot(32*ones(250,1), -I8_30AVD_PETRI, 'k*');
h(2) = plot(33*ones(250,1), -I8_30CO_PETRI, 'k+');
h(3) = plot(34*ones(250,1), -I8_30COF_PETRI, 'ks');
h(4) = plot(35*ones(250,1), -I8_30K_PETRI, 'kd');
h(5) = plot(36*ones(250,1), -I8_30OJ_PETRI, 'kv');
h(6) = plot(37*ones(250,1), -I8_30PD_PETRI, 'k<');
h(7) = plot(38*ones(250,1), -I8_30RW_PETRI, 'k>');
h(8) = plot(39*ones(250,1), -I8_30T_PETRI,  'kh');
h(9) = plot(40*ones(250,1), -I8_30TS_PETRI, 'kp');

scatter(41*ones(250,1), -I8_40BLD_PETRI, 'r', 'filled');
scatter(41*ones(250,1), -I8_PETRI, 'go','filled');

h(1) = plot(42*ones(250,1), -I8_40AVD_PETRI, 'k*');
h(2) = plot(43*ones(250,1), -I8_40CO_PETRI, 'k+');
h(3) = plot(44*ones(250,1), -I8_40COF_PETRI, 'ks');
h(4) = plot(45*ones(250,1), -I8_40K_PETRI, 'kd');
h(5) = plot(46*ones(250,1), -I8_40OJ_PETRI, 'kv');
h(6) = plot(47*ones(250,1), -I8_40PD_PETRI, 'k<');
h(7) = plot(48*ones(250,1), -I8_40RW_PETRI, 'k>');
h(8) = plot(49*ones(250,1), -I8_40T_PETRI,  'kh');
h(9) = plot(50*ones(250,1), -I8_40TS_PETRI, 'kp');


scatter(51*ones(250,1), -I8_4BLD_BLKF, 'r', 'filled');
scatter(51*ones(250,1), -I8_BLKF, 'go','filled');

h(1) = plot(52*ones(250,1), -I8_4AVD_BLKF, 'k*');
h(2) = plot(53*ones(250,1), -I8_4CO_BLKF, 'k+');
h(3) = plot(54*ones(250,1), -I8_4COF_BLKF, 'ks');
h(4) = plot(55*ones(250,1), -I8_4K_BLKF, 'kd');
h(5) = plot(56*ones(250,1), -I8_4OJ_BLKF, 'kv');
h(6) = plot(57*ones(250,1), -I8_4PD_BLKF, 'k<');
h(7) = plot(58*ones(250,1), -I8_4RW_BLKF, 'k>');
h(8) = plot(59*ones(250,1), -I8_4T_BLKF,  'kh');
h(9) = plot(60*ones(250,1), -I8_4TS_BLKF, 'kp');


scatter(61*ones(250,1), -I8_10BLD_BLKF, 'r', 'filled');
scatter(61*ones(250,1), -I8_BLKF, 'go','filled');

h(1) = plot(62*ones(250,1), -I8_10AVD_BLKF, 'k*');
h(2) = plot(63*ones(250,1), -I8_10CO_BLKF, 'k+');
h(3) = plot(64*ones(250,1), -I8_10COF_BLKF, 'ks');
h(4) = plot(65*ones(250,1), -I8_10K_BLKF, 'kd');
h(5) = plot(66*ones(250,1), -I8_10OJ_BLKF, 'kv');
h(6) = plot(67*ones(250,1), -I8_10PD_BLKF, 'k<');
h(7) = plot(68*ones(250,1), -I8_10RW_BLKF, 'k>');
h(8) = plot(69*ones(250,1), -I8_10T_BLKF,  'kh');
h(9) = plot(70*ones(250,1), -I8_10TS_BLKF, 'kp');

scatter(71*ones(250,1), -I8_18BLD_BLKF, 'r', 'filled');
scatter(71*ones(250,1), -I8_BLKF, 'go','filled');

h(1) = plot(72*ones(250,1), -I8_18AVD_BLKF, 'k*');
h(2) = plot(73*ones(250,1), -I8_18CO_BLKF, 'k+');
h(3) = plot(74*ones(250,1), -I8_18COF_BLKF, 'ks');
h(4) = plot(75*ones(250,1), -I8_18K_BLKF, 'kd');
h(5) = plot(76*ones(250,1), -I8_18OJ_BLKF, 'kv');
h(6) = plot(77*ones(250,1), -I8_18PD_BLKF, 'k<');
h(7) = plot(78*ones(250,1), -I8_18RW_BLKF, 'k>');
h(8) = plot(79*ones(250,1), -I8_18T_BLKF,  'kh');
h(9) = plot(80*ones(250,1), -I8_18TS_BLKF, 'kp');

scatter(81*ones(250,1), -I8_30BLD_BLKF, 'r', 'filled');
scatter(81*ones(250,1), -I8_BLKF, 'go','filled');

h(1) = plot(82*ones(250,1), -I8_30AVD_BLKF, 'k*');
h(2) = plot(83*ones(250,1), -I8_30CO_BLKF, 'k+');
h(3) = plot(84*ones(250,1), -I8_30COF_BLKF, 'ks');
h(4) = plot(85*ones(250,1), -I8_30K_BLKF, 'kd');
h(5) = plot(86*ones(250,1), -I8_30OJ_BLKF, 'kv');
h(6) = plot(87*ones(250,1), -I8_30PD_BLKF, 'k<');
h(7) = plot(88*ones(250,1), -I8_30RW_BLKF, 'k>');
h(8) = plot(89*ones(250,1), -I8_30T_BLKF,  'kh');
h(9) = plot(90*ones(250,1), -I8_30TS_BLKF, 'kp');

scatter(91*ones(250,1), -I8_40BLD_BLKF, 'r', 'filled');
scatter(91*ones(250,1), -I8_BLKF, 'go','filled');

h(1) = plot(92*ones(250,1), -I8_40AVD_BLKF, 'k*');
h(2) = plot(93*ones(250,1), -I8_40CO_BLKF, 'k+');
h(3) = plot(94*ones(250,1), -I8_40COF_BLKF, 'ks');
h(4) = plot(95*ones(250,1), -I8_40K_BLKF, 'kd');
h(5) = plot(96*ones(250,1), -I8_40OJ_BLKF, 'kv');
h(6) = plot(97*ones(250,1), -I8_40PD_BLKF, 'k<');
h(7) = plot(98*ones(250,1), -I8_40RW_BLKF, 'k>');
h(8) = plot(99*ones(250,1), -I8_40T_BLKF,  'kh');
h(9) = plot(100*ones(250,1), -I8_40TS_BLKF, 'kp');

scatter(101*ones(250,1), -I8_4BLD_GRYF, 'r', 'filled');
scatter(101*ones(250,1), -I8_GRYF, 'go','filled');

h(1) = plot(102*ones(250,1), -I8_4AVD_GRYF, 'k*');
h(2) = plot(103*ones(250,1), -I8_4CO_GRYF, 'k+');
h(3) = plot(104*ones(250,1), -I8_4COF_GRYF, 'ks');
h(4) = plot(105*ones(250,1), -I8_4K_GRYF, 'kd');
h(5) = plot(106*ones(250,1), -I8_4OJ_GRYF, 'kv');
h(6) = plot(107*ones(250,1), -I8_4PD_GRYF, 'k<');
h(7) = plot(108*ones(250,1), -I8_4RW_GRYF, 'k>');
h(8) = plot(109*ones(250,1), -I8_4T_GRYF,  'kh');
h(9) = plot(110*ones(250,1), -I8_4TS_GRYF, 'kp');

scatter(111*ones(250,1), -I8_10BLD_GRYF, 'r', 'filled');
scatter(111*ones(250,1), -I8_GRYF, 'go','filled');

h(1) = plot(112*ones(250,1), -I8_10AVD_GRYF, 'k*');
h(2) = plot(113*ones(250,1), -I8_10CO_GRYF, 'k+');
h(3) = plot(114*ones(250,1), -I8_10COF_GRYF, 'ks');
h(4) = plot(115*ones(250,1), -I8_10K_GRYF, 'kd');
h(5) = plot(116*ones(250,1), -I8_10OJ_GRYF, 'kv');
h(6) = plot(117*ones(250,1), -I8_10PD_GRYF, 'k<');
h(7) = plot(118*ones(250,1), -I8_10RW_GRYF, 'k>');
h(8) = plot(119*ones(250,1), -I8_10T_GRYF,  'kh');
h(9) = plot(120*ones(250,1), -I8_10TS_GRYF, 'kp');

scatter(121*ones(250,1), -I8_18BLD_GRYF, 'r', 'filled');
scatter(121*ones(250,1), -I8_GRYF, 'go','filled');

h(1) = plot(122*ones(250,1), -I8_18AVD_GRYF, 'k*');
h(2) = plot(123*ones(250,1), -I8_18CO_GRYF, 'k+');
h(3) = plot(124*ones(250,1), -I8_18COF_GRYF, 'ks');
h(4) = plot(125*ones(250,1), -I8_18K_GRYF, 'kd');
h(5) = plot(126*ones(250,1), -I8_18OJ_GRYF, 'kv');
h(6) = plot(127*ones(250,1), -I8_18PD_GRYF, 'k<');
h(7) = plot(128*ones(250,1), -I8_18RW_GRYF, 'k>');
h(8) = plot(129*ones(250,1), -I8_18T_GRYF,  'kh');
h(9) = plot(130*ones(250,1), -I8_18TS_GRYF, 'kp');

scatter(131*ones(250,1), -I8_30BLD_GRYF, 'r', 'filled');
scatter(131*ones(250,1), -I8_GRYF, 'go','filled');

h(1) = plot(132*ones(250,1), -I8_30AVD_GRYF, 'k*');
h(2) = plot(133*ones(250,1), -I8_30CO_GRYF, 'k+');
h(3) = plot(134*ones(250,1), -I8_30COF_GRYF, 'ks');
h(4) = plot(135*ones(250,1), -I8_30K_GRYF, 'kd');
h(5) = plot(136*ones(250,1), -I8_30OJ_GRYF, 'kv');
h(6) = plot(137*ones(250,1), -I8_30PD_GRYF, 'k<');
h(7) = plot(138*ones(250,1), -I8_30RW_GRYF, 'k>');
h(8) = plot(139*ones(250,1), -I8_30T_GRYF,  'kh');
h(9) = plot(140*ones(250,1), -I8_30TS_GRYF, 'kp');

scatter(141*ones(250,1), -I8_40BLD_GRYF, 'r', 'filled');
scatter(141*ones(250,1), -I8_GRYF, 'go','filled');

h(1) = plot(142*ones(250,1), -I8_40AVD_GRYF, 'k*');
h(2) = plot(143*ones(250,1), -I8_40CO_GRYF, 'k+');
h(3) = plot(144*ones(250,1), -I8_40COF_GRYF, 'ks');
h(4) = plot(145*ones(250,1), -I8_40K_GRYF, 'kd');
h(5) = plot(146*ones(250,1), -I8_40OJ_GRYF, 'kv');
h(6) = plot(147*ones(250,1), -I8_40PD_GRYF, 'k<');
h(7) = plot(148*ones(250,1), -I8_40RW_GRYF, 'k>');
h(8) = plot(149*ones(250,1), -I8_40T_GRYF,  'kh');
h(9) = plot(150*ones(250,1), -I8_40TS_GRYF, 'kp');


scatter(151*ones(250,1), -I8_4BLD_REDF, 'r', 'filled');
scatter(151*ones(250,1), -I8_REDF, 'go','filled');

h(1) = plot(152*ones(250,1), -I8_4AVD_REDF, 'k*');
h(2) = plot(153*ones(250,1), -I8_4CO_REDF, 'k+');
h(3) = plot(154*ones(250,1), -I8_4COF_REDF, 'ks');
%h(4) = plot(145*ones(250,1), -I8_2K_REDF, 'kd');
h(5) = plot(156*ones(250,1), -I8_4OJ_REDF, 'kv');
h(6) = plot(157*ones(250,1), -I8_4PD_REDF, 'k<');
h(7) = plot(158*ones(250,1), -I8_4RW_REDF, 'k>');
h(8) = plot(159*ones(250,1), -I8_4T_REDF,  'kh');
h(9) = plot(160*ones(250,1), -I8_2TS_REDF, 'kp');

scatter(161*ones(250,1), -I8_8BLD_REDF, 'r', 'filled');
scatter(161*ones(250,1), -I8_REDF, 'go','filled');

h(1) = plot(162*ones(250,1), -I8_8AVD_REDF, 'k*');
h(2) = plot(163*ones(250,1), -I8_8CO_REDF, 'k+');
h(3) = plot(164*ones(250,1), -I8_8COF_REDF, 'ks');
%h(4) = plot(165*ones(250,1), -I8_4K_REDF, 'kd');
h(5) = plot(166*ones(250,1), -I8_8OJ_REDF, 'kv');
h(6) = plot(167*ones(250,1), -I8_8PD_REDF, 'k<');
h(7) = plot(168*ones(250,1), -I8_8RW_REDF, 'k>');
h(8) = plot(169*ones(250,1), -I8_8T_REDF,  'kh');
h(9) = plot(170*ones(250,1), -I8_4TS_REDF, 'kp');

scatter(171*ones(250,1), -I8_2BLD_COTNT, 'r', 'filled');
scatter(171*ones(250,1), -I8_COTNT, 'go','filled');

h(1) = plot(172*ones(250,1), -I8_2AVD_COTNT, 'k*');
h(2) = plot(173*ones(250,1), -I8_2CO_COTNT, 'k+');
h(3) = plot(174*ones(250,1), -I8_2COF_COTNT, 'ks');
h(4) = plot(175*ones(250,1), -I8_2K_COTNT, 'kd');
h(5) = plot(176*ones(250,1), -I8_2OJ_COTNT, 'kv');
h(6) = plot(177*ones(250,1), -I8_2PD_COTNT, 'k<');
h(7) = plot(178*ones(250,1), -I8_2RW_COTNT, 'k>');
h(8) = plot(179*ones(250,1), -I8_2T_COTNT,  'kh');
h(9) = plot(180*ones(250,1), -I8_2TS_COTNT, 'kp');


scatter(181*ones(250,1), -I8_2BLD_POLY, 'r', 'filled');
scatter(181*ones(250,1), -I8_POLY, 'go','filled');

h(1) = plot(182*ones(250,1), -I8_2AVD_POLY, 'k*');
h(2) = plot(183*ones(250,1), -I8_2CO_POLY, 'k+');
h(3) = plot(184*ones(250,1), -I8_2COF_POLY, 'ks');
h(4) = plot(185*ones(250,1), -I8_2K_POLY, 'kd');
h(5) = plot(186*ones(250,1), -I8_2OJ_POLY, 'kv');
h(6) = plot(187*ones(250,1), -I8_2PD_POLY, 'k<');
h(7) = plot(188*ones(250,1), -I8_2RW_POLY, 'k>');
h(8) = plot(189*ones(250,1), -I8_2T_POLY,  'kh');
h(9) = plot(190*ones(250,1), -I8_2TS_POLY, 'kp');

scatter(191*ones(250,1), -I8_2BLD_JEANS, 'r', 'filled');
scatter(191*ones(250,1), -I8_JEANS, 'go','filled');

h(1) = plot(192*ones(250,1), -I8_2AVD_JEANS, 'k*');
h(2) = plot(193*ones(250,1), -I8_2CO_JEANS, 'k+');
h(3) = plot(194*ones(250,1), -I8_2COF_JEANS, 'ks');
h(4) = plot(195*ones(250,1), -I8_2K_JEANS, 'kd');
h(5) = plot(196*ones(250,1), -I8_2OJ_JEANS, 'kv');
h(6) = plot(197*ones(250,1), -I8_2PD_JEANS, 'k<');
h(7) = plot(198*ones(250,1), -I8_2RW_JEANS, 'k>');
h(8) = plot(199*ones(250,1), -I8_2T_JEANS,  'kh');
h(9) = plot(200*ones(250,1), -I8_2TS_JEANS, 'kp');



scatter(201*ones(250,1), -I8_1BLD_WOOD, 'r', 'filled');
scatter(201*ones(250,1), -I8_WOOD, 'go','filled');

h(1) = plot(202*ones(250,1), -I8_1AVD_WOOD, 'k*');
h(2) = plot(203*ones(250,1), -I8_1CO_WOOD, 'k+');
h(3) = plot(204*ones(250,1), -I8_1COF_WOOD, 'ks');
h(4) = plot(205*ones(250,1), -I8_1K_WOOD, 'kd');
h(5) = plot(206*ones(250,1), -I8_1OJ_WOOD, 'kv');
h(6) = plot(207*ones(250,1), -I8_1PD_WOOD, 'k<');
h(7) = plot(208*ones(250,1), -I8_1RW_WOOD, 'k>');
h(8) = plot(209*ones(250,1), -I8_1T_WOOD,  'kh');
h(9) = plot(210*ones(250,1), -I8_1TS_WOOD, 'kp');




ah1 = gca;
legend(ah1, h([9 10 11]), 'Tomato sauce', 'Blood', 'Substrate');
set(legend, 'FontSize', 10);
ah2 = axes('position', get(gca, 'position'), 'visible','off');
legend(ah2, h([1 2 3 4]), 'Aloe vera drink','Cola', 'Coffee', 'Ketchup');
ah3 = axes('position',get(gca, 'position'),'visible','off');
legend(ah3, h([5 6 7 8]), 'Orange juice','Plum drink', 'Red wine', 'Green tea');
set(legend, 'FontSize', 10);

mTB1 = uicontrol('style', 'text');% mTextBox1 = mTB1
set(mTB1, 'String', '4ML In PD')
set(mTB1, 'Units', 'Characters')
set(mTB1, 'FontSize', 10)
set(mTB1, 'Position', [31 14 6 6])
set(mTB1, 'BackgroundColor', [1 1 1])


mTB2 = uicontrol('style', 'text');
set(mTB2, 'String', '10ML In PD')
set(mTB2, 'Units', 'Characters')
set(mTB2, 'FontSize', 10)
set(mTB2, 'Position', [40 14 6 6])
set(mTB2, 'BackgroundColor', [1 1 1])

mTB3 = uicontrol('style', 'text');
set(mTB3, 'String', '18ML In PD')
set(mTB3, 'Units', 'Characters')
set(mTB3, 'FontSize', 10)
set(mTB3, 'Position', [48 14 6 6])
set(mTB3, 'BackgroundColor', [1 1 1])

 mTB4 = uicontrol('style', 'text');
set(mTB4, 'String', '30ML In PD')
set(mTB4, 'Units', 'Characters')
set(mTB4, 'FontSize', 10)
set(mTB4, 'Position', [57 14 6 6])
set(mTB4, 'BackgroundColor', [1 1 1])


 mTB5 = uicontrol('style', 'text');
set(mTB5, 'String', '40ML In PD')
set(mTB5, 'Units', 'Characters')
set(mTB5, 'FontSize', 10)
set(mTB5, 'Position', [66 14 6 6])
set(mTB5, 'BackgroundColor', [1 1 1])


 mTB6 = uicontrol('style', 'text');
set(mTB6, 'String', '4ML On BF')
set(mTB6, 'Units', 'Characters')
set(mTB6, 'FontSize', 10)
set(mTB6, 'Position', [75 14 6 6])
set(mTB6, 'BackgroundColor', [1 1 1])
%{
 mTB7 = uicontrol('style', 'text');
set(mTB7, 'String', '8ML On Black Felt')
set(mTB7, 'Units', 'Characters')
set(mTB7, 'FontSize', 8)
set(mTB7, 'Position', [43 40 3.9 4])
set(mTB7, 'BackgroundColor', [1 1 1])
%}
 mTB8 = uicontrol('style', 'text');
set(mTB8, 'String', '10ML On BF')
set(mTB8, 'Units', 'Characters')
set(mTB8, 'FontSize', 10)
set(mTB8, 'Position', [82 14 6 6])
set(mTB8, 'BackgroundColor', [1 1 1])
 
mTB9 = uicontrol('style', 'text');
set(mTB9, 'String', '18ML On BF')
set(mTB9, 'Units', 'Characters')
set(mTB9, 'FontSize', 10)
set(mTB9, 'Position', [91 14 6 6])
set(mTB9, 'BackgroundColor', [1 1 1])

 mTB10 = uicontrol('style', 'text');
set(mTB10, 'String', '30ML On BF')
set(mTB10, 'Units', 'Characters')
set(mTB10, 'FontSize', 10)
set(mTB10, 'Position', [100 14 6 6])
set(mTB10, 'BackgroundColor', [1 1 1])

 mTB11 = uicontrol('style', 'text');
set(mTB11, 'String', '40ML On BF')
set(mTB11, 'Units', 'Characters')
set(mTB11, 'FontSize', 10)
set(mTB11, 'Position', [109 14 6 6])
set(mTB11, 'BackgroundColor', [1 1 1])

mTB12 = uicontrol('style', 'text');
set(mTB12, 'String', '4ML On GF')
set(mTB12, 'Units', 'Characters')
set(mTB12, 'FontSize', 10)
set(mTB12, 'Position', [117 14 6 6])
set(mTB12, 'BackgroundColor', [1 1 1])
%{
 mTB13 = uicontrol('style', 'text');
set(mTB13, 'String', '8ML On Grey Felt')
set(mTB13, 'Units', 'Characters')
set(mTB13, 'FontSize', 8)
set(mTB13, 'Position', [67 40 3.9 4])
set(mTB13, 'BackgroundColor', [1 1 1])
%}
 mTB14 = uicontrol('style', 'text');
set(mTB14, 'String', '10ML On GF')
set(mTB14, 'Units', 'Characters')
set(mTB14, 'FontSize', 10)
set(mTB14, 'Position', [125 14 6 6])
set(mTB14, 'BackgroundColor', [1 1 1])

 mTB15 = uicontrol('style', 'text');
set(mTB15, 'String', '18ML On GF')
set(mTB15, 'Units', 'Characters')
set(mTB15, 'FontSize', 10)
set(mTB15, 'Position', [134 14 6 6])
set(mTB15, 'BackgroundColor', [1 1 1])

 mTB16 = uicontrol('style', 'text');
set(mTB16, 'String', '30ML On GF')
set(mTB16, 'Units', 'Characters')
set(mTB16, 'FontSize', 10)
set(mTB16, 'Position', [142 14 6 6])
set(mTB16, 'BackgroundColor', [1 1 1])

 mTB17 = uicontrol('style', 'text');
set(mTB17, 'String', '40ML On GF')
set(mTB17, 'Units', 'Characters')
set(mTB17, 'FontSize', 10)
set(mTB17, 'Position', [151 14 6 6])
set(mTB17, 'BackgroundColor', [1 1 1])


 mTB18 = uicontrol('style', 'text');
set(mTB18, 'String', '4ML On RF')
set(mTB18, 'Units', 'Characters')
set(mTB18, 'FontSize', 10)
set(mTB18, 'Position', [159 14 6 6])
set(mTB18, 'BackgroundColor', [1 1 1])

%{
 mTB19 = uicontrol('style', 'text');
set(mTB19, 'String', '8ML On Green Felt')
set(mTB19, 'Units', 'Characters')
set(mTB19, 'FontSize', 8)
set(mTB19, 'Position', [91 40 3.9 4])
set(mTB19, 'BackgroundColor', [1 1 1])
%}

 mTB20 = uicontrol('style', 'text');
set(mTB20, 'String', '8ML On RF')
set(mTB20, 'Units', 'Characters')
set(mTB20, 'FontSize', 10)
set(mTB20, 'Position', [167 14 6 6])
set(mTB20, 'BackgroundColor', [1 1 1])

 mTB26 = uicontrol('style', 'text');
set(mTB26, 'String', '2ML On WC')
set(mTB26, 'Units', 'Characters')
set(mTB26, 'FontSize', 10)
set(mTB26, 'Position', [176 14 6 6])
set(mTB26, 'BackgroundColor', [1 1 1])


 mTB27 = uicontrol('style', 'text');
set(mTB27, 'String', '2ML On WP')
set(mTB27, 'Units', 'Characters')
set(mTB27, 'FontSize', 10)
set(mTB27, 'Position', [185 14 6 6])
set(mTB27, 'BackgroundColor', [1 1 1])

 mTB28 = uicontrol('style', 'text');
set(mTB28, 'String', '2ML On J')
set(mTB28, 'Units', 'Characters')
set(mTB28, 'FontSize', 10)
set(mTB28, 'Position', [194 14 6 6])
set(mTB28, 'BackgroundColor', [1 1 1])


 mTB29 = uicontrol('style', 'text');
set(mTB29, 'String', '1ML On W')
set(mTB29, 'Units', 'Characters')
set(mTB29, 'FontSize', 10)
set(mTB29, 'Position', [203 14 6 6])
set(mTB29, 'BackgroundColor', [1 1 1])








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure();
subplot(3,2,1); hold on
h1=plot(0.1:0.1:25, -I8_4BLD_PETRI,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_4AVD_PETRI', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_4CO_PETRI', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_4COF_PETRI', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_4K_PETRI', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_4OJ_PETRI', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_4PD_PETRI', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_4RW_PETRI', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_4T_PETRI', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_4TS_PETRI', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_PETRI,'go','MarkerSize',2)
ylim([0 2]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('4 ml', 'FontSize',10)

subplot(3,2,2); hold on
h1=plot(0.1:0.1:25, -I8_10BLD_PETRI,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_10AVD_PETRI', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_10CO_PETRI', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_10COF_PETRI', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_10K_PETRI', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_10OJ_PETRI', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_10PD_PETRI', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_10RW_PETRI', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_10T_PETRI', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_10TS_PETRI', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_PETRI,'go','MarkerSize',2)
ylim([0 2]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('10 ml', 'FontSize',10)

subplot(3,2,3); hold on
h1=plot(0.1:0.1:25, -I8_18BLD_PETRI,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_18AVD_PETRI', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_18CO_PETRI', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_18COF_PETRI', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_18K_PETRI', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_18OJ_PETRI', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_18PD_PETRI', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_18RW_PETRI', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_18T_PETRI', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_18TS_PETRI', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_PETRI,'go','MarkerSize',2)
ylim([0 2]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('18 ml', 'FontSize',10)

subplot(3,2,4); hold on
h1=plot(0.1:0.1:25, -I8_30BLD_PETRI,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_30AVD_PETRI', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_30CO_PETRI', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_30COF_PETRI', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_30K_PETRI', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_30OJ_PETRI', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_30PD_PETRI', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_30RW_PETRI', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_30T_PETRI', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_30TS_PETRI', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_PETRI,'go','MarkerSize',2)
ylim([0 2]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('30 ml', 'FontSize',10)

subplot(3,2,5); hold on
h1=plot(0.1:0.1:25, -I8_40BLD_PETRI,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_40AVD_PETRI', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_40CO_PETRI', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_40COF_PETRI', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_40K_PETRI', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_40OJ_PETRI', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_40PD_PETRI', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_40RW_PETRI', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_40T_PETRI', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_40TS_PETRI', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_PETRI,'go','MarkerSize',2)
ylim([0 2]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('40 ml', 'FontSize',10)
subtitle('Index8 for Various Substances in Petri Dish')

%%%%%%%%%%  black felt  %%%%%%%%%%%%%%%
figure();
subplot(3,2,1); hold on
h1=plot(0.1:0.1:25, -I8_4BLD_BLKF,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_4AVD_BLKF', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_4CO_BLKF', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_4COF_BLKF', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_4K_BLKF', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_4OJ_BLKF', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_4PD_BLKF', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_4RW_BLKF', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_4T_BLKF', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_4TS_BLKF', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_BLKF,'go','MarkerSize',2)
ylim([-0.1 1]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('4 ml', 'FontSize',10)

subplot(3,2,2); hold on
h1=plot(0.1:0.1:25, -I8_10BLD_BLKF,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_10AVD_BLKF', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_10CO_BLKF', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_10COF_BLKF', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_10K_BLKF', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_10OJ_BLKF', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_10PD_BLKF', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_10RW_BLKF', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_10T_BLKF', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_10TS_BLKF', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_BLKF,'go','MarkerSize',2)
ylim([-0.1 1]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('10 ml', 'FontSize',10)

subplot(3,2,3); hold on
h1=plot(0.1:0.1:25, -I8_18BLD_BLKF,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_18AVD_BLKF', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_18CO_BLKF', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_18COF_BLKF', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_18K_BLKF', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_18OJ_BLKF', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_18PD_BLKF', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_18RW_BLKF', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_18T_BLKF', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_18TS_BLKF', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_BLKF,'go','MarkerSize',2)
ylim([-0.1 1]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('18 ml', 'FontSize',10)

subplot(3,2,4); hold on
h1=plot(0.1:0.1:25, -I8_30BLD_BLKF,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_30AVD_BLKF', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_30CO_BLKF', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_30COF_BLKF', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_30K_BLKF', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_30OJ_BLKF', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_30PD_BLKF', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_30RW_BLKF', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_30T_BLKF', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_30TS_BLKF', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_BLKF,'go','MarkerSize',2)
ylim([-0.1 1]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('30 ml', 'FontSize',10)

subplot(3,2,5); hold on
h1=plot(0.1:0.1:25, -I8_40BLD_BLKF,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_40AVD_BLKF', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_40CO_BLKF', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_40COF_BLKF', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_40K_BLKF', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_40OJ_BLKF', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_40PD_BLKF', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_40RW_BLKF', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_40T_BLKF', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_40TS_BLKF', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_BLKF,'go','MarkerSize',2)
ylim([-0.1 1]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('40 ml', 'FontSize',10)
subtitle('Index8 for Various Substances on Black Felt')

%%%%%%%%%%  gray felt  %%%%%%%%%%%%%%%
figure();
subplot(3,2,1); hold on
h1=plot(0.1:0.1:25, -I8_4BLD_GRYF,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_4AVD_GRYF', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_4CO_GRYF', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_4COF_GRYF', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_4K_GRYF', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_4OJ_GRYF', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_4PD_GRYF', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_4RW_GRYF', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_4T_GRYF', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_4TS_GRYF', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_GRYF,'go','MarkerSize',2)
ylim([-0.1 2]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('4 ml', 'FontSize',10)

subplot(3,2,2); hold on
h1=plot(0.1:0.1:25, -I8_10BLD_GRYF,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_10AVD_GRYF', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_10CO_GRYF', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_10COF_GRYF', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_10K_GRYF', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_10OJ_GRYF', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_10PD_GRYF', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_10RW_GRYF', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_10T_GRYF', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_10TS_GRYF', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_GRYF,'go','MarkerSize',2)
ylim([-0.1 2]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('10 ml', 'FontSize',10)

subplot(3,2,3); hold on
h1=plot(0.1:0.1:25, -I8_18BLD_GRYF,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_18AVD_GRYF', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_18CO_GRYF', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_18COF_GRYF', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_18K_GRYF', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_18OJ_GRYF', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_18PD_GRYF', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_18RW_GRYF', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_18T_GRYF', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_18TS_GRYF', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_GRYF,'go','MarkerSize',2)
ylim([-0.1 2]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('18 ml', 'FontSize',10)

subplot(3,2,4); hold on
h1=plot(0.1:0.1:25, -I8_30BLD_GRYF,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_30AVD_GRYF', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_30CO_GRYF', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_30COF_GRYF', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_30K_GRYF', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_30OJ_GRYF', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_30PD_GRYF', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_30RW_GRYF', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_30T_GRYF', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_30TS_GRYF', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_GRYF,'go','MarkerSize',2)
ylim([-0.1 2]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('30 ml', 'FontSize',10)

subplot(3,2,5); hold on
h1=plot(0.1:0.1:25, -I8_40BLD_GRYF,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_40AVD_GRYF', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_40CO_GRYF', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_40COF_GRYF', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_40K_GRYF', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_40OJ_GRYF', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_40PD_GRYF', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_40RW_GRYF', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_40T_GRYF', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_40TS_GRYF', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_GRYF,'go','MarkerSize',2)
ylim([-0.1 2]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('40 ml', 'FontSize',10)
subtitle('Index8 for Various Substances on Gray Felt')

%%%%%%%%%%  RED felt  %%%%%%%%%%%%%%%
figure();
subplot(1,2,1); hold on
h1=plot(0.1:0.1:25, -I8_4BLD_REDF,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_4AVD_REDF', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_4CO_REDF', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_4COF_REDF', 'ks','MarkerSize',2)
%plot(0.1:0.1:25, -I8_4K_GRYF', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_4OJ_REDF', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_4PD_REDF', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_4RW_REDF', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_4T_REDF', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_2TS_REDF', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_REDF,'go','MarkerSize',2)
ylim([-0.2 1.6]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('4 ML', 'FontSize',10)

subplot(1,2,2); hold on
h1=plot(0.1:0.1:25, -I8_8BLD_REDF,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_8AVD_REDF', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_8CO_REDF', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_8COF_REDF', 'ks','MarkerSize',2)
%plot(0.1:0.1:25, -I8_8K_GRYF', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_8OJ_REDF', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_8PD_REDF', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_8RW_REDF', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_8T_REDF', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_4TS_REDF', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_REDF,'go','MarkerSize',2)
ylim([-0.2 1.6]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('10 ml', 'FontSize',10)
subtitle('Index8 for Various Substances on Red Felt')
%%%%%%%%%%%%%%%%%%%%%%

figure();
subplot(2,2,1); hold on
h1=plot(0.1:0.1:25, -I8_2BLD_COTNT,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_2AVD_COTNT', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_2CO_COTNT', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_2COF_COTNT', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_2K_COTNT', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_2OJ_COTNT', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_2PD_COTNT', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_2RW_COTNT', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_2T_COTNT', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_2TS_COTNT', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_COTNT,'go','MarkerSize',2)
ylim([-0.5 1.3]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('Cotton', 'FontSize',10)

subplot(2,2,2); hold on
h1=plot(0.1:0.1:25, -I8_2BLD_POLY,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_2AVD_POLY', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_2CO_POLY', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_2COF_POLY', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_2K_POLY', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_2OJ_POLY', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_2PD_POLY', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_2RW_POLY', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_2T_POLY', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_2TS_POLY', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_POLY,'go','MarkerSize',2)
ylim([-0.5 1.3]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('Polyester', 'FontSize',10)


subplot(2,2,3); hold on
h1=plot(0.1:0.1:25, -I8_2BLD_JEANS,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_2AVD_JEANS', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_2CO_JEANS', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_2COF_JEANS', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_2K_JEANS', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_2OJ_JEANS', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_2PD_JEANS', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_2RW_JEANS', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_2T_JEANS', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_2TS_JEANS', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_JEANS,'go','MarkerSize',2)
ylim([-0.5 1.3]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('Jeans', 'FontSize',10)

subplot(2,2,4); hold on
h1=plot(0.1:0.1:25, -I8_1BLD_WOOD,'ro','MarkerSize',2)
h2=plot(0.1:0.1:25, -I8_1AVD_WOOD', 'k*','MarkerSize',2)
plot(0.1:0.1:25, -I8_1CO_WOOD', 'k+','MarkerSize',2)
plot(0.1:0.1:25, -I8_1COF_WOOD', 'ks','MarkerSize',2)
plot(0.1:0.1:25, -I8_1K_WOOD', 'kd','MarkerSize',2)
plot(0.1:0.1:25, -I8_1OJ_WOOD', 'kv','MarkerSize',2)
plot(0.1:0.1:25, -I8_1PD_WOOD', 'k<','MarkerSize',2)
plot(0.1:0.1:25, -I8_1RW_WOOD', 'k>','MarkerSize',2)
plot(0.1:0.1:25, -I8_1T_WOOD', 'kh','MarkerSize',2)
plot(0.1:0.1:25, -I8_1TS_WOOD', 'kp','MarkerSize',2)
h3=plot(0.1:0.1:25, -I8_WOOD,'go','MarkerSize',2)
ylim([-0.5 1.3]);
xlim([0 25]);grid on
xlabel('Half AOV (degree)','FontSize',10);ylabel('Wood', 'FontSize',10)
subtitle('Index8 for Various Substances on Various Substrates')