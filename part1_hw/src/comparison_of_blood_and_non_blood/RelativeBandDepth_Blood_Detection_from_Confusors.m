
%% This script use index3 to detect blood from confusors.
% There are three sets of points(3 points) used for calculating index3.
% This script uses the first two peaks and the first valley.

% I3 is short for index3


clear all; close all; clc;
lambda = 350:2500;

%%%%%%%%%%%%%%    SET 1  %%%%%%%%%%
PKS_BGN = 1200;
PKS_END = 1400;
%%%%%%%%%%%%%%%%%%%%       4ML In      PETRI DISH         %%%%%%%%%%%%%%%%%%%%%%
filename = '4BLD_PETRI_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_4 = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_4_P_av = dlmread('AVD4_PETRI_av_i.txt', '');
I3_AVD_4_P = Index3_Index4(x1, AVD_4_P_av(x1-350+1), x2, AVD_4_P_av(x2-350+1), x0, AVD_4_P_av(x0-350+1));

CO_4_P_av = dlmread('NCO4PET_av_i.txt', '');
I3_CO_4_P = Index3_Index4(x1, CO_4_P_av(x1-350+1), x2, CO_4_P_av(x2-350+1), x0, CO_4_P_av(x0-350+1));

COF_4_P_av = dlmread('C4_PETRI_av_i.txt', '');
I3_COF_4_P = Index3_Index4(x1, COF_4_P_av(x1-350+1), x2, COF_4_P_av(x2-350+1), x0, COF_4_P_av(x0-350+1));

K_4_P_av = dlmread('K4_PETRI_av_i.txt', '');
I3_K_4_P = Index3_Index4(x1, K_4_P_av(x1-350+1), x2, K_4_P_av(x2-350+1), x0,K_4_P_av(x0-350+1));

OJ_4_P_av = dlmread('OJ4_PETRI_av_i.txt', '');
I3_OJ_4_P = Index3_Index4(x1, OJ_4_P_av(x1-350+1), x2, OJ_4_P_av(x2-350+1), x0, OJ_4_P_av(x0-350+1));

PD_4_P_av = dlmread('PD4_PETRI_av_i.txt', '');
I3_PD_4_P = Index3_Index4(x1, PD_4_P_av(x1-350+1), x2, PD_4_P_av(x2-350+1), x0, PD_4_P_av(x0-350+1));

RW_4_P_av = dlmread('RW4_PETRI_av_i.txt', '');
I3_RW_4_P = Index3_Index4(x1, RW_4_P_av(x1-350+1), x2, RW_4_P_av(x2-350+1), x0, RW_4_P_av(x0-350+1));

T_4_P_av = dlmread('T4_PETRI_av_i.txt', '');
I3_T_4_P = Index3_Index4(x1, T_4_P_av(x1-350+1), x2, T_4_P_av(x2-350+1), x0, T_4_P_av(x0-350+1));

TS_4_P_av = dlmread('TS4_PETRI_av_i.txt', '');
I3_TS_4_P = Index3_Index4(x1, TS_4_P_av(x1-350+1), x2, TS_4_P_av(x2-350+1), x0, TS_4_P_av(x0-350+1));


%%%%%%%%%%%%%%  10ML in Petri Dish  %%%%%%%%%
filename = '10BLD_PETRI_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_10 = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_10_P_av = dlmread('AVD10_PETRI_av_i.txt', '');
I3_AVD_10_P = Index3_Index4(x1, AVD_10_P_av(x1-350+1), x2, AVD_10_P_av(x2-350+1), x0, AVD_10_P_av(x0-350+1));

CO_10_P_av = dlmread('NCO10PET_av_i.txt', '');
I3_CO_10_P = Index3_Index4(x1, CO_10_P_av(x1-350+1), x2, CO_10_P_av(x2-350+1), x0, CO_10_P_av(x0-350+1));

COF_10_P_av = dlmread('C10_PETRI_av_i.txt', '');
I3_COF_10_P = Index3_Index4(x1, COF_10_P_av(x1-350+1), x2, COF_10_P_av(x2-350+1), x0, COF_10_P_av(x0-350+1));

K_10_P_av = dlmread('K10_PETRI_av_i.txt', '');
I3_K_10_P = Index3_Index4(x1, K_10_P_av(x1-350+1), x2, K_10_P_av(x2-350+1), x0, K_10_P_av(x0-350+1));

OJ_10_P_av = dlmread('OJ10_PETRI_av_i.txt', '');
I3_OJ_10_P = Index3_Index4(x1, OJ_10_P_av(x1-350+1), x2, OJ_10_P_av(x2-350+1), x0, OJ_10_P_av(x0-350+1));

PD_10_P_av = dlmread('PD10_PETRI_av_i.txt', '');
I3_PD_10_P = Index3_Index4(x1, PD_10_P_av(x1-350+1), x2, PD_10_P_av(x2-350+1), x0, PD_10_P_av(x0-350+1));

RW_10_P_av = dlmread('RW10_PETRI_av_i.txt', '');
I3_RW_10_P = Index3_Index4(x1, RW_10_P_av(x1-350+1), x2, RW_10_P_av(x2-350+1), x0, RW_10_P_av(x0-350+1));

T_10_P_av = dlmread('T10_PETRI_av_i.txt', '');
I3_T_10_P = Index3_Index4(x1, T_10_P_av(x1-350+1), x2, T_10_P_av(x2-350+1), x0, T_10_P_av(x0-350+1));

TS_10_P_av = dlmread('TS10_PETRI_av_i.txt', '');
I3_TS_10_P = Index3_Index4(x1, TS_10_P_av(x1-350+1), x2, TS_10_P_av(x2-350+1), x0, TS_10_P_av(x0-350+1));

%%%%%%%%%%%%         18ML in Petri Dish        %%%%%%%%%%%%%%%%
filename = '18BLD_PETRI_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_18 = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_18_P_av = dlmread('AVD18_PETRI_av_i.txt', '');
I3_AVD_18_P = Index3_Index4(x1, AVD_18_P_av(x1-350+1), x2, AVD_18_P_av(x2-350+1), x0, AVD_18_P_av(x0-350+1));

CO_18_P_av = dlmread('NCO18PET_av_i.txt', '');
I3_CO_18_P = Index3_Index4(x1, CO_18_P_av(x1-350+1), x2, CO_18_P_av(x2-350+1), x0, CO_18_P_av(x0-350+1));

COF_18_P_av = dlmread('C18_PETRI_av_i.txt', '');
I3_COF_18_P = Index3_Index4(x1, COF_18_P_av(x1-350+1), x2, COF_18_P_av(x2-350+1), x0, COF_18_P_av(x0-350+1));

K_18_P_av = dlmread('K18_PETRI_av_i.txt', '');
I3_K_18_P = Index3_Index4(x1, K_18_P_av(x1-350+1), x2, K_18_P_av(x2-350+1), x0, K_18_P_av(x0-350+1));

OJ_18_P_av = dlmread('OJ18_PETRI_av_i.txt', '');
I3_OJ_18_P = Index3_Index4(x1, OJ_18_P_av(x1-350+1), x2, OJ_18_P_av(x2-350+1), x0, OJ_18_P_av(x0-350+1));

PD_18_P_av = dlmread('PD18_PETRI_av_i.txt', '');
I3_PD_18_P = Index3_Index4(x1, PD_18_P_av(x1-350+1), x2, PD_18_P_av(x2-350+1), x0, PD_18_P_av(x0-350+1));

RW_18_P_av = dlmread('RW18_PETRI_av_i.txt', '');
I3_RW_18_P = Index3_Index4(x1, RW_18_P_av(x1-350+1), x2, RW_18_P_av(x2-350+1), x0, RW_18_P_av(x0-350+1));

T_18_P_av = dlmread('T18_PETRI_av_i.txt', '');
I3_T_18_P = Index3_Index4(x1, T_18_P_av(x1-350+1), x2, T_18_P_av(x2-350+1), x0, T_18_P_av(x0-350+1));

TS_18_P_av = dlmread('TS18_PETRI_av_i.txt', '');
I3_TS_18_P = Index3_Index4(x1, TS_18_P_av(x1-350+1), x2, TS_18_P_av(x2-350+1), x0, TS_18_P_av(x0-350+1));


%%%%%%%%%%%%%      30ML in Petri Dish       %%%%%%%%%%%%%%%%
filename = '30BLD_PETRI_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_30 = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_30_P_av = dlmread('AVD30_PETRI_av_i.txt', '');
I3_AVD_30_P = Index3_Index4(x1, AVD_30_P_av(x1-350+1), x2, AVD_30_P_av(x2-350+1), x0, AVD_30_P_av(x0-350+1));

CO_30_P_av = dlmread('NCO30PET_av_i.txt', '');
I3_CO_30_P = Index3_Index4(x1, CO_30_P_av(x1-350+1), x2, CO_30_P_av(x2-350+1), x0, CO_30_P_av(x0-350+1));

COF_30_P_av = dlmread('C30_PETRI_av_i.txt', '');
I3_COF_30_P = Index3_Index4(x1, COF_30_P_av(x1-350+1), x2, COF_30_P_av(x2-350+1), x0, COF_30_P_av(x0-350+1));

K_30_P_av = dlmread('K30_PETRI_av_i.txt', '');
I3_K_30_P = Index3_Index4(x1, K_30_P_av(x1-350+1), x2, K_30_P_av(x2-350+1), x0, K_30_P_av(x0-350+1));

OJ_30_P_av = dlmread('OJ30_PETRI_av_i.txt', '');
I3_OJ_30_P = Index3_Index4(x1, OJ_30_P_av(x1-350+1), x2, OJ_30_P_av(x2-350+1), x0, OJ_30_P_av(x0-350+1));

PD_30_P_av = dlmread('PD30_PETRI_av_i.txt', '');
I3_PD_30_P = Index3_Index4(x1, PD_30_P_av(x1-350+1), x2, PD_30_P_av(x2-350+1), x0, PD_30_P_av(x0-350+1));

RW_30_P_av = dlmread('RW30_PETRI_av_i.txt', '');
I3_RW_30_P = Index3_Index4(x1, RW_30_P_av(x1-350+1), x2, RW_30_P_av(x2-350+1), x0, RW_30_P_av(x0-350+1));

T_30_P_av = dlmread('T30_PETRI_av_i.txt', '');
I3_T_30_P = Index3_Index4(x1, T_30_P_av(x1-350+1), x2, T_30_P_av(x2-350+1), x0, T_30_P_av(x0-350+1));

TS_30_P_av = dlmread('TS30_PETRI_av_i.txt', '');
I3_TS_30_P = Index3_Index4(x1, TS_30_P_av(x1-350+1), x2, TS_30_P_av(x2-350+1), x0, TS_30_P_av(x0-350+1));

%%%%%%%%%%%%%      40ML in Petri Dish       %%%%%%%%%%%%%%%%
filename = '40BLD_PETRI_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_40 = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_40_P_av = dlmread('AVD40_PETRI_av_i.txt', '');
I3_AVD_40_P = Index3_Index4(x1, AVD_40_P_av(x1-350+1), x2, AVD_40_P_av(x2-350+1), x0, AVD_40_P_av(x0-350+1));

CO_40_P_av = dlmread('NCO40PET_av_i.txt', '');
I3_CO_40_P = Index3_Index4(x1, CO_40_P_av(x1-350+1), x2, CO_40_P_av(x2-350+1), x0, CO_40_P_av(x0-350+1));

COF_40_P_av = dlmread('C40_PETRI_av_i.txt', '');
I3_COF_40_P = Index3_Index4(x1, COF_40_P_av(x1-350+1), x2, COF_40_P_av(x2-350+1), x0, COF_40_P_av(x0-350+1));

K_40_P_av = dlmread('K40_PETRI_av_i.txt', '');
I3_K_40_P = Index3_Index4(x1, K_40_P_av(x1-350+1), x2, K_40_P_av(x2-350+1), x0, K_40_P_av(x0-350+1));

OJ_40_P_av = dlmread('OJ40_PETRI_av_i.txt', '');
I3_OJ_40_P = Index3_Index4(x1, OJ_40_P_av(x1-350+1), x2, OJ_40_P_av(x2-350+1), x0, OJ_40_P_av(x0-350+1));

PD_40_P_av = dlmread('PD40_PETRI_av_i.txt', '');
I3_PD_40_P = Index3_Index4(x1, PD_40_P_av(x1-350+1), x2, PD_40_P_av(x2-350+1), x0, PD_40_P_av(x0-350+1));

RW_40_P_av = dlmread('RW40_PETRI_av_i.txt', '');
I3_RW_40_P = Index3_Index4(x1, RW_40_P_av(x1-350+1), x2, RW_40_P_av(x2-350+1), x0, RW_40_P_av(x0-350+1));

T_40_P_av = dlmread('T40_PETRI_av_i.txt', '');
I3_T_40_P = Index3_Index4(x1, T_40_P_av(x1-350+1), x2, T_40_P_av(x2-350+1), x0, T_40_P_av(x0-350+1));

TS_40_P_av = dlmread('TS40_PETRI_av_i.txt', '');
I3_TS_40_P = Index3_Index4(x1, TS_40_P_av(x1-350+1), x2, TS_40_P_av(x2-350+1), x0, TS_40_P_av(x0-350+1));

%%%%%%%%%%%%%%%%%   Black Felt   %%%%%%%%%%%%%%%%%%%%
%%%%%   4ML   %%%%
filename = 'NBD4BLK_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_4_BLKF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_4_BLKF = dlmread('NAD4BLK_av_i.txt', '');
I3_AVD_4_BLKF = Index3_Index4(x1, AVD_4_BLKF(x1-350+1), x2, AVD_4_BLKF(x2-350+1), x0, AVD_4_BLKF(x0-350+1));

CO_4_BLKF = dlmread('NCO4BLK_av_i.txt', '');%cola
I3_CO_4_BLKF = Index3_Index4(x1, CO_4_BLKF(x1-350+1), x2, CO_4_BLKF(x2-350+1), x0, CO_4_BLKF(x0-350+1));

COF_4_BLKF = dlmread('NCF4BLK_av_i.txt', '');%coffee
I3_COF_4_BLKF = Index3_Index4(x1, COF_4_BLKF(x1-350+1), x2, COF_4_BLKF(x2-350+1), x0, COF_4_BLKF(x0-350+1));

K_4_BLKF = dlmread('NK4BLK_av_i.txt', '');
I3_K_4_BLKF = Index3_Index4(x1, K_4_BLKF(x1-350+1), x2, K_4_BLKF(x2-350+1), x0, K_4_BLKF(x0-350+1));

OJ_4_BLKF = dlmread('NOJ4BLK_av_i.txt', '');
I3_OJ_4_BLKF = Index3_Index4(x1, OJ_4_BLKF(x1-350+1), x2, OJ_4_BLKF(x2-350+1), x0, OJ_4_BLKF(x0-350+1));

PD_4_BLKF = dlmread('NPD4BLK_av_i.txt', '');
I3_PD_4_BLKF = Index3_Index4(x1, PD_4_BLKF(x1-350+1), x2, PD_4_BLKF(x2-350+1), x0, PD_4_BLKF(x0-350+1));

RW_4_BLKF = dlmread('NRW4BLK_av_i.txt', '');
I3_RW_4_BLKF = Index3_Index4(x1, RW_4_BLKF(x1-350+1), x2, RW_4_BLKF(x2-350+1), x0, RW_4_BLKF(x0-350+1));

T_4_BLKF = dlmread('NTE4BLK_av_i.txt', '');
I3_T_4_BLKF = Index3_Index4(x1, T_4_BLKF(x1-350+1), x2, T_4_BLKF(x2-350+1), x0,T_4_BLKF(x0-350+1));

TS_4_BLKF = dlmread('NTS4BLK_av_i.txt', '');
I3_TS_4_BLKF = Index3_Index4(x1, TS_4_BLKF(x1-350+1), x2, TS_4_BLKF(x2-350+1), x0, TS_4_BLKF(x0-350+1));


%%%%%%%%  10ML blood and confusors  %%%%%%%%%
filename = 'NBD10BLK_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_10_BLKF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_10_BLKF = dlmread('NAD10BLK_av_i.txt', '', 0, 0);
I3_AVD_10_BLKF = Index3_Index4(x1, AVD_10_BLKF(x1-350+1), x2, AVD_10_BLKF(x2-350+1), x0, AVD_10_BLKF(x0-350+1));

CO_10_BLKF = dlmread('NCO10BLK_av_i.txt', '', 0, 0);
I3_CO_10_BLKF = Index3_Index4(x1, CO_10_BLKF(x1-350+1), x2, CO_10_BLKF(x2-350+1), x0, CO_10_BLKF(x0-350+1));

COF_10_BLKF = dlmread('NCF10BLK_av_i.txt', '', 0, 0);
I3_COF_10_BLKF = Index3_Index4(x1, COF_10_BLKF(x1-350+1), x2, COF_10_BLKF(x2-350+1), x0, COF_10_BLKF(x0-350+1));

K_10_BLKF = dlmread('NK10BLK_av_i.txt', '', 0, 0);
I3_K_10_BLKF = Index3_Index4(x1, K_10_BLKF(x1-350+1), x2, K_10_BLKF(x2-350+1), x0, K_10_BLKF(x0-350+1));

OJ_10_BLKF = dlmread('NOJ10BLK_av_i.txt', '', 0, 0);
I3_OJ_10_BLKF = Index3_Index4(x1, OJ_10_BLKF(x1-350+1), x2, OJ_10_BLKF(x2-350+1), x0, OJ_10_BLKF(x0-350+1));

PD_10_BLKF = dlmread('NPD10BLK_av_i.txt', '', 0, 0);
I3_PD_10_BLKF = Index3_Index4(x1, PD_10_BLKF(x1-350+1), x2, PD_10_BLKF(x2-350+1), x0,PD_10_BLKF(x0-350+1));

RW_10_BLKF = dlmread('NRW10BLK_av_i.txt', '', 0, 0);
I3_RW_10_BLKF = Index3_Index4(x1, RW_10_BLKF(x1-350+1), x2, RW_10_BLKF(x2-350+1), x0, RW_10_BLKF(x0-350+1));

T_10_BLKF = dlmread('NTE10BLK_av_i.txt', '', 0, 0);
I3_T_10_BLKF = Index3_Index4(x1, T_10_BLKF(x1-350+1), x2, T_10_BLKF(x2-350+1), x0, T_10_BLKF(x0-350+1));

TS_10_BLKF = dlmread('NTS10BLK_av_i.txt', '', 0, 0);
I3_TS_10_BLKF = Index3_Index4(x1, TS_10_BLKF(x1-350+1), x2, TS_10_BLKF(x2-350+1), x0, TS_10_BLKF(x0-350+1));

%%%%%%%%  18ML blood and confusors  %%%%%%%%%
filename = 'NBD18BLK_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_18_BLKF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_18_BLKF = dlmread('NAD18BLK_av_i.txt', '', 0, 0);
I3_AVD_18_BLKF = Index3_Index4(x1, AVD_18_BLKF(x1-350+1), x2, AVD_18_BLKF(x2-350+1), x0, AVD_18_BLKF(x0-350+1));

CO_18_BLKF = dlmread('NCO18BLK_av_i.txt', '', 0, 0);
I3_CO_18_BLKF  = Index3_Index4(x1, CO_18_BLKF (x1-350+1), x2, CO_18_BLKF (x2-350+1), x0, CO_18_BLKF (x0-350+1));

COF_18_BLKF = dlmread('NCF18BLK_av_i.txt', '', 0, 0);
I3_COF_18_BLKF = Index3_Index4(x1, COF_18_BLKF(x1-350+1), x2, COF_18_BLKF(x2-350+1), x0, COF_18_BLKF(x0-350+1));

K_18_BLKF = dlmread('K18BLK_av_i.txt', '', 0, 0);
I3_K_18_BLKF = Index3_Index4(x1, K_18_BLKF(x1-350+1), x2, K_18_BLKF(x2-350+1), x0,K_18_BLKF(x0-350+1));

OJ_18_BLKF = dlmread('NOJ18BLK_av_i.txt', '', 0, 0);
I3_OJ_18_BLKF= Index3_Index4(x1,OJ_18_BLKF(x1-350+1), x2, OJ_18_BLKF(x2-350+1), x0, OJ_18_BLKF(x0-350+1));

PD_18_BLKF = dlmread('NPD18BLK_av_i.txt', '', 0, 0);
I3_PD_18_BLKF = Index3_Index4(x1, PD_18_BLKF(x1-350+1), x2,PD_18_BLKF(x2-350+1), x0,PD_18_BLKF(x0-350+1));

RW_18_BLKF = dlmread('NRW18BLK_av_i.txt', '', 0, 0);
I3_RW_18_BLKF = Index3_Index4(x1, RW_18_BLKF(x1-350+1), x2, RW_18_BLKF(x2-350+1), x0, RW_18_BLKF(x0-350+1));

T_18_BLKF = dlmread('NTE18BLK_av_i.txt', '', 0, 0);
I3_T_18_BLKF = Index3_Index4(x1, T_18_BLKF(x1-350+1), x2,T_18_BLKF(x2-350+1), x0, T_18_BLKF(x0-350+1));

TS_18_BLKF = dlmread('TS18BLK_av_i.txt', '', 0, 0);
I3_TS_18_BLKF = Index3_Index4(x1, TS_18_BLKF(x1-350+1), x2, TS_18_BLKF(x2-350+1), x0, TS_18_BLKF(x0-350+1));

%%%%%%%%  30ML blood and confusors  %%%%%%%%%
filename = 'NBD30BLK_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_30_BLKF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_30_BLKF = dlmread('NAD30BLK_av_i.txt', '', 0, 0);
I3_AVD_30_BLKF = Index3_Index4(x1, AVD_30_BLKF(x1-350+1), x2, AVD_30_BLKF(x2-350+1), x0, AVD_30_BLKF(x0-350+1));

CO_30_BLKF = dlmread('NCO30BLK_av_i.txt', '', 0, 0);
I3_CO_30_BLKF  = Index3_Index4(x1, CO_30_BLKF (x1-350+1), x2, CO_30_BLKF (x2-350+1), x0, CO_30_BLKF (x0-350+1));

COF_30_BLKF = dlmread('NCF30BLK_av_i.txt', '', 0, 0);
I3_COF_30_BLKF = Index3_Index4(x1, COF_30_BLKF(x1-350+1), x2, COF_30_BLKF(x2-350+1), x0, COF_30_BLKF(x0-350+1));

K_30_BLKF = dlmread('K30BLK_av_i.txt', '', 0, 0);
I3_K_30_BLKF = Index3_Index4(x1, K_30_BLKF(x1-350+1), x2, K_30_BLKF(x2-350+1), x0,K_30_BLKF(x0-350+1));

OJ_30_BLKF = dlmread('NOJ30BLK_av_i.txt', '', 0, 0);
I3_OJ_30_BLKF= Index3_Index4(x1,OJ_30_BLKF(x1-350+1), x2, OJ_30_BLKF(x2-350+1), x0, OJ_30_BLKF(x0-350+1));

PD_30_BLKF = dlmread('NPD30BLK_av_i.txt', '', 0, 0);
I3_PD_30_BLKF = Index3_Index4(x1, PD_30_BLKF(x1-350+1), x2,PD_30_BLKF(x2-350+1), x0,PD_30_BLKF(x0-350+1));

RW_30_BLKF = dlmread('NRW30BLK_av_i.txt', '', 0, 0);
I3_RW_30_BLKF = Index3_Index4(x1, RW_30_BLKF(x1-350+1), x2, RW_30_BLKF(x2-350+1), x0, RW_30_BLKF(x0-350+1));

T_30_BLKF = dlmread('NTE30BLK_av_i.txt', '', 0, 0);
I3_T_30_BLKF = Index3_Index4(x1, T_30_BLKF(x1-350+1), x2,T_30_BLKF(x2-350+1), x0, T_30_BLKF(x0-350+1));

TS_30_BLKF = dlmread('TS30BLK_av_i.txt', '', 0, 0);
I3_TS_30_BLKF = Index3_Index4(x1, TS_30_BLKF(x1-350+1), x2, TS_30_BLKF(x2-350+1), x0, TS_30_BLKF(x0-350+1));



%%%%%%%%  40ML blood and confusors  %%%%%%%%%
filename = 'NBD40BLK_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_40_BLKF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_40_BLKF = dlmread('NAD40BLK_av_i.txt', '', 0, 0);
I3_AVD_40_BLKF = Index3_Index4(x1, AVD_40_BLKF(x1-350+1), x2, AVD_40_BLKF(x2-350+1), x0, AVD_40_BLKF(x0-350+1));

CO_40_BLKF = dlmread('NCO40BLK_av_i.txt', '', 0, 0);
I3_CO_40_BLKF  = Index3_Index4(x1, CO_40_BLKF (x1-350+1), x2, CO_40_BLKF (x2-350+1), x0, CO_40_BLKF (x0-350+1));

COF_40_BLKF = dlmread('NCF40BLK_av_i.txt', '', 0, 0);
I3_COF_40_BLKF = Index3_Index4(x1, COF_40_BLKF(x1-350+1), x2, COF_40_BLKF(x2-350+1), x0, COF_40_BLKF(x0-350+1));

K_40_BLKF = dlmread('K40BLK_av_i.txt', '', 0, 0);
I3_K_40_BLKF = Index3_Index4(x1, K_40_BLKF(x1-350+1), x2, K_40_BLKF(x2-350+1), x0,K_40_BLKF(x0-350+1));

OJ_40_BLKF = dlmread('NOJ40BLK_av_i.txt', '', 0, 0);
I3_OJ_40_BLKF= Index3_Index4(x1,OJ_40_BLKF(x1-350+1), x2, OJ_40_BLKF(x2-350+1), x0, OJ_40_BLKF(x0-350+1));

PD_40_BLKF = dlmread('NPD40BLK_av_i.txt', '', 0, 0);
I3_PD_40_BLKF = Index3_Index4(x1, PD_40_BLKF(x1-350+1), x2,PD_40_BLKF(x2-350+1), x0,PD_40_BLKF(x0-350+1));

RW_40_BLKF = dlmread('NRW40BLK_av_i.txt', '', 0, 0);
I3_RW_40_BLKF = Index3_Index4(x1, RW_40_BLKF(x1-350+1), x2, RW_40_BLKF(x2-350+1), x0, RW_40_BLKF(x0-350+1));

T_40_BLKF = dlmread('NTE40BLK_av_i.txt', '', 0, 0);
I3_T_40_BLKF = Index3_Index4(x1, T_40_BLKF(x1-350+1), x2,T_40_BLKF(x2-350+1), x0, T_40_BLKF(x0-350+1));

TS_40_BLKF = dlmread('TS40BLK_av_i.txt', '', 0, 0);
I3_TS_40_BLKF = Index3_Index4(x1, TS_40_BLKF(x1-350+1), x2, TS_40_BLKF(x2-350+1), x0, TS_40_BLKF(x0-350+1));


%%%%%%%%%%%%%%%%%   GREY Felt   %%%%%%%%%%%%%%%%%%%%
filename = 'NBD4GRY_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_4_GRYF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_4_GRYF = dlmread('NAD4GRY_av_i.txt', '');
I3_AVD_4_GRYF = Index3_Index4(x1, AVD_4_GRYF(x1-350+1), x2, AVD_4_GRYF(x2-350+1), x0, AVD_4_GRYF(x0-350+1));

CO_4_GRYF = dlmread('NCO4GRY_av_i.txt', '');
I3_CO_4_GRYF  = Index3_Index4(x1, CO_4_GRYF (x1-350+1), x2, CO_4_GRYF (x2-350+1), x0, CO_4_GRYF (x0-350+1));

COF_4_GRYF = dlmread('NCF4GRY_av_i.txt', '');
I3_COF_4_GRYF = Index3_Index4(x1, COF_4_GRYF(x1-350+1), x2, COF_4_GRYF(x2-350+1), x0, COF_4_GRYF(x0-350+1));

K_4_GRYF = dlmread('NK4GRY_av_i.txt', '');
I3_K_4_GRYF = Index3_Index4(x1, K_4_GRYF(x1-350+1), x2, K_4_GRYF(x2-350+1), x0,K_4_GRYF(x0-350+1));

OJ_4_GRYF = dlmread('NOJ4GRY_av_i.txt', '');
I3_OJ_4_GRYF= Index3_Index4(x1,OJ_4_GRYF(x1-350+1), x2, OJ_4_GRYF(x2-350+1), x0, OJ_4_GRYF(x0-350+1));

PD_4_GRYF = dlmread('NPD4GRY_av_i.txt', '');
I3_PD_4_GRYF = Index3_Index4(x1, PD_4_GRYF(x1-350+1), x2,PD_4_GRYF(x2-350+1), x0,PD_4_GRYF(x0-350+1));

RW_4_GRYF = dlmread('NRW4GRY_av_i.txt', '');
I3_RW_4_GRYF = Index3_Index4(x1, RW_4_GRYF(x1-350+1), x2, RW_4_GRYF(x2-350+1), x0, RW_4_GRYF(x0-350+1));

T_4_GRYF = dlmread('NTE4GRY_av_i.txt', '');
I3_T_4_GRYF = Index3_Index4(x1, T_4_GRYF(x1-350+1), x2,T_4_GRYF(x2-350+1), x0, T_4_GRYF(x0-350+1));

TS_4_GRYF = dlmread('NTS4GRY_av_i.txt', '');
I3_TS_4_GRYF = Index3_Index4(x1, TS_4_GRYF(x1-350+1), x2, TS_4_GRYF(x2-350+1), x0, TS_4_GRYF(x0-350+1));



filename = 'NBD10GRY_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_10_GRYF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_10_GRYF = dlmread('NAD10GRY_av_i.txt', '', 0, 0);
I3_AVD_10_GRYF = Index3_Index4(x1, AVD_10_GRYF(x1-350+1), x2, AVD_10_GRYF(x2-350+1), x0, AVD_10_GRYF(x0-350+1));

CO_10_GRYF = dlmread('NCO10GRY_av_i.txt', '', 0, 0);
I3_CO_10_GRYF  = Index3_Index4(x1, CO_10_GRYF (x1-350+1), x2, CO_10_GRYF (x2-350+1), x0, CO_10_GRYF (x0-350+1));

COF_10_GRYF = dlmread('NCF10GRY_av_i.txt', '', 0, 0);
I3_COF_10_GRYF = Index3_Index4(x1, COF_10_GRYF(x1-350+1), x2, COF_10_GRYF(x2-350+1), x0, COF_10_GRYF(x0-350+1));

K_10_GRYF = dlmread('NK10GRY_av_i.txt', '', 0, 0);
I3_K_10_GRYF = Index3_Index4(x1, K_10_GRYF(x1-350+1), x2, K_10_GRYF(x2-350+1), x0,K_10_GRYF(x0-350+1));

OJ_10_GRYF = dlmread('NOJ10GRY_av_i.txt', '', 0, 0);
I3_OJ_10_GRYF= Index3_Index4(x1,OJ_10_GRYF(x1-350+1), x2, OJ_10_GRYF(x2-350+1), x0, OJ_10_GRYF(x0-350+1));

PD_10_GRYF = dlmread('NPD10GRY_av_i.txt', '', 0, 0);
I3_PD_10_GRYF = Index3_Index4(x1, PD_10_GRYF(x1-350+1), x2,PD_10_GRYF(x2-350+1), x0,PD_10_GRYF(x0-350+1));

RW_10_GRYF = dlmread('NRW10GRY_av_i.txt', '', 0, 0);
I3_RW_10_GRYF = Index3_Index4(x1, RW_10_GRYF(x1-350+1), x2, RW_10_GRYF(x2-350+1), x0, RW_10_GRYF(x0-350+1));

T_10_GRYF = dlmread('NTE10GRY_av_i.txt', '', 0, 0);
I3_T_10_GRYF = Index3_Index4(x1, T_10_GRYF(x1-350+1), x2,T_10_GRYF(x2-350+1), x0, T_10_GRYF(x0-350+1));

TS_10_GRYF = dlmread('NTS10GRY_av_i.txt', '', 0, 0);
I3_TS_10_GRYF = Index3_Index4(x1, TS_10_GRYF(x1-350+1), x2, TS_10_GRYF(x2-350+1), x0, TS_10_GRYF(x0-350+1));

%%%%%%%%  18ML blood and confusors  %%%%%%%%%

filename = 'NBD18GRY_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_18_GRYF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_18_GRYF = dlmread('NAD18GRY_av_i.txt', '', 0, 0);
I3_AVD_18_GRYF = Index3_Index4(x1, AVD_18_GRYF(x1-350+1), x2, AVD_18_GRYF(x2-350+1), x0, AVD_18_GRYF(x0-350+1));

CO_18_GRYF = dlmread('NCO18GRY_av_i.txt', '', 0, 0);
I3_CO_18_GRYF  = Index3_Index4(x1, CO_18_GRYF (x1-350+1), x2, CO_18_GRYF (x2-350+1), x0, CO_18_GRYF (x0-350+1));

COF_18_GRYF = dlmread('NCF18GRY_av_i.txt', '', 0, 0);
I3_COF_18_GRYF = Index3_Index4(x1, COF_18_GRYF(x1-350+1), x2, COF_18_GRYF(x2-350+1), x0, COF_18_GRYF(x0-350+1));

K_18_GRYF = dlmread('K18GRY_av_i.txt', '', 0, 0);
I3_K_18_GRYF = Index3_Index4(x1, K_18_GRYF(x1-350+1), x2, K_18_GRYF(x2-350+1), x0,K_18_GRYF(x0-350+1));

OJ_18_GRYF = dlmread('NOJ18GRY_av_i.txt', '', 0, 0);
I3_OJ_18_GRYF= Index3_Index4(x1,OJ_18_GRYF(x1-350+1), x2, OJ_18_GRYF(x2-350+1), x0, OJ_18_GRYF(x0-350+1));

PD_18_GRYF = dlmread('NPD18GRY_av_i.txt', '', 0, 0);
I3_PD_18_GRYF = Index3_Index4(x1, PD_18_GRYF(x1-350+1), x2,PD_18_GRYF(x2-350+1), x0,PD_18_GRYF(x0-350+1));

RW_18_GRYF = dlmread('NRW18GRY_av_i.txt', '', 0, 0);
I3_RW_18_GRYF = Index3_Index4(x1, RW_18_GRYF(x1-350+1), x2, RW_18_GRYF(x2-350+1), x0, RW_18_GRYF(x0-350+1));

T_18_GRYF = dlmread('NTE18GRY_av_i.txt', '', 0, 0);
I3_T_18_GRYF = Index3_Index4(x1, T_18_GRYF(x1-350+1), x2,T_18_GRYF(x2-350+1), x0, T_18_GRYF(x0-350+1));

TS_18_GRYF = dlmread('TS18GRY_av_i.txt', '', 0, 0);
I3_TS_18_GRYF = Index3_Index4(x1, TS_18_GRYF(x1-350+1), x2, TS_18_GRYF(x2-350+1), x0, TS_18_GRYF(x0-350+1));


%%%%%%%%  30ML blood and confusors  %%%%%%%%%
filename = 'NBD30GRY_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_30_GRYF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_30_GRYF = dlmread('NAD30GRY_av_i.txt', '', 0, 0);
I3_AVD_30_GRYF = Index3_Index4(x1, AVD_30_GRYF(x1-350+1), x2, AVD_30_GRYF(x2-350+1), x0, AVD_30_GRYF(x0-350+1));

CO_30_GRYF = dlmread('NCO30GRY_av_i.txt', '', 0, 0);
I3_CO_30_GRYF  = Index3_Index4(x1, CO_30_GRYF (x1-350+1), x2, CO_30_GRYF (x2-350+1), x0, CO_30_GRYF (x0-350+1));

COF_30_GRYF = dlmread('NCF30GRY_av_i.txt', '', 0, 0);
I3_COF_30_GRYF = Index3_Index4(x1, COF_30_GRYF(x1-350+1), x2, COF_30_GRYF(x2-350+1), x0, COF_30_GRYF(x0-350+1));

K_30_GRYF = dlmread('K30GRY_av_i.txt', '', 0, 0);
I3_K_30_GRYF = Index3_Index4(x1, K_30_GRYF(x1-350+1), x2, K_30_GRYF(x2-350+1), x0,K_30_GRYF(x0-350+1));

OJ_30_GRYF = dlmread('NOJ30GRY_av_i.txt', '', 0, 0);
I3_OJ_30_GRYF= Index3_Index4(x1,OJ_30_GRYF(x1-350+1), x2, OJ_30_GRYF(x2-350+1), x0, OJ_30_GRYF(x0-350+1));

PD_30_GRYF = dlmread('NPD30GRY_av_i.txt', '', 0, 0);
I3_PD_30_GRYF = Index3_Index4(x1, PD_30_GRYF(x1-350+1), x2,PD_30_GRYF(x2-350+1), x0,PD_30_GRYF(x0-350+1));

RW_30_GRYF = dlmread('NRW30GRY_av_i.txt', '', 0, 0);
I3_RW_30_GRYF = Index3_Index4(x1, RW_30_GRYF(x1-350+1), x2, RW_30_GRYF(x2-350+1), x0, RW_30_GRYF(x0-350+1));

T_30_GRYF = dlmread('NTE30GRY_av_i.txt', '', 0, 0);
I3_T_30_GRYF = Index3_Index4(x1, T_30_GRYF(x1-350+1), x2,T_30_GRYF(x2-350+1), x0, T_30_GRYF(x0-350+1));

TS_30_GRYF = dlmread('TS30GRY_av_i.txt', '', 0, 0);
I3_TS_30_GRYF = Index3_Index4(x1, TS_30_GRYF(x1-350+1), x2, TS_30_GRYF(x2-350+1), x0, TS_30_GRYF(x0-350+1));



%%%%%%%%  40ML blood and confusors  %%%%%%%%%
filename = 'NBD40GRY_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_40_GRYF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_40_GRYF = dlmread('NAD40GRY_av_i.txt', '', 0, 0);
I3_AVD_40_GRYF = Index3_Index4(x1, AVD_40_GRYF(x1-350+1), x2, AVD_40_GRYF(x2-350+1), x0, AVD_40_GRYF(x0-350+1));

CO_40_GRYF = dlmread('NCO40GRY_av_i.txt', '', 0, 0);
I3_CO_40_GRYF  = Index3_Index4(x1, CO_40_GRYF (x1-350+1), x2, CO_40_GRYF (x2-350+1), x0, CO_40_GRYF (x0-350+1));

COF_40_GRYF = dlmread('NCF40GRY_av_i.txt', '', 0, 0);
I3_COF_40_GRYF = Index3_Index4(x1, COF_40_GRYF(x1-350+1), x2, COF_40_GRYF(x2-350+1), x0, COF_40_GRYF(x0-350+1));

K_40_GRYF = dlmread('K40GRY_av_i.txt', '', 0, 0);
I3_K_40_GRYF = Index3_Index4(x1, K_40_GRYF(x1-350+1), x2, K_40_GRYF(x2-350+1), x0,K_40_GRYF(x0-350+1));

OJ_40_GRYF = dlmread('NOJ40GRY_av_i.txt', '', 0, 0);
I3_OJ_40_GRYF= Index3_Index4(x1,OJ_40_GRYF(x1-350+1), x2, OJ_40_GRYF(x2-350+1), x0, OJ_40_GRYF(x0-350+1));

PD_40_GRYF = dlmread('NPD40GRY_av_i.txt', '', 0, 0);
I3_PD_40_GRYF = Index3_Index4(x1, PD_40_GRYF(x1-350+1), x2,PD_40_GRYF(x2-350+1), x0,PD_40_GRYF(x0-350+1));

RW_40_GRYF = dlmread('NRW40GRY_av_i.txt', '', 0, 0);
I3_RW_40_GRYF = Index3_Index4(x1, RW_40_GRYF(x1-350+1), x2, RW_40_GRYF(x2-350+1), x0, RW_40_GRYF(x0-350+1));

T_40_GRYF = dlmread('NTE40GRY_av_i.txt', '', 0, 0);
I3_T_40_GRYF = Index3_Index4(x1, T_40_GRYF(x1-350+1), x2,T_40_GRYF(x2-350+1), x0, T_40_GRYF(x0-350+1));

TS_40_GRYF = dlmread('TS40GRY_av_i.txt', '', 0, 0);
I3_TS_40_GRYF = Index3_Index4(x1, TS_40_GRYF(x1-350+1), x2, TS_40_GRYF(x2-350+1), x0, TS_40_GRYF(x0-350+1));




%%%%%%%%%%%%%%%%%   GREEN Felt   %%%%%%%%%%%%%%%%%%%%
filename = 'NBD4GRN_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_4_GRNF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_4_GRNF = dlmread('NAD4GRN_av_i.txt', '');
I3_AVD_4_GRNF = Index3_Index4(x1, AVD_4_GRNF(x1-350+1), x2, AVD_4_GRNF(x2-350+1), x0, AVD_4_GRNF(x0-350+1));

CO_4_GRNF = dlmread('NCO4GRN_av_i.txt', '');
I3_CO_4_GRNF  = Index3_Index4(x1, CO_4_GRNF (x1-350+1), x2, CO_4_GRNF (x2-350+1), x0, CO_4_GRNF (x0-350+1));

COF_4_GRNF = dlmread('NCF4GRN_av_i.txt', '');
I3_COF_4_GRNF = Index3_Index4(x1, COF_4_GRNF(x1-350+1), x2, COF_4_GRNF(x2-350+1), x0, COF_4_GRNF(x0-350+1));

K_4_GRNF = dlmread('NK4GRN_av_i.txt', '');
I3_K_4_GRNF = Index3_Index4(x1, K_4_GRNF(x1-350+1), x2, K_4_GRNF(x2-350+1), x0,K_4_GRNF(x0-350+1));

OJ_4_GRNF = dlmread('NOJ4GRN_av_i.txt', '');
I3_OJ_4_GRNF= Index3_Index4(x1,OJ_4_GRNF(x1-350+1), x2, OJ_4_GRNF(x2-350+1), x0, OJ_4_GRNF(x0-350+1));

PD_4_GRNF = dlmread('NPD4GRN_av_i.txt', '');
I3_PD_4_GRNF = Index3_Index4(x1, PD_4_GRNF(x1-350+1), x2,PD_4_GRNF(x2-350+1), x0,PD_4_GRNF(x0-350+1));

RW_4_GRNF = dlmread('NRW4GRN_av_i.txt', '');
I3_RW_4_GRNF = Index3_Index4(x1, RW_4_GRNF(x1-350+1), x2, RW_4_GRNF(x2-350+1), x0, RW_4_GRNF(x0-350+1));

T_4_GRNF = dlmread('NTE4GRN_av_i.txt', '');
I3_T_4_GRNF = Index3_Index4(x1, T_4_GRNF(x1-350+1), x2,T_4_GRNF(x2-350+1), x0, T_4_GRNF(x0-350+1));

TS_4_GRNF = dlmread('NTS4GRN_av_i.txt', '');
I3_TS_4_GRNF = Index3_Index4(x1, TS_4_GRNF(x1-350+1), x2, TS_4_GRNF(x2-350+1), x0, TS_4_GRNF(x0-350+1));


%%%%%%%%  10ML blood and confusors  %%%%%%%%%
filename = 'NBD10GRN_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_10_GRNF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_10_GRNF = dlmread('NAD10GRN_av_i.txt', '', 0, 0);
I3_AVD_10_GRNF = Index3_Index4(x1, AVD_10_GRNF(x1-350+1), x2, AVD_10_GRNF(x2-350+1), x0, AVD_10_GRNF(x0-350+1));

CO_10_GRNF = dlmread('NCO10GRN_av_i.txt', '', 0, 0);
I3_CO_10_GRNF  = Index3_Index4(x1, CO_10_GRNF (x1-350+1), x2, CO_10_GRNF (x2-350+1), x0, CO_10_GRNF (x0-350+1));

COF_10_GRNF = dlmread('NCF10GRN_av_i.txt', '', 0, 0);
I3_COF_10_GRNF = Index3_Index4(x1, COF_10_GRNF(x1-350+1), x2, COF_10_GRNF(x2-350+1), x0, COF_10_GRNF(x0-350+1));

K_10_GRNF = dlmread('NK10GRN_av_i.txt', '', 0, 0);
I3_K_10_GRNF = Index3_Index4(x1, K_10_GRNF(x1-350+1), x2, K_10_GRNF(x2-350+1), x0,K_10_GRNF(x0-350+1));

OJ_10_GRNF = dlmread('NOJ10GRN_av_i.txt', '', 0, 0);
I3_OJ_10_GRNF= Index3_Index4(x1,OJ_10_GRNF(x1-350+1), x2, OJ_10_GRNF(x2-350+1), x0, OJ_10_GRNF(x0-350+1));

PD_10_GRNF = dlmread('NPD10GRN_av_i.txt', '', 0, 0);
I3_PD_10_GRNF = Index3_Index4(x1, PD_10_GRNF(x1-350+1), x2,PD_10_GRNF(x2-350+1), x0,PD_10_GRNF(x0-350+1));

RW_10_GRNF = dlmread('NRW10GRN_av_i.txt', '', 0, 0);
I3_RW_10_GRNF = Index3_Index4(x1, RW_10_GRNF(x1-350+1), x2, RW_10_GRNF(x2-350+1), x0, RW_10_GRNF(x0-350+1));

T_10_GRNF = dlmread('NTE10GRN_av_i.txt', '', 0, 0);
I3_T_10_GRNF = Index3_Index4(x1, T_10_GRNF(x1-350+1), x2,T_10_GRNF(x2-350+1), x0, T_10_GRNF(x0-350+1));

TS_10_GRNF = dlmread('NTS10GRN_av_i.txt', '', 0, 0);
I3_TS_10_GRNF = Index3_Index4(x1, TS_10_GRNF(x1-350+1), x2, TS_10_GRNF(x2-350+1), x0, TS_10_GRNF(x0-350+1));


%%%%%%%%  18ML blood and confusors  %%%%%%%%%
filename = 'NBD18GRN_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_18_GRNF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_18_GRNF = dlmread('NAD18GRN_av_i.txt', '', 0, 0);
I3_AVD_18_GRNF = Index3_Index4(x1, AVD_18_GRNF(x1-350+1), x2, AVD_18_GRNF(x2-350+1), x0, AVD_18_GRNF(x0-350+1));

CO_18_GRNF = dlmread('NCO18GRN_av_i.txt', '', 0, 0);
I3_CO_18_GRNF  = Index3_Index4(x1, CO_18_GRNF (x1-350+1), x2, CO_18_GRNF (x2-350+1), x0, CO_18_GRNF (x0-350+1));

COF_18_GRNF = dlmread('NCF18GRN_av_i.txt', '', 0, 0);
I3_COF_18_GRNF = Index3_Index4(x1, COF_18_GRNF(x1-350+1), x2, COF_18_GRNF(x2-350+1), x0, COF_18_GRNF(x0-350+1));

K_18_GRNF = dlmread('K18GRN_av_i.txt', '', 0, 0);
I3_K_18_GRNF = Index3_Index4(x1, K_18_GRNF(x1-350+1), x2, K_18_GRNF(x2-350+1), x0,K_18_GRNF(x0-350+1));

OJ_18_GRNF = dlmread('NOJ18GRN_av_i.txt', '', 0, 0);
I3_OJ_18_GRNF= Index3_Index4(x1,OJ_18_GRNF(x1-350+1), x2, OJ_18_GRNF(x2-350+1), x0, OJ_18_GRNF(x0-350+1));

PD_18_GRNF = dlmread('NPD18GRN_av_i.txt', '', 0, 0);
I3_PD_18_GRNF = Index3_Index4(x1, PD_18_GRNF(x1-350+1), x2,PD_18_GRNF(x2-350+1), x0,PD_18_GRNF(x0-350+1));

RW_18_GRNF = dlmread('NRW18GRN_av_i.txt', '', 0, 0);
I3_RW_18_GRNF = Index3_Index4(x1, RW_18_GRNF(x1-350+1), x2, RW_18_GRNF(x2-350+1), x0, RW_18_GRNF(x0-350+1));

T_18_GRNF = dlmread('NTE18GRN_av_i.txt', '', 0, 0);
I3_T_18_GRNF = Index3_Index4(x1, T_18_GRNF(x1-350+1), x2,T_18_GRNF(x2-350+1), x0, T_18_GRNF(x0-350+1));

TS_18_GRNF = dlmread('TS18GRN_av_i.txt', '', 0, 0);
I3_TS_18_GRNF = Index3_Index4(x1, TS_18_GRNF(x1-350+1), x2, TS_18_GRNF(x2-350+1), x0, TS_18_GRNF(x0-350+1));


%%%%%%%%  30ML blood and confusors  %%%%%%%%%
filename = 'NBD30GRN_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_30_GRNF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_30_GRNF = dlmread('NAD30GRN_av_i.txt', '', 0, 0);
I3_AVD_30_GRNF = Index3_Index4(x1, AVD_30_GRNF(x1-350+1), x2, AVD_30_GRNF(x2-350+1), x0, AVD_30_GRNF(x0-350+1));

CO_30_GRNF = dlmread('NCO30GRN_av_i.txt', '', 0, 0);
I3_CO_30_GRNF  = Index3_Index4(x1, CO_30_GRNF (x1-350+1), x2, CO_30_GRNF (x2-350+1), x0, CO_30_GRNF (x0-350+1));

COF_30_GRNF = dlmread('NCF30GRN_av_i.txt', '', 0, 0);
I3_COF_30_GRNF = Index3_Index4(x1, COF_30_GRNF(x1-350+1), x2, COF_30_GRNF(x2-350+1), x0, COF_30_GRNF(x0-350+1));

K_30_GRNF = dlmread('K30GRN_av_i.txt', '', 0, 0);
I3_K_30_GRNF = Index3_Index4(x1, K_30_GRNF(x1-350+1), x2, K_30_GRNF(x2-350+1), x0,K_30_GRNF(x0-350+1));

OJ_30_GRNF = dlmread('NOJ30GRN_av_i.txt', '', 0, 0);
I3_OJ_30_GRNF= Index3_Index4(x1,OJ_30_GRNF(x1-350+1), x2, OJ_30_GRNF(x2-350+1), x0, OJ_30_GRNF(x0-350+1));

PD_30_GRNF = dlmread('NPD30GRN_av_i.txt', '', 0, 0);
I3_PD_30_GRNF = Index3_Index4(x1, PD_30_GRNF(x1-350+1), x2,PD_30_GRNF(x2-350+1), x0,PD_30_GRNF(x0-350+1));

RW_30_GRNF = dlmread('NRW30GRN_av_i.txt', '', 0, 0);
I3_RW_30_GRNF = Index3_Index4(x1, RW_30_GRNF(x1-350+1), x2, RW_30_GRNF(x2-350+1), x0, RW_30_GRNF(x0-350+1));

T_30_GRNF = dlmread('NTE30GRN_av_i.txt', '', 0, 0);
I3_T_30_GRNF = Index3_Index4(x1, T_30_GRNF(x1-350+1), x2,T_30_GRNF(x2-350+1), x0, T_30_GRNF(x0-350+1));

TS_30_GRNF = dlmread('TS30GRN_av_i.txt', '', 0, 0);
I3_TS_30_GRNF = Index3_Index4(x1, TS_30_GRNF(x1-350+1), x2, TS_30_GRNF(x2-350+1), x0, TS_30_GRNF(x0-350+1));


%%%%%%%%  40ML blood and confusors  %%%%%%%%%
filename = 'NBD40GRN_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_40_GRNF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_40_GRNF = dlmread('NAD40GRN_av_i.txt', '', 0, 0);
I3_AVD_40_GRNF = Index3_Index4(x1, AVD_40_GRNF(x1-350+1), x2, AVD_40_GRNF(x2-350+1), x0, AVD_40_GRNF(x0-350+1));

CO_40_GRNF = dlmread('NCO40GRN_av_i.txt', '', 0, 0);
I3_CO_40_GRNF  = Index3_Index4(x1, CO_40_GRNF (x1-350+1), x2, CO_40_GRNF (x2-350+1), x0, CO_40_GRNF (x0-350+1));

COF_40_GRNF = dlmread('NCF40GRN_av_i.txt', '', 0, 0);
I3_COF_40_GRNF = Index3_Index4(x1, COF_40_GRNF(x1-350+1), x2, COF_40_GRNF(x2-350+1), x0, COF_40_GRNF(x0-350+1));

K_40_GRNF = dlmread('K40GRN_av_i.txt', '', 0, 0);
I3_K_40_GRNF = Index3_Index4(x1, K_40_GRNF(x1-350+1), x2, K_40_GRNF(x2-350+1), x0,K_40_GRNF(x0-350+1));

OJ_40_GRNF = dlmread('NOJ40GRN_av_i.txt', '', 0, 0);
I3_OJ_40_GRNF= Index3_Index4(x1,OJ_40_GRNF(x1-350+1), x2, OJ_40_GRNF(x2-350+1), x0, OJ_40_GRNF(x0-350+1));

PD_40_GRNF = dlmread('NPD40GRN_av_i.txt', '', 0, 0);
I3_PD_40_GRNF = Index3_Index4(x1, PD_40_GRNF(x1-350+1), x2,PD_40_GRNF(x2-350+1), x0,PD_40_GRNF(x0-350+1));

RW_40_GRNF = dlmread('NRW40GRN_av_i.txt', '', 0, 0);
I3_RW_40_GRNF = Index3_Index4(x1, RW_40_GRNF(x1-350+1), x2, RW_40_GRNF(x2-350+1), x0, RW_40_GRNF(x0-350+1));

T_40_GRNF = dlmread('NTE40GRN_av_i.txt', '', 0, 0);
I3_T_40_GRNF = Index3_Index4(x1, T_40_GRNF(x1-350+1), x2,T_40_GRNF(x2-350+1), x0, T_40_GRNF(x0-350+1));

TS_40_GRNF = dlmread('TS40GRN_av_i.txt', '', 0, 0);
I3_TS_40_GRNF = Index3_Index4(x1, TS_40_GRNF(x1-350+1), x2, TS_40_GRNF(x2-350+1), x0, TS_40_GRNF(x0-350+1));



%%%%%%%%%%%%%%%%%   RED Felt   %%%%%%%%%%%%%%%%%%%%
filename = '4blood_REDFELT_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_4_REDF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_4_REDF = dlmread('AVD4_REDFELT_av_i.txt', '');
I3_AVD_4_REDF = Index3_Index4(x1, AVD_4_REDF(x1-350+1), x2, AVD_4_REDF(x2-350+1), x0, AVD_4_REDF(x0-350+1));

CO_4_REDF = dlmread('NCO4RED_av_i.txt', '');
I3_CO_4_REDF  = Index3_Index4(x1, CO_4_REDF (x1-350+1), x2, CO_4_REDF (x2-350+1), x0, CO_4_REDF (x0-350+1));

COF_4_REDF = dlmread('C4_REDFELT_av_i.txt', '');
I3_COF_4_REDF = Index3_Index4(x1, COF_4_REDF(x1-350+1), x2, COF_4_REDF(x2-350+1), x0, COF_4_REDF(x0-350+1));

%K_2_REDF = dlmread('K2_REDFELT_av_i.txt', '');
OJ_4_REDF = dlmread('OJ4_REDFELT_av_i.txt', '');
I3_OJ_4_REDF= Index3_Index4(x1,OJ_4_REDF(x1-350+1), x2, OJ_4_REDF(x2-350+1), x0, OJ_4_REDF(x0-350+1));

PD_4_REDF = dlmread('PD4_REDFELT_av_i.txt', '');
I3_PD_4_REDF = Index3_Index4(x1, PD_4_REDF(x1-350+1), x2,PD_4_GRNF(x2-350+1), x0,PD_4_REDF(x0-350+1));

RW_4_REDF = dlmread('RW4_REDFELT_av_i.txt', '');
I3_RW_4_REDF = Index3_Index4(x1, RW_4_REDF(x1-350+1), x2, RW_4_REDF(x2-350+1), x0, RW_4_REDF(x0-350+1));

T_4_REDF = dlmread('T4_REDFELT_av_i.txt', '');
I3_T_4_REDF = Index3_Index4(x1, T_4_REDF(x1-350+1), x2,T_4_REDF(x2-350+1), x0, T_4_REDF(x0-350+1));

TS_2_REDF = dlmread('TS2_REDFELT_av_i.txt', '');
I3_TS_2_REDF = Index3_Index4(x1, TS_2_REDF(x1-350+1), x2, TS_2_REDF(x2-350+1), x0, TS_2_REDF(x0-350+1));

filename = '8blood_REDFELT_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_8_REDF = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_8_REDF = dlmread('AVD8_REDFELT_av_i.txt', '');
I3_AVD_8_REDF = Index3_Index4(x1, AVD_8_REDF(x1-350+1), x2, AVD_8_REDF(x2-350+1), x0, AVD_8_REDF(x0-350+1));

CO_8_REDF = dlmread('NCO8RED_av_i.txt', '');
I3_CO_8_REDF  = Index3_Index4(x1, CO_8_REDF (x1-350+1), x2, CO_8_REDF (x2-350+1), x0, CO_8_REDF (x0-350+1));

COF_8_REDF = dlmread('C8_REDFELT_av_i.txt', '');
I3_COF_8_REDF = Index3_Index4(x1, COF_8_REDF(x1-350+1), x2, COF_8_REDF(x2-350+1), x0, COF_8_REDF(x0-350+1));

OJ_8_REDF = dlmread('OJ8_REDFELT_av_i.txt', '');
I3_OJ_8_REDF= Index3_Index4(x1,OJ_8_REDF(x1-350+1), x2, OJ_8_REDF(x2-350+1), x0, OJ_8_REDF(x0-350+1));

PD_8_REDF = dlmread('PD8_REDFELT_av_i.txt', '');
I3_PD_8_REDF = Index3_Index4(x1, PD_8_REDF(x1-350+1), x2,PD_8_REDF(x2-350+1), x0,PD_8_REDF(x0-350+1));

RW_8_REDF = dlmread('RW8_REDFELT_av_i.txt', '');
I3_RW_8_REDF = Index3_Index4(x1, RW_8_REDF(x1-350+1), x2, RW_8_REDF(x2-350+1), x0, RW_8_REDF(x0-350+1));

T_8_REDF = dlmread('T8_REDFELT_av_i.txt', '');
I3_T_8_REDF = Index3_Index4(x1, T_8_REDF(x1-350+1), x2,T_8_REDF(x2-350+1), x0, T_8_REDF(x0-350+1));

TS_4_REDF = dlmread('TS4_REDFELT_av_i.txt', '');
I3_TS_4_REDF = Index3_Index4(x1, TS_4_REDF(x1-350+1), x2, TS_4_REDF(x2-350+1), x0, TS_4_REDF(x0-350+1));

%%%%%%%%%%%%%%%%%   Cotton T-shirt   %%%%%%%%%%%%%%%%%%%%
filename = '2blood_COTNTSHIT_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_2_COTNT = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_2_COTNT = dlmread('AVD2_WHICOTN_av_i.txt', '');
I3_AVD_2_COTNT = Index3_Index4(x1, AVD_2_COTNT(x1-350+1), x2, AVD_2_COTNT(x2-350+1), x0, AVD_2_COTNT(x0-350+1));

CO_2_COTNT = dlmread('NCO2CT_av_i.txt', '');
I3_CO_2_COTNT = Index3_Index4(x1, CO_2_COTNT(x1-350+1), x2, CO_2_COTNT(x2-350+1), x0, CO_2_COTNT(x0-350+1));

COF_2_COTNT = dlmread('C2_WHICOTN_av_i.txt', '');
I3_COF_2_COTNT = Index3_Index4(x1, COF_2_COTNT(x1-350+1), x2, COF_2_COTNT(x2-350+1), x0, COF_2_COTNT(x0-350+1));

K_2_COTNT = dlmread('K2_WHICOTN_av_i.txt', '');
I3_K_2_COTNT = Index3_Index4(x1, K_2_COTNT(x1-350+1), x2, K_2_COTNT(x2-350+1), x0,K_2_COTNT(x0-350+1));

OJ_2_COTNT = dlmread('OJ2_WHICOTN_av_i.txt', '');
I3_OJ_2_COTNT = Index3_Index4(x1,OJ_2_COTNT(x1-350+1), x2, OJ_2_COTNT(x2-350+1), x0, OJ_2_COTNT(x0-350+1));

PD_2_COTNT = dlmread('PD2_WHICOTN_av_i.txt', '');
I3_PD_2_COTNT = Index3_Index4(x1, PD_2_COTNT(x1-350+1), x2,PD_2_COTNT(x2-350+1), x0,PD_2_COTNT(x0-350+1));

RW_2_COTNT = dlmread('RW2_WHICOTN_av_i.txt', '');
I3_RW_2_COTNT = Index3_Index4(x1, RW_2_COTNT(x1-350+1), x2, RW_2_COTNT(x2-350+1), x0, RW_2_COTNT(x0-350+1));

T_2_COTNT = dlmread('T2_WHICOTN_av_i.txt', '');
I3_T_2_COTNT = Index3_Index4(x1, T_2_COTNT(x1-350+1), x2,T_2_COTNT(x2-350+1), x0, T_2_COTNT(x0-350+1));

TS_2_COTNT = dlmread('TS2_WHICOTN_av_i.txt', '');
I3_TS_2_COTNT = Index3_Index4(x1, TS_2_COTNT(x1-350+1), x2, TS_2_COTNT(x2-350+1), x0, TS_2_COTNT(x0-350+1));

%%%%%%%%%%%%%%%%%   POLYESTER T-shirt   %%%%%%%%%%%%%%%%%%%%
filename = '2blood_POLY_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_2_POLY = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_2_POLY = dlmread('AVD2_WHIPOLY_av_i.txt', '');
I3_AVD_2_POLY = Index3_Index4(x1, AVD_2_POLY(x1-350+1), x2, AVD_2_POLY(x2-350+1), x0, AVD_2_POLY(x0-350+1));

CO_2_POLY = dlmread('NCO2PT_av_i.txt', '');
I3_CO_2_POLY = Index3_Index4(x1, CO_2_POLY(x1-350+1), x2, CO_2_POLY(x2-350+1), x0, CO_2_POLY(x0-350+1));

COF_2_POLY = dlmread('C2_WHIPOLY_av_i.txt', '');
I3_COF_2_POLY = Index3_Index4(x1, COF_2_POLY(x1-350+1), x2, COF_2_POLY(x2-350+1), x0, COF_2_POLY(x0-350+1));

K_2_POLY = dlmread('K2_WHIPOLY_av_i.txt', '');
I3_K_2_POLY = Index3_Index4(x1, K_2_POLY(x1-350+1), x2, K_2_POLY(x2-350+1), x0,K_2_POLY(x0-350+1));

OJ_2_POLY = dlmread('OJ2_WHIPOLY_av_i.txt', '');
I3_OJ_2_POLY = Index3_Index4(x1,OJ_2_POLY(x1-350+1), x2, OJ_2_POLY(x2-350+1), x0, OJ_2_POLY(x0-350+1));

PD_2_POLY = dlmread('PD2_WHIPOLY_av_i.txt', '');
I3_PD_2_POLY = Index3_Index4(x1, PD_2_POLY(x1-350+1), x2,PD_2_POLY(x2-350+1), x0,PD_2_POLY(x0-350+1));

RW_2_POLY = dlmread('RW2_WHIPOLY_av_i.txt', '');
I3_RW_2_POLY = Index3_Index4(x1, RW_2_POLY(x1-350+1), x2, RW_2_POLY(x2-350+1), x0, RW_2_POLY(x0-350+1));

T_2_POLY = dlmread('T2_WHIPOLY_av_i.txt', '');
I3_T_2_POLY = Index3_Index4(x1, T_2_POLY(x1-350+1), x2,T_2_POLY(x2-350+1), x0, T_2_POLY(x0-350+1));

TS_2_POLY = dlmread('TS2_WHIPOLY_av_i.txt', '');
I3_TS_2_POLY = Index3_Index4(x1, TS_2_POLY(x1-350+1), x2, TS_2_POLY(x2-350+1), x0, TS_2_POLY(x0-350+1));

%%%%%%%%%%%%%%%%%   JEANS   %%%%%%%%%%%%%%%%%%%%
filename = '2blood_JEANS_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_2_J = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_2_J = dlmread('AVD2_JEANS_av_i.txt', '');
I3_AVD_2_J = Index3_Index4(x1, AVD_2_J(x1-350+1), x2, AVD_2_J(x2-350+1), x0, AVD_2_J(x0-350+1));

CO_2_J = dlmread('NCO2J_av_i.txt', '');
I3_CO_2_J = Index3_Index4(x1, CO_2_J(x1-350+1), x2, CO_2_J(x2-350+1), x0, CO_2_J(x0-350+1));

COF_2_J = dlmread('C2_JEANS_av_i.txt', '');
I3_COF_2_J = Index3_Index4(x1, COF_2_J(x1-350+1), x2, COF_2_J(x2-350+1), x0, COF_2_J(x0-350+1));

K_2_J = dlmread('K2_JEANS_av_i.txt', '');
I3_K_2_J = Index3_Index4(x1, K_2_J(x1-350+1), x2, K_2_J(x2-350+1), x0,K_2_J(x0-350+1));

OJ_2_J = dlmread('OJ2_JEANS_av_i.txt', '');
I3_OJ_2_J = Index3_Index4(x1,OJ_2_J(x1-350+1), x2, OJ_2_J(x2-350+1), x0, OJ_2_J(x0-350+1));

PD_2_J = dlmread('PD2_JEANS_av_i.txt', '');
I3_PD_2_J = Index3_Index4(x1, PD_2_J(x1-350+1), x2,PD_2_J(x2-350+1), x0,PD_2_J(x0-350+1));

RW_2_J = dlmread('RW2_JEANS_av_i.txt', '');
I3_RW_2_J = Index3_Index4(x1, RW_2_J(x1-350+1), x2, RW_2_J(x2-350+1), x0, RW_2_J(x0-350+1));

T_2_J = dlmread('T2_JEANS_av_i.txt', '');
I3_T_2_J = Index3_Index4(x1, T_2_J(x1-350+1), x2,T_2_J(x2-350+1), x0, T_2_J(x0-350+1));

TS_2_J = dlmread('TS2_JEANS_av_i.txt', '');
I3_TS_2_J = Index3_Index4(x1, TS_2_J(x1-350+1), x2, TS_2_J(x2-350+1), x0, TS_2_J(x0-350+1));


%%%%%%%%%%%%%%%%%   WOOD   %%%%%%%%%%%%%%%%%%%%
filename = '1blood_WOOD_av_i.txt';
[pks, pks_locs] = Find_Pks_And_Valleys(filename , 600, 800);
x1 = pks_locs; y1 = pks;
[pks, pks_locs] = Find_Pks_And_Valleys( filename, PKS_BGN, PKS_END);
x2 = pks_locs; y2 = pks;
[~, ~, valleys, valy_locs] = Find_Pks_And_Valleys( filename, 800, 1000);
x0 = valy_locs; y0 = valleys;
I3_blood_1_WOOD = Index3_Index4(x1, y1, x2, y2, x0, y0);

AVD_1_WOOD = dlmread('AVD1_WOOD_av_i.txt', '');
I3_AVD_1_WOOD = Index3_Index4(x1, AVD_1_WOOD(x1-350+1), x2, AVD_1_WOOD(x2-350+1), x0, AVD_1_WOOD(x0-350+1));

CO_1_WOOD = dlmread('NCO1W_av_i.txt', '');
I3_CO_1_WOOD = Index3_Index4(x1, CO_1_WOOD(x1-350+1), x2, CO_1_WOOD(x2-350+1), x0, CO_1_WOOD(x0-350+1));

COF_1_WOOD = dlmread('C1_WOOD_av_i.txt', '');
I3_COF_1_WOOD = Index3_Index4(x1, COF_1_WOOD(x1-350+1), x2, COF_1_WOOD(x2-350+1), x0, COF_1_WOOD(x0-350+1));

K_1_WOOD = dlmread('K1_WOOD_av_i.txt', '');
I3_K_1_WOOD = Index3_Index4(x1, K_1_WOOD(x1-350+1), x2, K_1_WOOD(x2-350+1), x0,K_1_WOOD(x0-350+1));

OJ_1_WOOD = dlmread('OJ1_WOOD_av_i.txt', '');
I3_OJ_1_WOOD = Index3_Index4(x1,OJ_1_WOOD(x1-350+1), x2, OJ_1_WOOD(x2-350+1), x0, OJ_1_WOOD(x0-350+1));

PD_1_WOOD = dlmread('PD1_WOOD_av_i.txt', '');
I3_PD_1_WOOD = Index3_Index4(x1, PD_1_WOOD(x1-350+1), x2,PD_1_WOOD(x2-350+1), x0,PD_1_WOOD(x0-350+1));

RW_1_WOOD = dlmread('RW1_WOOD_av_i.txt', '');
I3_RW_1_WOOD = Index3_Index4(x1, RW_1_WOOD(x1-350+1), x2, RW_1_WOOD(x2-350+1), x0, RW_1_WOOD(x0-350+1));

T_1_WOOD = dlmread('T1_WOOD_av_i.txt', '');
I3_T_1_WOOD = Index3_Index4(x1, T_1_WOOD(x1-350+1), x2,T_1_WOOD(x2-350+1), x0, T_1_WOOD(x0-350+1));

TS_1_WOOD = dlmread('TS1_WOOD_av_i.txt', '');
I3_TS_1_WOOD = Index3_Index4(x1, TS_1_WOOD(x1-350+1), x2, TS_1_WOOD(x2-350+1), x0, TS_1_WOOD(x0-350+1));


figure('color', 'w'); hold on;
%{
plot(10.5, -0.5:0.005:2, 'k-');
plot(20.5, -0.5:0.005:2, 'k-');
plot(30.5, -0.5:0.005:2, 'k-');
plot(40.5, -0.5:0.005:2, 'k-');
plot(50.5, -0.5:0.005:2, 'k-');
plot(60.5, -0.5:0.005:2, 'k-');
plot(70.5, -0.5:0.005:2, 'k-');
plot(80.5, -0.5:0.005:2, 'k-');
plot(90.5, -0.5:0.005:2, 'k-');
plot(100.5, -0.5:0.005:2, 'k-');
plot(110.5, -0.5:0.005:2, 'k-');
plot(120.5, -0.5:0.005:2, 'k-');
plot(130.5, -0.5:0.005:2, 'k-');
plot(140.5, -0.5:0.005:2, 'k-');
plot(150.5, -0.5:0.005:2, 'k-');
plot(160.5, -0.5:0.005:2, 'k-');
plot(170.5, -0.5:0.005:2, 'k-');
plot(180.5, -0.5:0.005:2, 'k-');
plot(190.5, -0.5:0.005:2, 'k-');
plot(200.5, -0.5:0.005:2, 'k-');
plot(210.5, -0.5:0.005:2, 'k-');
plot(220.5, -0.5:0.005:2, 'k-');
plot(230.5, -0.5:0.005:2, 'k-');
plot(240.5, -0.5:0.005:2, 'k-');
plot(250.5, -0.5:0.005:2, 'k-');
plot(260.5, -0.5:0.005:2, 'k-');
%}
%{
plot(10.5, -1:0.005:2.5, 'k-');
plot(20.5, -1:0.005:2.5, 'k-');
plot(30.5, -1:0.005:2.5, 'k-');
plot(40.5, -1:0.005:2.5, 'k-');
plot(50.5, -1:0.005:2.5, 'k-');
plot(60.5, -1:0.005:2.5, 'k-');
plot(70.5, -1:0.005:2.5, 'k-');
plot(80.5, -1:0.005:2.5, 'k-');
plot(90.5, -1:0.005:2.5, 'k-');
plot(100.5, -1:0.005:2.5, 'k-');
plot(110.5, -1:0.005:2.5, 'k-');
plot(120.5, -1:0.005:2.5, 'k-');
plot(130.5, -1:0.005:2.5, 'k-');
plot(140.5, -1:0.005:2.5, 'k-');
plot(150.5, -1:0.005:2.5, 'k-');
plot(160.5, -1:0.005:2.5, 'k-');
plot(170.5, -1:0.005:2.5, 'k-');
plot(180.5, -1:0.005:2.5, 'k-');
plot(190.5, -1:0.005:2.5, 'k-');
plot(200.5, -1:0.005:2.5, 'k-');
plot(210.5, -1:0.005:2.5, 'k-');
plot(220.5, -1:0.005:2.5, 'k-');
plot(230.5, -1:0.005:2.5, 'k-');
plot(240.5, -1:0.005:2.5, 'k-');
plot(250.5, -1:0.005:2.5, 'k-');
plot(260.5, -1:0.005:2.5, 'k-');
%}


plot(10.5, -0.6:0.005:2, 'k-');
plot(20.5, -0.6:0.005:2, 'k-');
plot(30.5, -0.6:0.005:2, 'k-');
plot(40.5, -0.6:0.005:2, 'k-');
plot(50.5, -0.6:0.005:1, 'k-');
plot(60.5, -0.6:0.005:1, 'k-');
plot(70.5, -0.6:0.005:1, 'k-');
plot(80.5, -0.6:0.005:1, 'k-');
plot(90.5, -0.6:0.005:1, 'k-');
plot(100.5, -0.6:0.005:1, 'k-');
plot(110.5, -0.6:0.005:1, 'k-');
plot(120.5, -0.6:0.005:1, 'k-');
plot(130.5, -0.6:0.005:1, 'k-');
plot(140.5, -0.6:0.005:1, 'k-');
plot(150.5, -0.6:0.005:1, 'k-');
plot(160.5, -0.6:0.005:1, 'k-');
plot(170.5, -0.6:0.005:1, 'k-');
plot(180.5, -0.6:0.005:1, 'k-');
plot(190.5, -0.6:0.005:1, 'k-');
plot(200.5, -0.6:0.005:1, 'k-');
plot(210.5, -0.6:0.005:1, 'k-');
plot(220.5, -0.6:0.005:1, 'k-');
plot(230.5, -0.6:0.005:1, 'k-');
plot(240.5, -0.6:0.005:1, 'k-');
plot(250.5, -0.6:0.005:1, 'k-');
plot(260.5, -0.6:0.005:1, 'k-');
%}

title('Blood Separation from Confusors', 'FontSize', 16); xlabel('None-samples Representation', 'FontSize', 14);ylabel('Band Depth over valley value', 'FontSize', 14);
xlim([0 261]);
ylim = ([-1 2.5]);
%ylim = ([-0.5 2]);
%LINESTYLE = {'G*','B*','M*', 'C*', 'Y*', 'K*', rgb('orange'),rgb('DarkRed'), rgb('')};

h(10)=scatter(1, I3_blood_4, 'r', 'filled');

h(1) = plot(2, I3_AVD_4_P, '*');
h(2) = plot(3, I3_CO_4_P, '*');
h(3) = plot(4, I3_COF_4_P, '*');
h(4) = plot(5, I3_K_4_P, '*');
h(5) = plot(6, I3_OJ_4_P, '*');
h(6) = plot(7, I3_PD_4_P, '*');
h(7) = plot(8, I3_RW_4_P, '*');
h(8) = plot(9, I3_T_4_P, '*');
h(9) = plot(10, I3_TS_4_P, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

legend(h([10 1 2 3 4 5 6 7 8 9]), 'BLOOD', 'ALOE VERA DRINK', 'COLA', 'COFFEE', 'KETCHUP', 'ORANGE JUICE', 'PLUM DRINK', 'RED WINE', 'TEA', 'TOMATO SAUCE');
set(legend, 'FontSize', 10);



h(10)=scatter(11, I3_blood_10, 'r', 'filled');

h(1) = plot(12, I3_AVD_10_P, '*');
h(2) = plot(13, I3_CO_10_P, '*');
h(3) = plot(14, I3_COF_10_P, '*');
h(4) = plot(15, I3_K_10_P, '*');
h(5) = plot(16, I3_OJ_10_P, '*');
h(6) = plot(17, I3_PD_10_P, '*');
h(7) = plot(18, I3_RW_10_P, '*');
h(8) = plot(19, I3_T_10_P, '*');
h(9) = plot(20, I3_TS_10_P, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


scatter(21, I3_blood_18, 'r', 'filled');

h(1) = plot(22, I3_AVD_18_P, '*');
h(2) = plot(23, I3_CO_18_P, '*');
h(3) = plot(24, I3_COF_18_P, '*');
h(4) = plot(25, I3_K_18_P, '*');
h(5) = plot(26, I3_OJ_18_P, '*');
h(6) = plot(27, I3_PD_18_P, '*');
h(7) = plot(28, I3_RW_18_P, '*');
h(8) = plot(29, I3_T_18_P, '*');
h(9) = plot(30, I3_TS_18_P, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

scatter(31, I3_blood_30, 'r', 'filled');


h(1) = plot(32, I3_AVD_30_P, '*');
h(2) = plot(33, I3_CO_30_P, '*');
h(3) = plot(34, I3_COF_30_P, '*');
h(4) = plot(35, I3_K_30_P, '*');
h(5) = plot(36, I3_OJ_30_P, '*');
h(6) = plot(37, I3_PD_30_P, '*');
h(7) = plot(38, I3_RW_30_P, '*');
h(8) = plot(39, I3_T_30_P, '*');
h(9) = plot(40, I3_TS_30_P, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


scatter(41, I3_blood_40, 'r', 'filled');

h(1) = plot(42, I3_AVD_40_P, '*');
h(2) = plot(43, I3_CO_40_P, '*');
h(3) = plot(44, I3_COF_40_P, '*');
h(4) = plot(45, I3_K_40_P, '*');
h(5) = plot(46, I3_OJ_40_P, '*');
h(6) = plot(47, I3_PD_40_P, '*');
h(7) = plot(48, I3_RW_40_P, '*');
h(8) = plot(49, I3_T_40_P, '*');
h(9) = plot(50, I3_TS_40_P, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


scatter(51, I3_blood_4_BLKF, 'r', 'filled');

h(1) = plot(52, I3_AVD_4_BLKF, '*');
h(2) = plot(53, I3_CO_4_BLKF, '*');
h(3) = plot(54, I3_COF_4_BLKF, '*');
h(4) = plot(55, I3_K_4_BLKF, '*');
h(5) = plot(56, I3_OJ_4_BLKF, '*');
h(6) = plot(57, I3_PD_4_BLKF, '*');
h(7) = plot(58, I3_RW_4_BLKF, '*');
h(8) = plot(59, I3_T_4_BLKF, '*');
h(9) = plot(60, I3_TS_4_BLKF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


scatter(61, I3_blood_10_BLKF, 'r', 'filled');

h(1) = plot(62, I3_AVD_10_BLKF, '*');
h(2) = plot(63, I3_CO_10_BLKF, '*');
h(3) = plot(64, I3_COF_10_BLKF, '*');
h(4) = plot(65, I3_K_10_BLKF, '*');
h(5) = plot(66, I3_OJ_10_BLKF, '*');
h(6) = plot(67, I3_PD_10_BLKF, '*');
h(7) = plot(68, I3_RW_10_BLKF, '*');
h(8) = plot(69, I3_T_10_BLKF, '*');
h(9) = plot(70, I3_TS_10_BLKF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

scatter(71, I3_blood_18_BLKF, 'r', 'filled');

h(1) = plot(72, I3_AVD_18_BLKF , '*');
h(2) = plot(73, I3_CO_18_BLKF, '*');
h(3) = plot(74, I3_COF_18_BLKF, '*');
h(4) = plot(75, I3_K_18_BLKF, '*');
h(5) = plot(76, I3_OJ_18_BLKF, '*');
h(6) = plot(77, I3_PD_18_BLKF, '*');
h(7) = plot(78, I3_RW_18_BLKF, '*');
h(8) = plot(79, I3_T_18_BLKF, '*');
h(9) = plot(80, I3_TS_18_BLKF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

scatter(81, I3_blood_30_BLKF, 'r', 'filled');

h(1) = plot(82, I3_AVD_30_BLKF, '*');
h(2) = plot(83, I3_CO_30_BLKF, '*');
h(3) = plot(84, I3_COF_30_BLKF, '*');
h(4) = plot(85, I3_K_30_BLKF, '*');
h(5) = plot(86, I3_OJ_30_BLKF, '*');
h(6) = plot(87, I3_PD_30_BLKF, '*');
h(7) = plot(88, I3_RW_30_BLKF, '*');
h(8) = plot(89, I3_T_30_BLKF, '*');
h(9) = plot(90, I3_TS_30_BLKF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


scatter(91, I3_blood_40_BLKF, 'r', 'filled');

h(1) = plot(92, I3_AVD_40_BLKF, '*');
h(2) = plot(93, I3_CO_40_BLKF, '*');
h(3) = plot(94, I3_COF_40_BLKF, '*');
h(4) = plot(95, I3_K_40_BLKF, '*');
h(5) = plot(96, I3_OJ_40_BLKF, '*');
h(6) = plot(97, I3_PD_40_BLKF, '*');
h(7) = plot(98, I3_RW_40_BLKF, '*');
h(8) = plot(99, I3_T_40_BLKF, '*');
h(9) = plot(100, I3_TS_40_BLKF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

scatter(101, I3_blood_4_GRYF, 'r', 'filled');

h(1) = plot(102, I3_AVD_4_GRYF, '*');
h(2) = plot(103, I3_CO_4_GRYF, '*');
h(3) = plot(104, I3_COF_4_GRYF, '*');
h(4) = plot(105, I3_K_4_GRYF, '*');
h(5) = plot(106, I3_OJ_4_GRYF, '*');
h(6) = plot(107, I3_PD_4_GRYF, '*');
h(7) = plot(108, I3_RW_4_GRYF, '*');
h(8) = plot(109, I3_T_4_GRYF, '*');
h(9) = plot(110, I3_TS_4_GRYF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

scatter(111, I3_blood_10_GRYF, 'r', 'filled');

h(1) = plot(112, I3_AVD_10_GRYF, '*');
h(2) = plot(113, I3_CO_10_GRYF, '*');
h(3) = plot(114, I3_COF_10_GRYF, '*');
h(4) = plot(115, I3_K_10_GRYF, '*');
h(5) = plot(116, I3_OJ_10_GRYF, '*');
h(6) = plot(117, I3_PD_10_GRYF, '*');
h(7) = plot(118, I3_RW_10_GRYF, '*');
h(8) = plot(119, I3_T_10_GRYF, '*');
h(9) = plot(120, I3_TS_10_GRYF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

scatter(121, I3_blood_18_GRYF, 'r', 'filled');

h(1) = plot(122, I3_AVD_18_GRYF, '*');
h(2) = plot(123, I3_CO_18_GRYF, '*');
h(3) = plot(124, I3_COF_18_GRYF, '*');
h(4) = plot(125, I3_K_18_GRYF, '*');
h(5) = plot(126, I3_OJ_18_GRYF, '*');
h(6) = plot(127, I3_PD_18_GRYF, '*');
h(7) = plot(128, I3_RW_18_GRYF, '*');
h(8) = plot(129, I3_T_18_GRYF, '*');
h(9) = plot(130, I3_TS_18_GRYF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

scatter(131, I3_blood_30_GRYF, 'r', 'filled');

h(1) = plot(132, I3_AVD_30_GRYF, '*');
h(2) = plot(133, I3_CO_30_GRYF, '*');
h(3) = plot(134, I3_COF_30_GRYF, '*');
h(4) = plot(135, I3_K_30_GRYF, '*');
h(5) = plot(136, I3_OJ_30_GRYF, '*');
h(6) = plot(137, I3_PD_30_GRYF, '*');
h(7) = plot(138, I3_RW_30_GRYF, '*');
h(8) = plot(139, I3_T_30_GRYF, '*');
h(9) = plot(140, I3_TS_30_GRYF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


scatter(141, I3_blood_40_GRYF, 'r', 'filled');

h(1) = plot(142, I3_AVD_40_GRYF, '*');
h(2) = plot(143, I3_CO_40_GRYF, '*');
h(3) = plot(144, I3_COF_40_GRYF, '*');
h(4) = plot(145, I3_K_40_GRYF, '*');
h(5) = plot(146, I3_OJ_40_GRYF, '*');
h(6) = plot(147, I3_PD_40_GRYF, '*');
h(7) = plot(148, I3_RW_40_GRYF, '*');
h(8) = plot(149, I3_T_40_GRYF, '*');
h(9) = plot(150, I3_TS_40_GRYF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

scatter(151, I3_blood_4_GRNF, 'r', 'filled');

h(1) = plot(152, I3_AVD_4_GRNF, '*');
h(2) = plot(153, I3_CO_4_GRNF, '*');
h(3) = plot(154, I3_COF_4_GRNF, '*');
h(4) = plot(155, I3_K_4_GRNF, '*');
h(5) = plot(156, I3_OJ_4_GRNF, '*');
h(6) = plot(157, I3_PD_4_GRNF, '*');
h(7) = plot(158, I3_RW_4_GRNF, '*');
h(8) = plot(159, I3_T_4_GRNF, '*');
h(9) = plot(160, I3_TS_4_GRNF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


scatter(161, I3_blood_10_GRNF, 'r', 'filled');

h(1) = plot(162, I3_AVD_10_GRNF, '*');
h(2) = plot(163, I3_CO_10_GRNF, '*');
h(3) = plot(164, I3_COF_10_GRNF, '*');
h(4) = plot(165, I3_K_10_GRNF, '*');
h(5) = plot(166, I3_OJ_10_GRNF, '*');
h(6) = plot(167, I3_PD_10_GRNF, '*');
h(7) = plot(168, I3_RW_10_GRNF, '*');
h(8) = plot(169, I3_T_10_GRNF, '*');
h(9) = plot(170, I3_TS_10_GRNF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

scatter(171, I3_blood_18_GRNF, 'r', 'filled');

h(1) = plot(172, I3_AVD_18_GRNF, '*');
h(2) = plot(173, I3_CO_18_GRNF, '*');
h(3) = plot(174, I3_COF_18_GRNF, '*');
h(4) = plot(175, I3_K_18_GRNF, '*');
h(5) = plot(176, I3_OJ_18_GRNF, '*');
h(6) = plot(177, I3_PD_18_GRNF, '*');
h(7) = plot(178, I3_RW_18_GRNF, '*');
h(8) = plot(179, I3_T_18_GRNF, '*');
h(9) = plot(180, I3_TS_18_GRNF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


scatter(181, I3_blood_30_GRNF, 'r', 'filled');

h(1) = plot(182, I3_AVD_30_GRNF, '*');
h(2) = plot(183, I3_CO_30_GRNF, '*');
h(3) = plot(184, I3_COF_30_GRNF, '*');
h(4) = plot(185, I3_K_30_GRNF, '*');
h(5) = plot(186, I3_OJ_30_GRNF, '*');
h(6) = plot(187, I3_PD_30_GRNF, '*');
h(7) = plot(188, I3_RW_30_GRNF, '*');
h(8) = plot(189, I3_T_30_GRNF, '*');
h(9) = plot(190, I3_TS_30_GRNF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

scatter(191, I3_blood_40_GRNF, 'r', 'filled');

h(1) = plot(192, I3_AVD_40_GRNF, '*');
h(2) = plot(193, I3_CO_40_GRNF, '*');
h(3) = plot(194, I3_COF_40_GRNF, '*');
h(4) = plot(195, I3_K_40_GRNF, '*');
h(5) = plot(196, I3_OJ_40_GRNF, '*');
h(6) = plot(197, I3_PD_40_GRNF, '*');
h(7) = plot(198, I3_RW_40_GRNF, '*');
h(8) = plot(199, I3_T_40_GRNF, '*');
h(9) = plot(200, I3_TS_40_GRNF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


scatter(201, I3_blood_4_REDF, 'r', 'filled');

h(1) = plot(202, I3_AVD_4_REDF, '*');
h(2) = plot(203, I3_CO_4_REDF, '*');
h(3) = plot(204, I3_COF_4_REDF, '*');
%h(4) = plot(45, INDEX1_K4_BLKF, '*');
h(5) = plot(206, I3_OJ_4_REDF, '*');
h(6) = plot(207, I3_PD_4_REDF, '*');
h(7) = plot(208, I3_RW_4_REDF, '*');
h(8) = plot(209, I3_T_4_REDF, '*');
h(9) = plot(210, I3_TS_4_REDF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
%set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


scatter(211, I3_blood_8_REDF, 'r', 'filled');



h(1) = plot(212, I3_AVD_8_REDF, '*');
h(2) = plot(213, I3_CO_8_REDF, '*');
h(3) = plot(214, I3_COF_8_REDF, '*');
%h(4) = plot(45, INDEX1_K4_BLKF, '*');
h(5) = plot(216, I3_OJ_8_REDF, '*');
h(6) = plot(217, I3_PD_8_REDF, '*');
h(7) = plot(218, I3_RW_8_REDF, '*');
h(8) = plot(219, I3_T_8_REDF, '*');
%h(9) = plot(120, INDEX1_TS4_BLKF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
%set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
%set(h(9), 'color', [0.5 0.8 1]);

scatter(221, I3_blood_2_COTNT, 'r', 'filled');


h(1) = plot(222, I3_AVD_2_COTNT, '*');
h(2) = plot(223, I3_CO_2_COTNT, '*');
h(3) = plot(224, I3_COF_2_COTNT, '*');
h(4) = plot(225, I3_K_2_COTNT, '*');
h(5) = plot(226, I3_OJ_2_COTNT, '*');
h(6) = plot(227, I3_PD_2_COTNT, '*');
h(7) = plot(228, I3_RW_2_COTNT, '*');
h(8) = plot(229, I3_T_2_COTNT, '*');
h(9) = plot(230, I3_TS_2_COTNT, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


scatter(231, I3_blood_2_POLY, 'r', 'filled');

h(1) = plot(232, I3_AVD_2_POLY, '*');
h(2) = plot(233, I3_CO_2_POLY, '*');
h(3) = plot(234, I3_COF_2_POLY, '*');
h(4) = plot(235, I3_K_2_POLY, '*');
h(5) = plot(236, I3_OJ_2_POLY, '*');
h(6) = plot(237, I3_PD_2_POLY, '*');
h(7) = plot(238, I3_RW_2_POLY, '*');
h(8) = plot(239, I3_T_2_POLY, '*');
h(9) = plot(240, I3_TS_2_POLY, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

scatter(241, I3_blood_2_J, 'r', 'filled');


h(1) = plot(242, I3_AVD_2_J, '*');
h(2) = plot(243, I3_CO_2_J, '*');
h(3) = plot(244, I3_COF_2_J, '*');
h(4) = plot(245, I3_K_2_J, '*');
h(5) = plot(246, I3_OJ_2_J, '*');
h(6) = plot(247, I3_PD_2_J, '*');
h(7) = plot(248, I3_RW_2_J, '*');
h(8) = plot(249, I3_T_2_J, '*');
h(9) = plot(250, I3_TS_2_J, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


scatter(251, I3_blood_1_WOOD, 'r', 'filled');

h(1) = plot(252, I3_AVD_1_WOOD, '*');
h(2) = plot(253, I3_CO_1_WOOD, '*');
h(3) = plot(254, I3_COF_1_WOOD, '*');
h(4) = plot(255, I3_K_1_WOOD, '*');
h(5) = plot(256, I3_OJ_1_WOOD, '*');
h(6) = plot(257, I3_PD_1_WOOD, '*');
h(7) = plot(258, I3_RW_1_WOOD, '*');
h(8) = plot(259, I3_T_1_WOOD, '*');
h(9) = plot(260, I3_TS_1_WOOD, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


plot(0:0.1:260, 0, 'k-');
plot(0:0.1:260, 0.1, 'r-');

text(-10, 0.1, '0.1');

%xlim([45 100]);

mTB1 = uicontrol('style', 'text');% mTextBox1 = mTB1
set(mTB1, 'String', '4ML In PD')%petri dish
set(mTB1, 'Units', 'Characters')
set(mTB1, 'FontSize', 10)
set(mTB1, 'Position', [19 35 3.9 4])
set(mTB1, 'BackgroundColor', [1 1 1])


mTB2 = uicontrol('style', 'text');
set(mTB2, 'String', '10ML In PD')
set(mTB2, 'Units', 'Characters')
set(mTB2, 'FontSize', 10)
set(mTB2, 'Position', [23 35 3.9 4])
set(mTB2, 'BackgroundColor', [1 1 1])

mTB3 = uicontrol('style', 'text');
set(mTB3, 'String', '18ML In PD')
set(mTB3, 'Units', 'Characters')
set(mTB3, 'FontSize', 10)
set(mTB3, 'Position', [27 35 3.9 4])
set(mTB3, 'BackgroundColor', [1 1 1])

 mTB4 = uicontrol('style', 'text');
set(mTB4, 'String', '30ML In PD')
set(mTB4, 'Units', 'Characters')
set(mTB4, 'FontSize', 10)
set(mTB4, 'Position', [31 35 3.9 4])
set(mTB4, 'BackgroundColor', [1 1 1])


 mTB5 = uicontrol('style', 'text');
set(mTB5, 'String', '40ML In PD')
set(mTB5, 'Units', 'Characters')
set(mTB5, 'FontSize', 10)
set(mTB5, 'Position', [35 35 3.9 4])
set(mTB5, 'BackgroundColor', [1 1 1])


 mTB6 = uicontrol('style', 'text');
set(mTB6, 'String', '4ML On BF')
set(mTB6, 'Units', 'Characters')
set(mTB6, 'FontSize', 10)
set(mTB6, 'Position', [39 35 3.9 4])
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
set(mTB8, 'String', '10ML On BF')%black felt
set(mTB8, 'Units', 'Characters')
set(mTB8, 'FontSize', 10)
set(mTB8, 'Position', [43 35 3.9 4])
set(mTB8, 'BackgroundColor', [1 1 1])
 
mTB9 = uicontrol('style', 'text');
set(mTB9, 'String', '18ML On BF')
set(mTB9, 'Units', 'Characters')
set(mTB9, 'FontSize', 10)
set(mTB9, 'Position', [47 35 3.9 4])
set(mTB9, 'BackgroundColor', [1 1 1])

 mTB10 = uicontrol('style', 'text');
set(mTB10, 'String', '30ML On BF')
set(mTB10, 'Units', 'Characters')
set(mTB10, 'FontSize', 10)
set(mTB10, 'Position', [51 35 3.9 4])
set(mTB10, 'BackgroundColor', [1 1 1])

 mTB11 = uicontrol('style', 'text');
set(mTB11, 'String', '40ML On BF')
set(mTB11, 'Units', 'Characters')
set(mTB11, 'FontSize', 10)
set(mTB11, 'Position', [55 35 3.9 4])
set(mTB11, 'BackgroundColor', [1 1 1])

mTB12 = uicontrol('style', 'text');
set(mTB12, 'String', '4ML On GF')%grey felt
set(mTB12, 'Units', 'Characters')
set(mTB12, 'FontSize', 10)
set(mTB12, 'Position', [59 35 3.9 4])
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
set(mTB14, 'Position', [63 35 3.9 4])
set(mTB14, 'BackgroundColor', [1 1 1])

 mTB15 = uicontrol('style', 'text');
set(mTB15, 'String', '18ML On GF')
set(mTB15, 'Units', 'Characters')
set(mTB15, 'FontSize', 10)
set(mTB15, 'Position', [67 35 3.9 4])
set(mTB15, 'BackgroundColor', [1 1 1])

 mTB16 = uicontrol('style', 'text');
set(mTB16, 'String', '30ML On GF')
set(mTB16, 'Units', 'Characters')
set(mTB16, 'FontSize', 10)
set(mTB16, 'Position', [71 35 3.9 4])
set(mTB16, 'BackgroundColor', [1 1 1])

 mTB17 = uicontrol('style', 'text');
set(mTB17, 'String', '40ML On GF')
set(mTB17, 'Units', 'Characters')
set(mTB17, 'FontSize', 10)
set(mTB17, 'Position', [75 35 3.9 4])
set(mTB17, 'BackgroundColor', [1 1 1])


 mTB18 = uicontrol('style', 'text');
set(mTB18, 'String', '4ML On GRF')%freen Felt
set(mTB18, 'Units', 'Characters')
set(mTB18, 'FontSize', 10)
set(mTB18, 'Position', [79 35 3.9 4])
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
set(mTB20, 'String', '10ML On GRF')
set(mTB20, 'Units', 'Characters')
set(mTB20, 'FontSize', 10)
set(mTB20, 'Position', [83 35 3.9 4])
set(mTB20, 'BackgroundColor', [1 1 1])

 mTB21 = uicontrol('style', 'text');
set(mTB21, 'String', '18ML On GRF')
set(mTB21, 'Units', 'Characters')
set(mTB21, 'FontSize', 10)
set(mTB21, 'Position', [87 35 3.9 4])
set(mTB21, 'BackgroundColor', [1 1 1])

 mTB22 = uicontrol('style', 'text');
set(mTB22, 'String', '30ML On GRF')
set(mTB22, 'Units', 'Characters')
set(mTB22, 'FontSize', 10)
set(mTB22, 'Position', [91 35 3.9 4])
set(mTB22, 'BackgroundColor', [1 1 1])


 mTB23 = uicontrol('style', 'text');
set(mTB23, 'String', '40ML On GRF')
set(mTB23, 'Units', 'Characters')
set(mTB23, 'FontSize', 10)
set(mTB23, 'Position', [95 35 3.9 4])
set(mTB23, 'BackgroundColor', [1 1 1])



 mTB24 = uicontrol('style', 'text');
set(mTB24, 'String', '4ML On RF') %red felt
set(mTB24, 'Units', 'Characters')
set(mTB24, 'FontSize', 10)
set(mTB24, 'Position', [99 35 3.9 4])
set(mTB24, 'BackgroundColor', [1 1 1])

 mTB25 = uicontrol('style', 'text');
set(mTB25, 'String', '8ML On RF')
set(mTB25, 'Units', 'Characters')
set(mTB25, 'FontSize', 10)
set(mTB25, 'Position', [103 35 3.9 4])
set(mTB25, 'BackgroundColor', [1 1 1])


 mTB26 = uicontrol('style', 'text');
set(mTB26, 'String', '2ML On WC')%white cotton
set(mTB26, 'Units', 'Characters')
set(mTB26, 'FontSize', 10)
set(mTB26, 'Position', [107 35 3.9 4])
set(mTB26, 'BackgroundColor', [1 1 1])


 mTB27 = uicontrol('style', 'text');
set(mTB27, 'String', '2ML On WP')% white polyester
set(mTB27, 'Units', 'Characters')
set(mTB27, 'FontSize', 10)
set(mTB27, 'Position', [111 35 3.9 4])
set(mTB27, 'BackgroundColor', [1 1 1])

 mTB28 = uicontrol('style', 'text');
set(mTB28, 'String', '2ML On J')%Jeans
set(mTB28, 'Units', 'Characters')
set(mTB28, 'FontSize', 10)
set(mTB28, 'Position', [115 35 3.9 4])
set(mTB28, 'BackgroundColor', [1 1 1])


 mTB29 = uicontrol('style', 'text');
set(mTB29, 'String', '1ML On W')%wood
set(mTB29, 'Units', 'Characters')
set(mTB29, 'FontSize', 10)
set(mTB29, 'Position', [119 35 3.9 4])
set(mTB29, 'BackgroundColor', [1 1 1])


%{
%%%%%%%%%%%%%%%%%   GREY Felt   %%%%%%%%%%%%%%%%%%%%
blood_4_GRYF = dlmread('NBD4GRY_av_i.txt', '');

AVD4_GRYF = dlmread('NAD4GRY_av_i.txt', '');

COLA4_GRYF = dlmread('NCO4GRY_av_i.txt', '');

C4_GRYF = dlmread('NCF4GRY_av_i.txt', '');

K4_GRYF = dlmread('NK4GRY_av_i.txt', '');
OJ4_GRYF = dlmread('NOJ4GRY_av_i.txt', '');

PD4_GRYF = dlmread('NPD4GRY_av_i.txt', '');

RW4_GRYF = dlmread('NRW4GRY_av_i.txt', '');

T4_GRYF = dlmread('NTE4GRY_av_i.txt', '');


TS4_GRYF = dlmread('NTS4GRY_av_i.txt', '');
%}
%}