%% DETECTION BLOOD FROM NONE-BLOOD SAMPLES
%% PLOT BLOOD SPECTRA ON THE SAME BACKGROUND
%% PLOT BLOOD INDEX ON THE SAME BACKGROUND, SAME THICKNESS OF BLOOD AND CONFUSORS(NONE-BLOOD SAMPLES)

clear all; close all; clc;
lambda = 350:2500;


%%
%%%%%%%%%%%%%%%%%%%%       4ML In      PETRI DISH         %%%%%%%%%%%%%%%%%%%%%%
%%BLOOD WITH SPECTRALON REFERENCE 4ML
PETRI = dlmread('PETRIREF_av_i.txt', '');
blood_4_av = dlmread('4BLD_PETRI_av_i.txt', '');
figure('color', 'w'); hold on;
plot(lambda, PETRI, 'k-');
plot(lambda, blood_4_av,'r-');
%%4ML AVD in petri dish(P)
AVD_4_P_av = dlmread('AVD4_PETRI_av_i.txt', '');
plot(lambda, AVD_4_P_av, 'g-');
%%4ML Cola in petri dish (P)
CO_4_P_av = dlmread('NCO4PET_av_i.txt', '');
plot(lambda, CO_4_P_av, 'b-');
%%4ML coffee in petridish (P)
COF_4_P_av = dlmread('C4_PETRI_av_i.txt', '');
plot(lambda, COF_4_P_av, 'm-');
%%4ML ketchup in petri dish
K_4_P_av = dlmread('K4_PETRI_av_i.txt', '');
plot(lambda, K_4_P_av, 'c-');
%%4ML Orange Juice in petri dish
OJ_4_P_av = dlmread('OJ4_PETRI_av_i.txt', '');
plot(lambda, OJ_4_P_av, 'y-');
%%4ML PD in Petri dish
PD_4_P_av = dlmread('PD4_PETRI_av_i.txt', '');
plot(lambda, PD_4_P_av, 'k-');
%%4ML red wine in petri dish
RW_4_P_av = dlmread('RW4_PETRI_av_i.txt', '');
plot(lambda, RW_4_P_av, 'k--');
%%4ML tea in petri dish
T_4_P_av = dlmread('T4_PETRI_av_i.txt', '');
plot(lambda, T_4_P_av, 'g--');
%%4ML tomato sauce in petri dish
TS_4_P_av = dlmread('TS4_PETRI_av_i.txt', '');
plot(lambda, TS_4_P_av, 'b--');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('4ML Blood and Confusors in Petri Dish', 'FontSize', 16);
legend('Petri','Blood', 'Aloe Vera Drink',  'Cola', 'Coffee', 'Ketchup', 'Orange Juice', 'Plum Drink', 'Red Wine', 'Tea', 'Tomato Sauce');

figure('color', 'w');
plot(lambda, blood_4_av-PETRI);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('4ML Blood Reflectance - Petri Dish Reflectance', 'FontSize', 16);

%%%%%%%%%%%%%%  10ML in Petri Dish  %%%%%%%%%
blood_10_av = dlmread('10BLD_PETRI_av_i.txt', '');
figure('color', 'w'); hold on;
plot(lambda, PETRI, 'k-');
plot(lambda, blood_10_av,'r-');
%%10ML AVD in petri dish(P)
AVD_10_P_av = dlmread('AVD10_PETRI_av_i.txt', '');
plot(lambda, AVD_10_P_av, 'g-');
%%10ML cola in petri dish (P)
CO_10_P_av = dlmread('NCO10PET_av_i.txt', '');
plot(lambda, CO_10_P_av, 'b-');
%%4ML coffee in petridish (P)
COF_10_P_av = dlmread('C10_PETRI_av_i.txt', '');
plot(lambda, COF_10_P_av, 'm-');
%%4ML ketchup in petri dish
K_10_P_av = dlmread('K10_PETRI_av_i.txt', '');
plot(lambda, K_10_P_av, 'c-');
%%4ML Orange Juice in petri dish
OJ_10_P_av = dlmread('OJ10_PETRI_av_i.txt', '');
plot(lambda, OJ_10_P_av, 'y-');
%%4ML PD in Petri dish
PD_10_P_av = dlmread('PD10_PETRI_av_i.txt', '');
plot(lambda, PD_10_P_av, 'k-');
%%4ML red wine in petri dish
RW_10_P_av = dlmread('RW10_PETRI_av_i.txt', '');
plot(lambda, RW_10_P_av, 'k--');
%%4ML tea in petri dish
T_10_P_av = dlmread('T10_PETRI_av_i.txt', '');
plot(lambda, T_10_P_av, 'g--');
%%4ML tomato sauce in petri dish
TS_10_P_av = dlmread('TS10_PETRI_av_i.txt', '');
plot(lambda, TS_10_P_av, 'b--');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('10ML Blood and Confusors in Petri Dish', 'FontSize', 16);
legend('Petri','Blood', 'Aloe Vera Drink',  'Cola', 'Coffee', 'Ketchup', 'Orange Juice', 'Plum Drink', 'Red Wine', 'Tea', 'Tomato Sauce');



figure('color', 'w');
plot(lambda, blood_10_av-PETRI);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('10ML Blood Reflectance - Petri Dish Reflectance', 'FontSize', 16);

%%%%%%%%%%%%%%%%%%%%%%%             18ML in Petri Dish
%%%%%%%%%%%%%%%%%%%%%%%             %%%%%%%%%%%%%%%%
blood_18_av = dlmread('18BLD_PETRI_av_i.txt', '');
figure('color', 'w'); hold on;
plot(lambda, PETRI, 'k-');
plot(lambda, blood_18_av, 'r-');
AVD_18_P_av = dlmread('AVD18_PETRI_av_i.txt', '');
plot(lambda, AVD_18_P_av, 'g-');
CO_18_P_av = dlmread('NCO18PET_av_i.txt', '');
plot(lambda, CO_18_P_av, 'b-');
%%4ML coffee in petridish (P)
COF_18_P_av = dlmread('C18_PETRI_av_i.txt', '');
plot(lambda, COF_18_P_av, 'm-');
%%4ML ketchup in petri dish
K_18_P_av = dlmread('K18_PETRI_av_i.txt', '');
plot(lambda, K_18_P_av, 'c-');
%%4ML Orange Juice in petri dish
OJ_18_P_av = dlmread('OJ18_PETRI_av_i.txt', '');
plot(lambda, OJ_18_P_av, 'y-');
%%4ML PD in Petri dish
PD_18_P_av = dlmread('PD18_PETRI_av_i.txt', '');
plot(lambda, PD_18_P_av, 'k-');
%%4ML red wine in petri dish
RW_18_P_av = dlmread('RW18_PETRI_av_i.txt', '');
plot(lambda, RW_18_P_av, 'k--');
%%4ML tea in petri dish
T_18_P_av = dlmread('T18_PETRI_av_i.txt', '');
plot(lambda, T_18_P_av, 'g--');
%%4ML tomato sauce in petri dish
TS_18_P_av = dlmread('TS18_PETRI_av_i.txt', '');
plot(lambda, TS_18_P_av, 'b--');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('18ML Blood and Confusors in Petri Dish', 'FontSize', 16);
legend('Petri','blood', 'Aloe Vera Drink',  'Cola', 'Coffee', 'Ketchup', 'Orange Juice', 'Plum Drink', 'Red Wine', 'Tea', 'Tomato Sauce');

figure('color', 'w');
plot(lambda, blood_18_av-PETRI);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('18ML Blood Reflectance - Petri Dish Reflectance', 'FontSize', 16);


%%%%%%%%%%%%%%%%%%%%%%%             30ML in Petri Dish
%%%%%%%%%%%%%%%%%%%%%%%             %%%%%%%%%%%%%%%%
blood_30_av = dlmread('30BLD_PETRI_av_i.txt', '');
figure('color', 'w'); hold on;
plot(lambda, PETRI, 'k-');
plot(lambda, blood_30_av, 'r-');
AVD_30_P_av = dlmread('AVD30_PETRI_av_i.txt', '');
plot(lambda, AVD_30_P_av, 'g-');
CO_30_P_av = dlmread('NCO30PET_av_i.txt', '');
plot(lambda, CO_30_P_av, 'b-');
%%4ML coffee in petridish (P)
COF_30_P_av = dlmread('C30_PETRI_av_i.txt', '');
plot(lambda, COF_30_P_av, 'm-');
%%4ML ketchup in petri dish
K_30_P_av = dlmread('K30_PETRI_av_i.txt', '');
plot(lambda, K_30_P_av, 'c-');
%%4ML Orange Juice in petri dish
OJ_30_P_av = dlmread('OJ30_PETRI_av_i.txt', '');
plot(lambda, OJ_30_P_av, 'y-');
%%4ML PD in Petri dish
PD_30_P_av = dlmread('PD30_PETRI_av_i.txt', '');
plot(lambda, PD_30_P_av, 'k-');
%%4ML red wine in petri dish
RW_30_P_av = dlmread('RW30_PETRI_av_i.txt', '');
plot(lambda, RW_30_P_av, 'k--');
%%4ML tea in petri dish
T_30_P_av = dlmread('T30_PETRI_av_i.txt', '');
plot(lambda, T_30_P_av, 'g--');
%%4ML tomato sauce in petri dish
TS_30_P_av = dlmread('TS30_PETRI_av_i.txt', '');
plot(lambda, TS_30_P_av, 'b--');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('30ML Blood and Confusors in Petri Dish', 'FontSize', 16);
legend('Petri','blood', 'Aloe Vera Drink',  'Cola', 'Coffee', 'Ketchup', 'Orange Juice', 'Plum Drink', 'Red Wine', 'Tea', 'Tomato Sauce');

figure('color', 'w');
plot(lambda, blood_30_av-PETRI);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('30ML Blood Reflectance - Petri Dish Reflectance', 'FontSize', 16);


%%%%%%%%%%%%%%%%%%%%%%%             40ML in Petri Dish
%%%%%%%%%%%%%%%%%%%%%%%             %%%%%%%%%%%%%%%%
blood_40_av = dlmread('40BLD_PETRI_av_i.txt', '');
figure('color', 'w'); hold on;
plot(lambda, PETRI, 'k-');
plot(lambda, blood_40_av, 'r-');
AVD_40_P_av = dlmread('AVD40_PETRI_av_i.txt', '');
plot(lambda, AVD_40_P_av, 'g-');
CO_40_P_av = dlmread('NCO40PET_av_i.txt', '');
plot(lambda, CO_40_P_av, 'b-');
%%4ML coffee in petridish (P)
COF_40_P_av = dlmread('C40_PETRI_av_i.txt', '');
plot(lambda, COF_40_P_av, 'm-');
%%4ML ketchup in petri dish
K_40_P_av = dlmread('K40_PETRI_av_i.txt', '');
plot(lambda, K_40_P_av, 'c-');
%%4ML Orange Juice in petri dish
OJ_40_P_av = dlmread('OJ40_PETRI_av_i.txt', '');
plot(lambda, OJ_40_P_av, 'y-');
%%4ML PD in Petri dish
PD_40_P_av = dlmread('PD40_PETRI_av_i.txt', '');
plot(lambda, PD_40_P_av, 'k-');
%%4ML red wine in petri dish
RW_40_P_av = dlmread('RW40_PETRI_av_i.txt', '');
plot(lambda, RW_40_P_av, 'k--');
%%4ML tea in petri dish
T_40_P_av = dlmread('T40_PETRI_av_i.txt', '');
plot(lambda, T_40_P_av, 'g--');
%%4ML tomato sauce in petri dish
TS_40_P_av = dlmread('TS40_PETRI_av_i.txt', '');
plot(lambda, TS_40_P_av, 'b--');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('40ML Blood and Confusors in Petri Dish', 'FontSize', 16);
legend('Petri','blood', 'Aloe Vera Drink',  'Cola', 'Coffee', 'Ketchup', 'Orange Juice', 'Plum Drink', 'Red Wine', 'Tea', 'Tomato Sauce');

figure('color', 'w');
plot(lambda, blood_40_av-PETRI);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('40ML Blood Reflectance - Petri Dish Reflectance', 'FontSize', 16);

%%
%%%%%%%%%%%%%%%%%   Black Felt   %%%%%%%%%%%%%%%%%%%%
BLKFELT = dlmread('BLKFELT_av_i.txt', '');
blood_4_BLKF = dlmread('NBD4BLK_av_i.txt', '');
%blood_8_BLKF = dlmread('8blood_BLKFELT_av_i.txt', '');
AVD_4_BLKF = dlmread('NAD4BLK_av_i.txt', '');
%AVD8_BLKF = dlmread('AVD8_BLKFELT_av_i.txt', '');
CO_4_BLKF = dlmread('NCO4BLK_av_i.txt', '');%cola
%CS8_BLKF = dlmread('CS8_BLKFELT_av_i.txt', '');
COF_4_BLKF = dlmread('NCF4BLK_av_i.txt', '');%coffee
%C8_BLKF = dlmread('C8_BLKFELT_av_i.txt', '');
K_4_BLKF = dlmread('NK4BLK_av_i.txt', '');
%K8_BLKF = dlmread('K8_BLKFELT_av_i.txt', '');
OJ_4_BLKF = dlmread('NOJ4BLK_av_i.txt', '');
%OJ8_BLKF = dlmread('OJ8_BLKFELT_av_i.txt', '');
PD_4_BLKF = dlmread('NPD4BLK_av_i.txt', '');
%PD8_BLKF = dlmread('PD8_BLKFELT_av_i.txt', '');
RW_4_BLKF = dlmread('NRW4BLK_av_i.txt', '');
%RW8_BLKF = dlmread('RW8_BLKFELT_av_i.txt', '');
T_4_BLKF = dlmread('NTE4BLK_av_i.txt', '');
%T8_BLKF = dlmread('T8_BLKFELT_av_i.txt', '');
TS_4_BLKF = dlmread('NTS4BLK_av_i.txt', '');
%TS4_BLKF = dlmread('TS4_BLKFELT_av_i.txt', '');

figure('color', 'w'); hold on;
plot(lambda, BLKFELT, 'k--');
plot(lambda, blood_4_BLKF, 'r-');
plot(lambda, AVD_4_BLKF, 'g-');
plot(lambda, CO_4_BLKF, 'b-');
plot(lambda, COF_4_BLKF, 'm-');
plot(lambda, K_4_BLKF, 'c-');
plot(lambda, OJ_4_BLKF, 'y-');
plot(lambda, PD_4_BLKF, 'k-');
plot(lambda, RW_4_BLKF, 'k-.');
plot(lambda, T_4_BLKF, 'm-.');
%plot(lambda, TS2_BLKF, 'g-.');
plot(lambda, TS_4_BLKF, 'y-.');
ylim([0 0.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('4ML Blood and Confusors on Black Felt', 'FontSize', 16);
legend('Black felt','4ML Blood','4ML Aloe Vera Drink',  '4ML COCA COLA',  '4ML Coffee', '4ML Ketchup', '4ML Orange Juice', '4ML Plum Drink', '4ML Red Wine', '4ML Tea',  '4ML Tomato Sauce');

figure('color', 'w');
plot(lambda, blood_4_BLKF-BLKFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('4ML Blood on blackfelt Reflectance - Black felt Reflectance', 'FontSize', 16);

%'4ML Ketchup', 
%{
figure('color', 'w'); hold on;
plot(lambda, blood_8_BLKF, 'r--');
plot(lambda, AVD8_BLKF, 'g--');
plot(lambda, CS8_BLKF, 'b--');
plot(lambda, C8_BLKF, 'm--');
plot(lambda, K8_BLKF, 'c--');
plot(lambda, OJ8_BLKF, 'y--');
plot(lambda, PD8_BLKF, 'k--');
plot(lambda, RW8_BLKF, 'c-.');
plot(lambda, T8_BLKF, 'b-.');
ylim([0 0.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('8ML Blood and Confusors on Black Felt', 'FontSize', 16);
legend('8ML blood', '8ML Aloe Vera Drink', '8ML Chestnut Soup',  '8ML Coffee', '8ML Ketchup',  '8ML Orange Juice','8ML Plum Drink', '8ML Red Wine','8ML Tea');
%}
%{
figure('color', 'w'); hold on;
plot(lambda, blood_4_BLKF, 'r-');
%plot(lambda, blood_8_BLKF, 'r--');
plot(lambda, AVD4_BLKF, 'g-');
%plot(lambda, AVD8_BLKF, 'g--');
plot(lambda, COLA4_BLKF, 'b-');
%plot(lambda, CS8_BLKF, 'b--');
plot(lambda, C4_BLKF, 'm-');
%plot(lambda, C8_BLKF, 'm--');
plot(lambda, K4_BLKF, 'c-');
plot(lambda, K8_BLKF, 'c--');
plot(lambda, OJ4_BLKF, 'y-');
plot(lambda, OJ8_BLKF, 'y--');
plot(lambda, PD4_BLKF, 'k-');
plot(lambda, PD8_BLKF, 'k--');
plot(lambda, RW4_BLKF, 'k-.');
plot(lambda, RW8_BLKF, 'c-.');
plot(lambda, T4_BLKF, 'm-.');
plot(lambda, T8_BLKF, 'b-.');
plot(lambda, TS2_BLKF, 'g-.');
plot(lambda, TS4_BLKF, 'y-.');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Blood and Confusors on Black Felt', 'FontSize', 16);
legend('4ML Blood','8ML blood','4ML Aloe Vera Drink', '8ML Aloe Vera Drink', '4ML Chestnut Soup', '8ML Chestnut Soup', '4ML Coffee', '8ML Coffee','4ML Ketchup', '8ML Ketchup', '4ML Orange Juice', '8ML Orange Juice','4ML Plum Drink','8ML Plum Drink', '4ML Red Wine', '8ML Red Wine','4ML Tea','8ML Tea', '2ML Tomato Sauce', '4ML Tomato Sauce');
%}


%%%%%%%%  10ML blood and confusors  %%%%%%%%%
blood_10_BLKF = dlmread('NBD10BLK_av_i.txt', '', 0, 0);
AVD_10_BLKF = dlmread('NAD10BLK_av_i.txt', '', 0, 0);
CO_10_BLKF = dlmread('NCO10BLK_av_i.txt', '', 0, 0);
COF_10_BLKF = dlmread('NCF10BLK_av_i.txt', '', 0, 0);
K_10_BLKF = dlmread('NK10BLK_av_i.txt', '', 0, 0);
OJ_10_BLKF = dlmread('NOJ10BLK_av_i.txt', '', 0, 0);
PD_10_BLKF = dlmread('NPD10BLK_av_i.txt', '', 0, 0);
RW_10_BLKF = dlmread('NRW10BLK_av_i.txt', '', 0, 0);
T_10_BLKF = dlmread('NTE10BLK_av_i.txt', '', 0, 0);
TS_10_BLKF = dlmread('NTS10BLK_av_i.txt', '', 0, 0);

figure('color', 'w'); hold on;
plot(lambda, BLKFELT, 'k--');
plot(lambda, AVD_10_BLKF, 'g-');
plot(lambda, CO_10_BLKF, 'm-');
plot(lambda, COF_10_BLKF, 'b-');
plot(lambda, K_10_BLKF, 'c-');
plot(lambda, OJ_10_BLKF, 'y-');
plot(lambda, PD_10_BLKF, 'k-');
plot(lambda, RW_10_BLKF, 'g-.');
plot(lambda, T_10_BLKF, 'b-.');
plot(lambda, TS_10_BLKF, 'k-.');
plot(lambda, blood_10_BLKF, 'r-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('10ML Blood and Confusors on Black Felt', 'FontSize', 16);
legend('Black felt','10ML Aloe Vera Drink', '10ML COCA COLA', '10ML Coffee','10ML Ketchup', '10ML Orange Juice','10 ML Plum Drink', '10ML Red Wine', '10ML Tea','10 ML Tomato Sauce', '10ML Blood');
%}


figure('color', 'w');
plot(lambda, blood_10_BLKF-BLKFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('10ML Blood on blackfelt Reflectance - Black felt Reflectance', 'FontSize', 16);

%%%%%%%%  18ML blood and confusors  %%%%%%%%%
blood_18_BLKF = dlmread('NBD18BLK_av_i.txt', '', 0, 0);
AVD_18_BLKF = dlmread('NAD18BLK_av_i.txt', '', 0, 0);
CO_18_BLKF = dlmread('NCO18BLK_av_i.txt', '', 0, 0);
COF_18_BLKF = dlmread('NCF18BLK_av_i.txt', '', 0, 0);
K_18_BLKF = dlmread('K18BLK_av_i.txt', '', 0, 0);
OJ_18_BLKF = dlmread('NOJ18BLK_av_i.txt', '', 0, 0);
PD_18_BLKF = dlmread('NPD18BLK_av_i.txt', '', 0, 0);
RW_18_BLKF = dlmread('NRW18BLK_av_i.txt', '', 0, 0);
T_18_BLKF = dlmread('NTE18BLK_av_i.txt', '', 0, 0);
TS_18_BLKF = dlmread('TS18BLK_av_i.txt', '', 0, 0);

figure('color', 'w'); hold on;
plot(lambda, BLKFELT, 'k--');
plot(lambda, AVD_18_BLKF, 'g-');
plot(lambda, CO_18_BLKF, 'm-');
plot(lambda, COF_18_BLKF, 'b-');
plot(lambda, K_18_BLKF, 'c-');
plot(lambda, OJ_18_BLKF, 'y-');
plot(lambda, PD_18_BLKF, 'k-');
plot(lambda, RW_18_BLKF, 'g-.');
plot(lambda, T_18_BLKF, 'b-.');
plot(lambda, TS_18_BLKF, 'k-.');
plot(lambda, blood_18_BLKF, 'r-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('18ML Blood and Confusors on Black Felt', 'FontSize', 16);
legend('Black felt','18ML Aloe Vera Drink', '18ML Coca Cola', '18ML Coffee','18ML Ketchup', '18ML Orange Juice','18ML Plum Drink', '18ML Red Wine', '18ML Tea','18ML Tomato Sauce','18ML Blood');
%}

figure('color', 'w');
plot(lambda, blood_18_BLKF-BLKFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('18ML Blood on blackfelt Reflectance - Black felt Reflectance', 'FontSize', 16);

%%%%%%%%  30ML blood and confusors  %%%%%%%%%
blood_30_BLKF = dlmread('NBD30BLK_av_i.txt', '', 0, 0);
AVD_30_BLKF = dlmread('NAD30BLK_av_i.txt', '', 0, 0);
CO_30_BLKF = dlmread('NCO30BLK_av_i.txt', '', 0, 0);
COF_30_BLKF = dlmread('NCF30BLK_av_i.txt', '', 0, 0);
K_30_BLKF = dlmread('K30BLK_av_i.txt', '', 0, 0);
OJ_30_BLKF = dlmread('NOJ30BLK_av_i.txt', '', 0, 0);
PD_30_BLKF = dlmread('NPD30BLK_av_i.txt', '', 0, 0);
RW_30_BLKF = dlmread('NRW30BLK_av_i.txt', '', 0, 0);
T_30_BLKF = dlmread('NTE30BLK_av_i.txt', '', 0, 0);
TS_30_BLKF = dlmread('TS30BLK_av_i.txt', '', 0, 0);

figure('color', 'w'); hold on;
plot(lambda, BLKFELT, 'k--');
plot(lambda, AVD_30_BLKF, 'g-');
plot(lambda, CO_30_BLKF, 'm-');
plot(lambda, COF_30_BLKF, 'b-');
plot(lambda, K_30_BLKF, 'c-');
plot(lambda, OJ_30_BLKF, 'y-');
plot(lambda, PD_30_BLKF, 'k-');
plot(lambda, RW_30_BLKF, 'g-.');
plot(lambda, T_30_BLKF, 'b-.');
plot(lambda, TS_30_BLKF, 'k-.');
plot(lambda, blood_30_BLKF, 'r-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('30ML Blood and Confusors on Black Felt', 'FontSize', 16);
legend('Black felt','30ML Aloe Vera Drink','30ML Coca Cola', '30ML Coffee', '30ML Ketchup', '30ML Orange Juice','30 ML Plum Drink', '30ML Red Wine', '30ML Tea','30 ML Tomato Sauce', '30ML Blood');
%}

figure('color', 'w');
plot(lambda, blood_30_BLKF-BLKFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('30ML Blood on blackfelt Reflectance - Black felt Reflectance', 'FontSize', 16);


%%%%%%%%  40ML blood and confusors  %%%%%%%%%
blood_40_BLKF = dlmread('NBD40BLK_av_i.txt', '', 0, 0);
AVD_40_BLKF = dlmread('NAD40BLK_av_i.txt', '', 0, 0);
CO_40_BLKF = dlmread('NCO40BLK_av_i.txt', '', 0, 0);
COF_40_BLKF = dlmread('NCF40BLK_av_i.txt', '', 0, 0);
K_40_BLKF = dlmread('K40BLK_av_i.txt', '', 0, 0);
OJ_40_BLKF = dlmread('NOJ40BLK_av_i.txt', '', 0, 0);
PD_40_BLKF = dlmread('NPD40BLK_av_i.txt', '', 0, 0);
RW_40_BLKF = dlmread('NRW40BLK_av_i.txt', '', 0, 0);
T_40_BLKF = dlmread('NTE40BLK_av_i.txt', '', 0, 0);
TS_40_BLKF = dlmread('TS40BLK_av_i.txt', '', 0, 0);

figure('color', 'w'); hold on;
plot(lambda, BLKFELT, 'k--');
plot(lambda, AVD_40_BLKF, 'g-');
plot(lambda, CO_40_BLKF, 'm-');
plot(lambda, COF_40_BLKF, 'b-');
plot(lambda, K_40_BLKF, 'c-');
plot(lambda, OJ_40_BLKF, 'y-');
plot(lambda, PD_40_BLKF, 'k-');
plot(lambda, RW_40_BLKF, 'g-.');
plot(lambda, T_40_BLKF, 'b-.');
plot(lambda, TS_40_BLKF, 'k-.');
plot(lambda, blood_40_BLKF, 'r-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('40ML Blood and Confusors on Black Felt', 'FontSize', 16);
legend('Black felt','40ML Aloe Vera Drink','40ML Coca Cola', '40ML Coffee', '40ML Ketchup', '40ML Orange Juice','40 ML Plum Drink', '40ML Red Wine', '40ML Tea','40 ML Tomato Sauce', '40ML Blood');
%}

figure('color', 'w');
plot(lambda, blood_40_BLKF-BLKFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('40ML Blood on blackfelt Reflectance - Black felt Reflectance', 'FontSize', 16);


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, AVD_4_BLKF, 'r-');
%plot(lambda, AVD8_BLKF, 'g-');
plot(lambda, AVD_10_BLKF, 'b-');
plot(lambda, AVD_18_BLKF, 'm-');
plot(lambda, AVD_30_BLKF, 'c-');
plot(lambda, AVD_40_BLKF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of AVD on Black Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');

%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, COF_4_BLKF, 'r-');
%plot(lambda, C8_BLKF, 'g-');
plot(lambda, COF_10_BLKF, 'b-');
plot(lambda, COF_18_BLKF, 'm-');
plot(lambda, COF_30_BLKF, 'c-');
plot(lambda, COF_40_BLKF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of COFFEE on Black Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, CO_4_BLKF, 'r-');
%plot(lambda, CS8_BLKF, 'g-');
plot(lambda, CO_10_BLKF, 'b-');
plot(lambda, CO_18_BLKF, 'm-');
plot(lambda, CO_30_BLKF, 'c-');
plot(lambda, CO_40_BLKF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Coca Cola on Black Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');

%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, K_4_BLKF, 'r-');
%plot(lambda, K8_BLKF, 'g-');
plot(lambda, K_10_BLKF, 'b-');
plot(lambda, K_18_BLKF, 'm-');
plot(lambda, K_30_BLKF, 'c-');
plot(lambda, K_40_BLKF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Ketchup on Black Felt', 'FontSize', 16);
legend('4ML','10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, OJ_4_BLKF, 'r-');
%plot(lambda, OJ8_BLKF, 'g-');
plot(lambda, OJ_10_BLKF, 'b-');
plot(lambda, OJ_18_BLKF, 'm-');
plot(lambda, OJ_30_BLKF, 'c-');
plot(lambda, OJ_40_BLKF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Orange Juice on Black Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, PD_4_BLKF, 'r-');
%plot(lambda, PD8_BLKF, 'g-');
plot(lambda, PD_10_BLKF, 'b-');
plot(lambda, PD_18_BLKF, 'm-');
plot(lambda, PD_30_BLKF, 'c-');
plot(lambda, PD_40_BLKF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Plum Drink on Black Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');



%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, RW_4_BLKF, 'r-');
%plot(lambda, RW8_BLKF, 'g-');
plot(lambda, RW_10_BLKF, 'b-');
plot(lambda, RW_18_BLKF, 'm-');
plot(lambda, RW_30_BLKF, 'c-');
plot(lambda, RW_40_BLKF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Red Wine on Black Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, T_4_BLKF, 'r-');
%plot(lambda, T8_BLKF, 'g-');
plot(lambda, T_10_BLKF, 'b-');
plot(lambda, T_18_BLKF, 'm-');
plot(lambda, T_30_BLKF, 'c-');
plot(lambda, T_40_BLKF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Green Tea on Black Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
%plot(lambda, TS2_BLKF, 'r-');
plot(lambda, TS_4_BLKF, 'g-');
plot(lambda, TS_10_BLKF, 'b-');
plot(lambda, TS_18_BLKF, 'm-');
plot(lambda, TS_30_BLKF, 'c-');
plot(lambda, TS_40_BLKF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Tomato Sauce on Black Felt', 'FontSize', 16);
legend( '4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, blood_4_BLKF, 'r-');
%plot(lambda, blood_8_BLKF, 'g-');
plot(lambda, blood_10_BLKF, 'b-');
plot(lambda, blood_18_BLKF, 'm-');
plot(lambda, blood_30_BLKF, 'c-');
plot(lambda, blood_40_BLKF, 'k-');
ylim([0 0.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Blood on Black Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');


%% 
%%%%%%%%%%%%%%%%%   GREY Felt   %%%%%%%%%%%%%%%%%%%%
GRYFELT = dlmread('GRYFELT_av_i.txt', '');
blood_4_GRYF = dlmread('NBD4GRY_av_i.txt', '');
%blood_8_GRYF = dlmread('8blood_GRYFELT_av_i.txt', '');
AVD_4_GRYF = dlmread('NAD4GRY_av_i.txt', '');
%AVD8_GRYF = dlmread('AVD8_GRYFELT_av_i.txt', '');
CO_4_GRYF = dlmread('NCO4GRY_av_i.txt', '');
%CS8_GRYF = dlmread('CS8_GRYFELT_av_i.txt', '');
COF_4_GRYF = dlmread('NCF4GRY_av_i.txt', '');
%C8_GRYF = dlmread('C8_GRYFELT_av_i.txt', '');
K_4_GRYF = dlmread('NK4GRY_av_i.txt', '');
OJ_4_GRYF = dlmread('NOJ4GRY_av_i.txt', '');
%OJ8_GRYF = dlmread('OJ8_GRYFELT_av_i.txt', '');
PD_4_GRYF = dlmread('NPD4GRY_av_i.txt', '');
%PD8_GRYF = dlmread('PD8_GRYFELT_av_i.txt', '');
RW_4_GRYF = dlmread('NRW4GRY_av_i.txt', '');
%RW8_GRYF = dlmread('RW8_GRYFELT_av_i.txt', '');
T_4_GRYF = dlmread('NTE4GRY_av_i.txt', '');
%T8_GRYF = dlmread('T8_GRYFELT_av_i.txt', '');
%TS2_GRYF = dlmread('TS2_GRYFELT_av_i.txt', '');
TS_4_GRYF = dlmread('NTS4GRY_av_i.txt', '');

figure('color', 'w'); hold on;
plot(lambda,GRYFELT, 'k--');
plot(lambda, blood_4_GRYF, 'r-');
plot(lambda, AVD_4_GRYF, 'g-');
plot(lambda, CO_4_GRYF, 'b-');
plot(lambda, COF_4_GRYF, 'm-');
plot(lambda, K_4_GRYF, 'y-');
plot(lambda, OJ_4_GRYF, 'c-');
plot(lambda, PD_4_GRYF, 'k-');
plot(lambda, RW_4_GRYF, 'k-.');
plot(lambda, T_4_GRYF, 'm-.');
%plot(lambda, TS2_GRYF, 'y-.');
plot(lambda, TS_4_GRYF, 'g-.');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('4ML Blood and Confusors on GREY Felt', 'FontSize', 16);
legend('Grey felt','4ML Blood','4ML Aloe Vera Drink', '4ML Coca Cola', '4ML Coffee', '4ML Ketchup', '4ML Orange Juice','4ML Plum Drink', '4ML Red Wine', '4ML Tea', '4ML Tomato Sauce');

figure('color', 'w');
plot(lambda, blood_4_GRYF-GRYFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('4ML Blood on greyfelt Reflectance - Grey felt Reflectance', 'FontSize', 16);

%
%{
figure('color', 'w'); hold on;
plot(lambda, blood_8_GRYF, 'r-');
plot(lambda, AVD8_GRYF, 'g-');
plot(lambda, CS8_GRYF, 'b-');
plot(lambda, C8_GRYF, 'm-');
%plot(lambda, K2_GRYF, 'y-');
plot(lambda, OJ8_GRYF, 'c-');
plot(lambda, PD8_GRYF, 'k-');
plot(lambda, RW8_GRYF, 'c-.');
plot(lambda, T8_GRYF, 'b-.');
%plot(lambda, TS2_GRYF, 'y-.');
plot(lambda, TS4_GRYF, 'g-.');
ylim([0 0.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('8ML Blood and Confusors on GREY Felt', 'FontSize', 16);
legend('8ML blood','8ML Aloe Vera Drink', '8ML Chestnut Soup', '8ML Coffee','8ML Orange Juice','8ML Plum Drink', '8ML Red Wine','8ML Tea');



figure('color', 'w'); hold on;
plot(lambda, blood_4_GRYF, 'r-');
plot(lambda, blood_8_GRYF, 'r--');
plot(lambda, AVD4_GRYF, 'g-');
plot(lambda, AVD8_GRYF, 'g--');
plot(lambda, CS4_GRYF, 'b-');
plot(lambda, CS8_GRYF, 'b--');
plot(lambda, C4_GRYF, 'm-');
plot(lambda, C8_GRYF, 'm--');
plot(lambda, K2_GRYF, 'c-');
plot(lambda, OJ4_GRYF, 'y-');
plot(lambda, OJ8_GRYF, 'y--');
plot(lambda, PD4_GRYF, 'k-');
plot(lambda, PD8_GRYF, 'k--');
plot(lambda, RW4_GRYF, 'k-.');
plot(lambda, RW8_GRYF, 'c-.');
plot(lambda, T4_GRYF, 'm-.');
plot(lambda, T8_GRYF, 'b-.');
plot(lambda, TS2_GRYF, 'g-.');
plot(lambda, TS4_GRYF, 'y-.');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Blood and Confusors on GREY Felt', 'FontSize', 16);
legend('4ML Blood','8ML blood','4ML Aloe Vera Drink', '8ML Aloe Vera Drink', '4ML Chestnut Soup', '8ML Chestnut Soup', '4ML Coffee', '8ML Coffee','2ML Ketchup', '4ML Orange Juice', '8ML Orange Juice','4ML Plum Drink','8ML Plum Drink', '4ML Red Wine', '8ML Red Wine','4ML Tea','8ML Tea', '2ML Tomato Sauce', '4ML Tomato Sauce');
%}


%%%%%%%%  10ML blood and confusors  %%%%%%%%%
blood_10_GRYF = dlmread('NBD10GRY_av_i.txt', '', 0, 0);
AVD_10_GRYF = dlmread('NAD10GRY_av_i.txt', '', 0, 0);
CO_10_GRYF = dlmread('NCO10GRY_av_i.txt', '', 0, 0);
COF_10_GRYF = dlmread('NCF10GRY_av_i.txt', '', 0, 0);
K_10_GRYF = dlmread('NK10GRY_av_i.txt', '', 0, 0);
OJ_10_GRYF = dlmread('NOJ10GRY_av_i.txt', '', 0, 0);
PD_10_GRYF = dlmread('NPD10GRY_av_i.txt', '', 0, 0);
RW_10_GRYF = dlmread('NRW10GRY_av_i.txt', '', 0, 0);
T_10_GRYF = dlmread('NTE10GRY_av_i.txt', '', 0, 0);
TS_10_GRYF = dlmread('NTS10GRY_av_i.txt', '', 0, 0);

figure('color', 'w'); hold on;
plot(lambda,GRYFELT, 'k--');
plot(lambda, AVD_10_GRYF, 'g-');
plot(lambda, CO_10_GRYF, 'm-');
plot(lambda, COF_10_GRYF, 'b-');
plot(lambda, K_10_GRYF, 'c-');
plot(lambda, OJ_10_GRYF, 'y-');
plot(lambda, PD_10_GRYF, 'k-');
plot(lambda, RW_10_GRYF, 'g-.');
plot(lambda, T_10_GRYF, 'b-.');
plot(lambda, TS_10_GRYF, 'k-.');
plot(lambda, blood_10_GRYF, 'r-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('10ML Blood and Confusors on GREY Felt', 'FontSize', 16);
legend('Grey Felt','10ML Aloe Vera Drink', '10ML Coca Cola','10ML Coffee', '10ML Ketchup', '10ML Orange Juice','10 ML Plum Drink', '10ML Red Wine', '10ML Tea','10 ML Tomato Sauce', '10ML Blood');
%}

figure('color', 'w');
plot(lambda, blood_10_GRYF-GRYFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('10ML Blood on greyfelt Reflectance - Grey felt Reflectance', 'FontSize', 16);

%%%%%%%%  18ML blood and confusors  %%%%%%%%%
blood_18_GRYF = dlmread('NBD18GRY_av_i.txt', '', 0, 0);
AVD_18_GRYF = dlmread('NAD18GRY_av_i.txt', '', 0, 0);
CO_18_GRYF = dlmread('NCO18GRY_av_i.txt', '', 0, 0);
COF_18_GRYF = dlmread('NCF18GRY_av_i.txt', '', 0, 0);
K_18_GRYF = dlmread('K18GRY_av_i.txt', '', 0, 0);
OJ_18_GRYF = dlmread('NOJ18GRY_av_i.txt', '', 0, 0);
PD_18_GRYF = dlmread('NPD18GRY_av_i.txt', '', 0, 0);
RW_18_GRYF = dlmread('NRW18GRY_av_i.txt', '', 0, 0);
T_18_GRYF = dlmread('NTE18GRY_av_i.txt', '', 0, 0);
TS_18_GRYF = dlmread('TS18GRY_av_i.txt', '', 0, 0);

figure('color', 'w'); hold on;
plot(lambda, GRYFELT, 'k--');
plot(lambda, AVD_18_GRYF, 'g-');
plot(lambda, CO_18_GRYF, 'm-');
plot(lambda, COF_18_GRYF, 'b-');
plot(lambda, K_18_GRYF, 'c-');
plot(lambda, OJ_18_GRYF, 'y-');
plot(lambda, PD_18_GRYF, 'k-');
plot(lambda, RW_18_GRYF, 'g-.');
plot(lambda, T_18_GRYF, 'b-.');
plot(lambda, TS_18_GRYF, 'k-.');
plot(lambda, blood_10_GRYF, 'r-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('18ML Blood and Confusors on GREY Felt', 'FontSize', 16);
legend('Grey Felt','18ML Aloe Vera Drink','18ML Coca Cola', '18ML Coffee', '18ML Ketchup', '18ML Orange Juice','18ML Plum Drink', '18ML Red Wine', '18ML Tea','18ML Tomato Sauce', '18ML Blood');
%}

figure('color', 'w');
plot(lambda, blood_18_GRYF-GRYFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('18ML Blood on greyfelt Reflectance - Grey felt Reflectance', 'FontSize', 16);

%%%%%%%%  30ML blood and confusors  %%%%%%%%%
blood_30_GRYF = dlmread('NBD30GRY_av_i.txt', '', 0, 0);
AVD_30_GRYF = dlmread('NAD30GRY_av_i.txt', '', 0, 0);
CO_30_GRYF = dlmread('NCO30GRY_av_i.txt', '', 0, 0);
COF_30_GRYF = dlmread('NCF30GRY_av_i.txt', '', 0, 0);
K_30_GRYF = dlmread('K30GRY_av_i.txt', '', 0, 0);
OJ_30_GRYF = dlmread('NOJ30GRY_av_i.txt', '', 0, 0);
PD_30_GRYF = dlmread('NPD30GRY_av_i.txt', '', 0, 0);
RW_30_GRYF = dlmread('NRW30GRY_av_i.txt', '', 0, 0);
T_30_GRYF = dlmread('NTE30GRY_av_i.txt', '', 0, 0);
TS_30_GRYF = dlmread('TS30GRY_av_i.txt', '', 0, 0);

figure('color', 'w'); hold on;
plot(lambda, GRYFELT, 'k--');
plot(lambda, AVD_30_GRYF, 'g-');
plot(lambda, CO_30_GRYF, 'm-');
plot(lambda, COF_30_GRYF, 'b-');
plot(lambda, K_30_GRYF, 'c-');
plot(lambda, OJ_30_GRYF, 'y-');
plot(lambda, PD_30_GRYF, 'k-');
plot(lambda, RW_30_GRYF, 'g-.');
plot(lambda, T_30_GRYF, 'b-.');
plot(lambda, TS_30_GRYF, 'k-.');
plot(lambda, blood_30_GRYF, 'r-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('30ML Blood and Confusors on GREY Felt', 'FontSize', 16);
legend('Grey felt','30ML Aloe Vera Drink', '30ML Coca Cola','30ML Coffee', '30ML Ketchup', '30ML Orange Juice','30 ML Plum Drink', '30ML Red Wine', '30ML Tea','30ML Tomato Sauce','30ML Blood');
%}

figure('color', 'w');
plot(lambda, blood_30_GRYF-GRYFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('30ML Blood on greyfelt Reflectance - Grey felt Reflectance', 'FontSize', 16);


%%%%%%%%  40ML blood and confusors  %%%%%%%%%
blood_40_GRYF = dlmread('NBD40GRY_av_i.txt', '', 0, 0);
AVD_40_GRYF = dlmread('NAD40GRY_av_i.txt', '', 0, 0);
CO_40_GRYF = dlmread('NCO40GRY_av_i.txt', '', 0, 0);
COF_40_GRYF = dlmread('NCF40GRY_av_i.txt', '', 0, 0);
K_40_GRYF = dlmread('K40GRY_av_i.txt', '', 0, 0);
OJ_40_GRYF = dlmread('NOJ40GRY_av_i.txt', '', 0, 0);
PD_40_GRYF = dlmread('NPD40GRY_av_i.txt', '', 0, 0);
RW_40_GRYF = dlmread('NRW40GRY_av_i.txt', '', 0, 0);
T_40_GRYF = dlmread('NTE40GRY_av_i.txt', '', 0, 0);
TS_40_GRYF = dlmread('TS40GRY_av_i.txt', '', 0, 0);

figure('color', 'w'); hold on;
plot(lambda,GRYFELT, 'k--');
plot(lambda, AVD_40_GRYF, 'g-');
plot(lambda, CO_40_GRYF, 'm-');
plot(lambda, COF_40_GRYF, 'b-');
plot(lambda, K_40_GRYF, 'c-');
plot(lambda, OJ_40_GRYF, 'y-');
plot(lambda, PD_40_GRYF, 'k-');
plot(lambda, RW_40_GRYF, 'g-.');
plot(lambda, T_40_GRYF, 'b-.');
plot(lambda, TS_40_GRYF, 'k-.');
plot(lambda, blood_40_GRYF, 'r-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('40ML Blood and Confusors on GREY Felt', 'FontSize', 16);
legend('Grey felt','40ML Aloe Vera Drink', '40ML Coca Cola', '40ML Coffee','40ML Ketchup', '40ML Orange Juice','40ML Plum Drink', '40ML Red Wine', '40ML Tea','10 ML Tomato Sauce','40ML Blood');
%}

figure('color', 'w');
plot(lambda, blood_40_GRYF-GRYFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('40ML Blood on greyfelt Reflectance - Grey felt Reflectance', 'FontSize', 16);

%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, AVD_4_GRYF, 'r-');
%plot(lambda, AVD8_GRYF, 'g-');
plot(lambda, AVD_10_GRYF, 'b-');
plot(lambda, AVD_18_GRYF, 'm-');
plot(lambda, AVD_30_GRYF, 'c-');
plot(lambda, AVD_40_GRYF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of AVD on GREY Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');

%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, COF_4_GRYF, 'r-');
%plot(lambda, C8_GRYF, 'g-');
plot(lambda, COF_10_GRYF, 'b-');
plot(lambda, COF_18_GRYF, 'm-');
plot(lambda, COF_30_GRYF, 'c-');
plot(lambda, COF_40_GRYF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of COFFEE on GREY Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, CO_4_GRYF, 'r-');
%plot(lambda, CS8_GRYF, 'g-');
plot(lambda, CO_10_GRYF, 'b-');
plot(lambda, CO_18_GRYF, 'm-');
plot(lambda, CO_30_GRYF, 'c-');
plot(lambda, CO_40_GRYF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Coca Cola on GRY Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');

%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, K_4_GRYF, 'r-');
plot(lambda, K_10_GRYF, 'b-');
plot(lambda, K_18_GRYF, 'm-');
plot(lambda, K_30_GRYF, 'c-');
plot(lambda, K_40_GRYF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Ketchup on GREY Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, OJ_4_GRYF, 'r-');
%plot(lambda, OJ8_GRYF, 'g-');
plot(lambda, OJ_10_GRYF, 'b-');
plot(lambda, OJ_18_GRYF, 'm-');
plot(lambda, OJ_30_GRYF, 'c-');
plot(lambda, OJ_40_GRYF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Orange Juice on GREY Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, PD_4_GRYF, 'r-');
%plot(lambda, PD8_GRYF, 'g-');
plot(lambda, PD_10_GRYF, 'b-');
plot(lambda, PD_18_GRYF, 'm-');
plot(lambda, PD_30_GRYF, 'c-');
plot(lambda, PD_40_GRYF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Plum Drink on GREY Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');



%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, RW_4_GRYF, 'r-');
%plot(lambda, RW8_GRYF, 'g-');
plot(lambda, RW_10_GRYF, 'b-');
plot(lambda, RW_18_GRYF, 'm-');
plot(lambda, RW_30_GRYF, 'c-');
plot(lambda, RW_40_GRYF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Red Wine on GREY Felt', 'FontSize', 16);
legend('4ML', '10ML', '20ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, T_4_GRYF, 'r-');
%plot(lambda, T8_GRYF, 'g-');
plot(lambda, T_10_GRYF, 'b-');
plot(lambda, T_18_GRYF, 'm-');
plot(lambda, T_30_GRYF, 'c-');
plot(lambda, T_40_GRYF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Green Tea on GREY Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, TS_4_GRYF, 'r-');
%plot(lambda, TS4_GRYF, 'g-');
plot(lambda, TS_10_GRYF, 'b-');
plot(lambda, TS_18_GRYF, 'm-');
plot(lambda, TS_30_GRYF, 'c-');
plot(lambda, TS_40_GRYF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Tomato Sauce on GREY Felt', 'FontSize', 16);
legend( '4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, blood_4_GRYF, 'r-');
%plot(lambda, blood_8_GRYF, 'g-');
plot(lambda, blood_10_GRYF, 'b-');
plot(lambda, blood_18_GRYF, 'm-');
plot(lambda, blood_30_GRYF, 'c-');
plot(lambda, blood_40_GRYF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Blood on GREY Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');




%% 

%%%%%%%%%%%%%%%%%   GREEN Felt   %%%%%%%%%%%%%%%%%%%%
GRNFELT = dlmread('GRNFELT_av_i.txt', '');
blood_4_GRNF = dlmread('NBD4GRN_av_i.txt', '');
%blood_8_GRNF = dlmread('8blood_GRNFELT_av_i.txt', '');
AVD_4_GRNF = dlmread('NAD4GRN_av_i.txt', '');
%AVD8_GRNF = dlmread('AVD8_GRNFELT_av_i.txt', '');
CO_4_GRNF = dlmread('NCO4GRN_av_i.txt', '');
%CS8_GRNF = dlmread('CS8_GRNFELT_av_i.txt', '');
COF_4_GRNF = dlmread('NCF4GRN_av_i.txt', '');
%C8_GRNF = dlmread('C8_GRNFELT_av_i.txt', '');
K_4_GRNF = dlmread('NK4GRN_av_i.txt', '');
OJ_4_GRNF = dlmread('NOJ4GRN_av_i.txt', '');
%OJ8_GRNF = dlmread('OJ8_GRNFELT_av_i.txt', '');
PD_4_GRNF = dlmread('NPD4GRN_av_i.txt', '');
%PD8_GRNF = dlmread('PD8_GRNFELT_av_i.txt', '');
RW_4_GRNF = dlmread('NRW4GRN_av_i.txt', '');
%RW8_GRNF = dlmread('RW8_GRNFELT_av_i.txt', '');
T_4_GRNF = dlmread('NTE4GRN_av_i.txt', '');
%T8_GRNF = dlmread('T8_GRNFELT_av_i.txt', '');
%TS2_GRNF = dlmread('TS2_GRNFELT_av_i.txt', '');
TS_4_GRNF = dlmread('NTS4GRN_av_i.txt', '');

figure('color', 'w'); hold on;
plot(lambda, GRNFELT, 'k--');
plot(lambda, blood_4_GRNF, 'r-');
plot(lambda, AVD_4_GRNF, 'g-');
plot(lambda, CO_4_GRNF, 'b-');
plot(lambda, COF_4_GRNF, 'm-');
plot(lambda, K_4_GRNF, 'y-');
plot(lambda, OJ_4_GRNF, 'c-');
plot(lambda, PD_4_GRNF, 'k-');
plot(lambda, RW_4_GRNF, 'k-.');
plot(lambda, T_4_GRNF, 'm-.');
%plot(lambda, TS2_GRNF, 'y-.');
plot(lambda, TS_4_GRNF, 'g-.');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('4ML Blood and Confusors on GREEN Felt', 'FontSize', 16);
legend('Green felt','4ML Blood','4ML Aloe Vera Drink', '4ML Coca Cola', '4ML Coffee','4ML Ketchup', '4ML Orange Juice','4ML Plum Drink', '4ML Red Wine', '4ML Tea', '4ML Tomato Sauce');


figure('color', 'w');
plot(lambda, blood_4_GRNF-GRNFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('4ML Blood on greenfelt Reflectance - Green felt Reflectance', 'FontSize', 16);

%{
figure('color', 'w'); hold on;
plot(lambda, blood_8_GRNF, 'r-');
plot(lambda, AVD8_GRNF, 'g-');
plot(lambda, CS8_GRNF, 'b-');
plot(lambda, C8_GRNF, 'm-');
plot(lambda, OJ8_GRNF, 'm-.');
plot(lambda, PD8_GRNF, 'k-');
plot(lambda, RW8_GRNF, 'c-.');
plot(lambda, T8_GRNF, 'b-.');
ylim([0 0.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('8ML Blood and Confusors on GREEN Felt', 'FontSize', 16);
legend('8ML blood', '8ML Aloe Vera Drink', '8ML Chestnut Soup', '8ML Coffee', '8ML Orange Juice','8ML Plum Drink', '8ML Red Wine','8ML Tea');


figure('color', 'w'); hold on;
plot(lambda, blood_4_GRNF, 'r-');
plot(lambda, blood_8_GRNF, 'r--');
plot(lambda, AVD4_GRNF, 'g-');
plot(lambda, AVD8_GRNF, 'g--');
plot(lambda, CS4_GRNF, 'b-');
plot(lambda, CS8_GRNF, 'b--');
plot(lambda, C4_GRNF, 'm-');
plot(lambda, C8_GRNF, 'm--');
plot(lambda, K2_GRNF, 'c-');
plot(lambda, OJ4_GRNF, 'y-');
plot(lambda, OJ8_GRNF, 'y--');
plot(lambda, PD4_GRNF, 'k-');
plot(lambda, PD8_GRNF, 'k--');
plot(lambda, RW4_GRNF, 'k-.');
plot(lambda, RW8_GRNF, 'c-.');
plot(lambda, T4_GRNF, 'm-.');
plot(lambda, T8_GRNF, 'b-.');
plot(lambda, TS2_GRNF, 'g-.');
plot(lambda, TS4_GRNF, 'y-.');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Blood and Confusors on GREEN Felt', 'FontSize', 16);
legend('4ML Blood','8ML blood','4ML Aloe Vera Drink', '8ML Aloe Vera Drink', '4ML Chestnut Soup', '8ML Chestnut Soup', '4ML Coffee', '8ML Coffee','2ML Ketchup', '4ML Orange Juice', '8ML Orange Juice','4ML Plum Drink','8ML Plum Drink', '4ML Red Wine', '8ML Red Wine','4ML Tea','8ML Tea', '2ML Tomato Sauce', '4ML Tomato Sauce');
%}


%%%%%%%%  10ML blood and confusors  %%%%%%%%%
blood_10_GRNF = dlmread('NBD10GRN_av_i.txt', '', 0, 0);
AVD_10_GRNF = dlmread('NAD10GRN_av_i.txt', '', 0, 0);
CO_10_GRNF = dlmread('NCO10GRN_av_i.txt', '', 0, 0);
COF_10_GRNF = dlmread('NCF10GRN_av_i.txt', '', 0, 0);
K_10_GRNF = dlmread('NK10GRN_av_i.txt', '', 0, 0);
OJ_10_GRNF = dlmread('NOJ10GRN_av_i.txt', '', 0, 0);
PD_10_GRNF = dlmread('NPD10GRN_av_i.txt', '', 0, 0);
RW_10_GRNF = dlmread('NRW10GRN_av_i.txt', '', 0, 0);
T_10_GRNF = dlmread('NTE10GRN_av_i.txt', '', 0, 0);
TS_10_GRNF = dlmread('NTS10GRN_av_i.txt', '', 0, 0);

figure('color', 'w'); hold on;
plot(lambda, GRNFELT, 'k--');
plot(lambda, AVD_10_GRNF, 'g-');
plot(lambda, CO_10_GRNF, 'm-');
plot(lambda, COF_10_GRNF, 'b-');
plot(lambda, K_10_GRNF, 'c-');
plot(lambda, OJ_10_GRNF, 'y-');
plot(lambda, PD_10_GRNF, 'k-');
plot(lambda, RW_10_GRNF, 'g-.');
plot(lambda, T_10_GRNF, 'b-.');
plot(lambda, TS_10_GRNF, 'k-.');
plot(lambda, blood_10_GRNF, 'r-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('10ML Blood and Confusors on GREEN Felt', 'FontSize', 16);
legend('Green felt','10ML Aloe Vera Drink',  '10ML Coca Cola','10ML Coffee','10ML Ketchup', '10ML Orange Juice','10 ML Plum Drink', '10ML Red Wine', '10ML Tea','10 ML Tomato Sauce','10ML Blood');
%}

figure('color', 'w');
plot(lambda, blood_10_GRNF-GRNFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('10ML Blood on greenfelt Reflectance - Green felt Reflectance', 'FontSize', 16);

%%%%%%%%  18ML blood and confusors  %%%%%%%%%
blood_18_GRNF = dlmread('NBD18GRN_av_i.txt', '', 0, 0);
AVD_18_GRNF = dlmread('NAD18GRN_av_i.txt', '', 0, 0);
CO_18_GRNF = dlmread('NCO18GRN_av_i.txt', '', 0, 0);
COF_18_GRNF = dlmread('NCF18GRN_av_i.txt', '', 0, 0);
K_18_GRNF = dlmread('K18GRN_av_i.txt', '', 0, 0);
OJ_18_GRNF = dlmread('NOJ18GRN_av_i.txt', '', 0, 0);
PD_18_GRNF = dlmread('NPD18GRN_av_i.txt', '', 0, 0);
RW_18_GRNF = dlmread('NRW18GRN_av_i.txt', '', 0, 0);
T_18_GRNF = dlmread('NTE18GRN_av_i.txt', '', 0, 0);
TS_18_GRNF = dlmread('TS18GRN_av_i.txt', '', 0, 0);

figure('color', 'w'); hold on;
plot(lambda, GRNFELT, 'k--');
plot(lambda, AVD_18_GRNF, 'g-');
plot(lambda, CO_18_GRNF, 'm-');
plot(lambda, COF_18_GRNF, 'b-');
plot(lambda, K_18_GRNF, 'c-');
plot(lambda, OJ_18_GRNF, 'y-');
plot(lambda, PD_18_GRNF, 'k-');
plot(lambda, RW_18_GRNF, 'g-.');
plot(lambda, T_18_GRNF, 'b-.');
plot(lambda, TS_18_GRNF, 'k-.');
plot(lambda, blood_18_GRNF, 'r-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('18ML Blood and Confusors on GREEN Felt', 'FontSize', 16);
legend('Green Felt', '18ML Aloe Vera Drink', '18ML Coca Cola','18ML Coffee', '18ML Ketchup', '18ML Orange Juice','18ML Plum Drink', '18ML Red Wine', '18ML Tea','18ML Tomato Sauce','18ML Blood');
%}

figure('color', 'w');
plot(lambda, blood_18_GRNF-GRNFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('18ML Blood on greenfelt Reflectance - Green felt Reflectance', 'FontSize', 16);

%%%%%%%%  30ML blood and confusors  %%%%%%%%%
blood_30_GRNF = dlmread('NBD30GRN_av_i.txt', '', 0, 0);
AVD_30_GRNF = dlmread('NAD30GRN_av_i.txt', '', 0, 0);
CO_30_GRNF = dlmread('NCO30GRN_av_i.txt', '', 0, 0);
COF_30_GRNF = dlmread('NCF30GRN_av_i.txt', '', 0, 0);
K_30_GRNF = dlmread('K30GRN_av_i.txt', '', 0, 0);
OJ_30_GRNF = dlmread('NOJ30GRN_av_i.txt', '', 0, 0);
PD_30_GRNF = dlmread('NPD30GRN_av_i.txt', '', 0, 0);
RW_30_GRNF = dlmread('NRW30GRN_av_i.txt', '', 0, 0);
T_30_GRNF = dlmread('NTE30GRN_av_i.txt', '', 0, 0);
TS_30_GRNF = dlmread('TS30GRN_av_i.txt', '', 0, 0);

figure('color', 'w'); hold on;
plot(lambda, GRNFELT, 'k--');
plot(lambda, AVD_30_GRNF, 'g-');
plot(lambda, CO_30_GRNF, 'm-');
plot(lambda, COF_30_GRNF, 'b-');
plot(lambda, K_30_GRNF, 'c-');
plot(lambda, OJ_30_GRNF, 'y-');
plot(lambda, PD_30_GRNF, 'k-');
plot(lambda, RW_30_GRNF, 'g-.');
plot(lambda, T_30_GRNF, 'b-.');
plot(lambda, TS_30_GRNF, 'k-.');
plot(lambda, blood_30_GRNF, 'r-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('30ML Blood and Confusors on GREEN Felt', 'FontSize', 16);
legend('Green Felt','30ML Aloe Vera Drink', '30ML Coca Cola','30ML Coffee', '30ML Ketchup', '30ML Orange Juice','30 ML Plum Drink', '30ML Red Wine', '30ML Tea','30 ML Tomato Sauce','30ML Blood');
%}

figure('color', 'w');
plot(lambda, blood_30_GRNF-GRNFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('30ML Blood on greenfelt Reflectance - Green felt Reflectance', 'FontSize', 16);

%%%%%%%%  40ML blood and confusors  %%%%%%%%%
blood_40_GRNF = dlmread('NBD40GRN_av_i.txt', '', 0, 0);
AVD_40_GRNF = dlmread('NAD40GRN_av_i.txt', '', 0, 0);
CO_40_GRNF = dlmread('NCO40GRN_av_i.txt', '', 0, 0);
COF_40_GRNF = dlmread('NCF40GRN_av_i.txt', '', 0, 0);
K_40_GRNF = dlmread('K40GRN_av_i.txt', '', 0, 0);
OJ_40_GRNF = dlmread('NOJ40GRN_av_i.txt', '', 0, 0);
PD_40_GRNF = dlmread('NPD40GRN_av_i.txt', '', 0, 0);
RW_40_GRNF = dlmread('NRW40GRN_av_i.txt', '', 0, 0);
T_40_GRNF = dlmread('NTE40GRN_av_i.txt', '', 0, 0);
TS_40_GRNF = dlmread('TS40GRN_av_i.txt', '', 0, 0);

figure('color', 'w'); hold on;
plot(lambda, GRNFELT, 'k--');
plot(lambda, AVD_40_GRNF, 'g-');
plot(lambda, CO_40_GRNF, 'm-');
plot(lambda, COF_40_GRNF, 'b-');
plot(lambda, K_40_GRNF, 'c-');
plot(lambda, OJ_40_GRNF, 'y-');
plot(lambda, PD_40_GRNF, 'k-');
plot(lambda, RW_40_GRNF, 'g-.');
plot(lambda, T_40_GRNF, 'b-.');
plot(lambda, TS_40_GRNF, 'k-.');
plot(lambda, blood_40_GRNF, 'r-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('40ML Blood and Confusors on GREEN Felt', 'FontSize', 16);
legend('Green Felt','40ML Aloe Vera Drink', '40ML Coca Cola','40ML Coffee','40ML Ketchup', '40ML Orange Juice','40 ML Plum Drink', '40ML Red Wine', '40ML Tea','40 ML Tomato Sauce','40ML Blood');
%}

figure('color', 'w');
plot(lambda, blood_40_GRNF-GRNFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('40ML Blood on greenfelt Reflectance - Green felt Reflectance', 'FontSize', 16);

%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, AVD_4_GRNF, 'r-');
%plot(lambda, AVD8_GRNF, 'g-');
plot(lambda, AVD_10_GRNF, 'b-');
plot(lambda, AVD_18_GRNF, 'm-');
plot(lambda, AVD_30_GRNF, 'c-');
plot(lambda, AVD_40_GRNF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of AVD on GREEN Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');

%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, COF_4_GRNF, 'r-');
%plot(lambda, C8_GRNF, 'g-');
plot(lambda, COF_10_GRNF, 'b-');
plot(lambda, COF_18_GRNF, 'm-');
plot(lambda, COF_30_GRNF, 'c-');
plot(lambda, COF_40_GRNF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of COFFEE on GREEN Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, CO_4_GRNF, 'r-');
%plot(lambda, COLA8_GRNF, 'g-');
plot(lambda, CO_10_GRNF, 'b-');
plot(lambda, CO_18_GRNF, 'm-');
plot(lambda, CO_30_GRNF, 'c-');
plot(lambda, CO_40_GRNF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Coca Cola on GREEN Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');

%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, K_4_GRNF, 'r-');
plot(lambda, K_10_GRNF, 'b-');
plot(lambda, K_18_GRNF, 'm-');
plot(lambda, K_30_GRNF, 'c-');
plot(lambda, K_40_GRNF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Ketchup on GREEN Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, OJ_4_GRNF, 'r-');
%plot(lambda, OJ8_GRNF, 'g-');
plot(lambda, OJ_10_GRNF, 'b-');
plot(lambda, OJ_18_GRNF, 'm-');
plot(lambda, OJ_30_GRNF, 'c-');
plot(lambda, OJ_40_GRNF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Orange Juice on GREEN Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, PD_4_GRNF, 'r-');
%plot(lambda, PD8_GRNF, 'g-');
plot(lambda, PD_10_GRNF, 'b-');
plot(lambda, PD_18_GRNF, 'm-');
plot(lambda, PD_30_GRNF, 'c-');
plot(lambda, PD_40_GRNF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Plum Drink on GREEN Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');



%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, RW_4_GRNF, 'r-');
%plot(lambda, RW8_GRNF, 'g-');
plot(lambda, RW_10_GRNF, 'b-');
plot(lambda, RW_18_GRNF, 'm-');
plot(lambda, RW_30_GRNF, 'c-');
plot(lambda, RW_40_GRNF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Red Wine on GREEN Felt', 'FontSize', 16);
legend('4ML', '10ML', '20ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, T_4_GRNF, 'r-');
%plot(lambda, T8_GRNF, 'g-');
plot(lambda, T_10_GRNF, 'b-');
plot(lambda, T_18_GRNF, 'm-');
plot(lambda, T_30_GRNF, 'c-');
plot(lambda, T_40_GRNF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Green Tea on GREEN Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
%plot(lambda, TS2_GRNF, 'r-');
plot(lambda, TS_4_GRNF, 'g-');
plot(lambda, TS_10_GRNF, 'b-');
plot(lambda, TS_18_GRNF, 'm-');
plot(lambda, TS_30_GRNF, 'c-');
plot(lambda, TS_40_GRNF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Tomato Sauce on GREEN Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');


%%%%%%%%% SOME PLOTS FOR THE SAME KIND OF LIQUID %%%%%%%%
figure('color', 'w'); hold on;
plot(lambda, blood_4_GRNF, 'r-');
%plot(lambda, blood_8_GRNF, 'g-');
plot(lambda, blood_10_GRNF, 'b-');
plot(lambda, blood_18_GRNF, 'm-');
plot(lambda, blood_30_GRNF, 'c-');
plot(lambda, blood_40_GRNF, 'k-');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Different amount of Blood on GREEN Felt', 'FontSize', 16);
legend('4ML', '10ML', '18ML', '30ML', '40ML');



%%
%%%%%%%%%%%%%%%%%   RED Felt   %%%%%%%%%%%%%%%%%%%%
REDFELT = dlmread('REDFELT_av_i.txt', '');
blood_4_REDF = dlmread('4blood_REDFELT_av_i.txt', '');
blood_8_REDF = dlmread('8blood_REDFELT_av_i.txt', '');
AVD_4_REDF = dlmread('AVD4_REDFELT_av_i.txt', '');
AVD_8_REDF = dlmread('AVD8_REDFELT_av_i.txt', '');
CO_4_REDF = dlmread('NCO4RED_av_i.txt', '');
CO_8_REDF = dlmread('NCO8RED_av_i.txt', '');
COF_4_REDF = dlmread('C4_REDFELT_av_i.txt', '');
COF_8_REDF = dlmread('C8_REDFELT_av_i.txt', '');
K_2_REDF = dlmread('K2_REDFELT_av_i.txt', '');
OJ_4_REDF = dlmread('OJ4_REDFELT_av_i.txt', '');
OJ_8_REDF = dlmread('OJ8_REDFELT_av_i.txt', '');
PD_4_REDF = dlmread('PD4_REDFELT_av_i.txt', '');
PD_8_REDF = dlmread('PD8_REDFELT_av_i.txt', '');
RW_4_REDF = dlmread('RW4_REDFELT_av_i.txt', '');
RW_8_REDF = dlmread('RW8_REDFELT_av_i.txt', '');
T_4_REDF = dlmread('T4_REDFELT_av_i.txt', '');
T_8_REDF = dlmread('T8_REDFELT_av_i.txt', '');
TS_2_REDF = dlmread('TS2_REDFELT_av_i.txt', '');
TS_4_REDF = dlmread('TS4_REDFELT_av_i.txt', '');

figure('color', 'w'); hold on;
plot(lambda, REDFELT, 'k--');
plot(lambda, blood_4_REDF, 'r-');
plot(lambda, AVD_4_REDF, 'g-');
plot(lambda, CO_4_REDF, 'b-');
plot(lambda, COF_4_REDF, 'm-');
%plot(lambda, K2_REDF, 'y-');
plot(lambda, OJ_4_REDF, 'c-');
plot(lambda, PD_4_REDF, 'k-');
plot(lambda, RW_4_REDF, 'k-.');
plot(lambda, T_4_REDF, 'm-.');
%plot(lambda, TS2_REDF, 'y-.');
plot(lambda, TS_4_REDF, 'g-.');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('4ML Blood and Confusors on RED Felt', 'FontSize', 16);
legend('Red Felt','4ML Blood','4ML Aloe Vera Drink','4ML Cola', '4ML Coffee', '4ML Orange Juice','4ML Plum Drink', '4ML Red Wine', '4ML Tea', '4ML Tomato Sauce');

figure('color', 'w');
plot(lambda, blood_4_REDF-REDFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('4ML Blood on Redfelt Reflectance - Red felt Reflectance', 'FontSize', 16);


figure('color', 'w'); hold on;
plot(lambda, GRNFELT, 'k--');
plot(lambda, blood_8_REDF, 'r-');
plot(lambda, AVD_8_REDF, 'g-');
plot(lambda, CO_8_REDF, 'b-');
plot(lambda, COF_8_REDF, 'm-');
plot(lambda, OJ_8_REDF, 'm-.');
plot(lambda, PD_8_REDF, 'k--');
plot(lambda, RW_8_REDF, 'c-.');
plot(lambda, T_8_REDF, 'b-.');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('8ML Blood and Confusors on RED Felt', 'FontSize', 16);
legend('Red felt','8ML blood', '8ML Aloe Vera Drink','8ML Cola', '8ML Coffee','8ML Orange Juice','8ML Plum Drink', '8ML Red Wine','8ML Tea');

figure('color', 'w');
plot(lambda, blood_8_REDF-REDFELT);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('8ML Blood on Redfelt Reflectance - Red felt Reflectance', 'FontSize', 16);


figure('color', 'w'); hold on;
plot(lambda, GRNFELT, 'k--');
plot(lambda, blood_4_REDF, 'r-');
plot(lambda, blood_8_REDF, 'r--');
plot(lambda, AVD_4_REDF, 'g-');
plot(lambda, AVD_8_REDF, 'g--');
plot(lambda, CO_4_REDF, 'b-');
plot(lambda, CO_8_REDF, 'b--');
plot(lambda, COF_4_REDF, 'm-');
plot(lambda, COF_8_REDF, 'm--');
plot(lambda, K_2_REDF, 'c-');
plot(lambda, OJ_4_REDF, 'y-');
plot(lambda, OJ_8_REDF, 'y--');
plot(lambda, PD_4_REDF, 'k-');
plot(lambda, PD_8_REDF, 'k--');
plot(lambda, RW_4_REDF, 'k-.');
plot(lambda, RW_8_REDF, 'c-.');
plot(lambda, T_4_REDF, 'm-.');
plot(lambda, T_8_REDF, 'b-.');
plot(lambda, TS_2_REDF, 'g-.');
plot(lambda, TS_4_REDF, 'y-.');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('Blood and Confusors on RED Felt', 'FontSize', 16);
legend('Red felt','4ML Blood','8ML blood','4ML Aloe Vera Drink', '8ML Aloe Vera Drink', '4ML Cola', '8ML Cola', '4ML Coffee', '8ML Coffee','2ML Ketchup', '4ML Orange Juice', '8ML Orange Juice','4ML Plum Drink','8ML Plum Drink', '4ML Red Wine', '8ML Red Wine','4ML Tea','8ML Tea', '2ML Tomato Sauce', '4ML Tomato Sauce');




%%%%%%%%%%%%%%%%%   Cotton T-shirt   %%%%%%%%%%%%%%%%%%%%
WHICOTN = dlmread('WHITCOTN_av_i.txt', '');
blood_2_COTNT = dlmread('2blood_COTNTSHIT_av_i.txt', '');
AVD_2_COTNT = dlmread('AVD2_WHICOTN_av_i.txt', '');
CO_2_COTNT = dlmread('NCO2CT_av_i.txt', '');
COF_2_COTNT = dlmread('C2_WHICOTN_av_i.txt', '');
K_2_COTNT = dlmread('K2_WHICOTN_av_i.txt', '');
OJ_2_COTNT = dlmread('OJ2_WHICOTN_av_i.txt', '');
PD_2_COTNT = dlmread('PD2_WHICOTN_av_i.txt', '');
RW_2_COTNT = dlmread('RW2_WHICOTN_av_i.txt', '');
T_2_COTNT = dlmread('T2_WHICOTN_av_i.txt', '');
TS_2_COTNT = dlmread('TS2_WHICOTN_av_i.txt', '');
figure('color', 'w'); hold on;
plot(lambda, WHICOTN, 'k--');
plot(lambda, blood_2_COTNT, 'r-');
plot(lambda, AVD_2_COTNT, 'g-');
plot(lambda, CO_2_COTNT, 'b-');
plot(lambda, COF_2_COTNT, 'm-');
plot(lambda, K_2_COTNT, 'c-');
plot(lambda, OJ_2_COTNT, 'y-');
plot(lambda, PD_2_COTNT, 'k-');
plot(lambda, RW_2_COTNT, 'k-.');
plot(lambda, T_2_COTNT, 'm-.');
plot(lambda, TS_2_COTNT, 'g-.');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('2ML Blood and Confusors on 100% WHITE COTTON', 'FontSize', 16);
legend('White Cotton','Blood','Aloe Vera Drink', 'Cola', 'Coffee', 'Ketchup', 'Orange Juice', 'Plum Drink', 'Red Wine', 'Tea', 'Tomato Sauce');

figure('color', 'w');
plot(lambda, blood_2_COTNT-WHICOTN);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('2ML Blood on white cotton Reflectance - white cotton Reflectance', 'FontSize', 16);



%%%%%%%%%%%%%%%%%   POLYESTER T-shirt   %%%%%%%%%%%%%%%%%%%%
WHIPOLY = dlmread('WHIPOLY_av_i.txt', '');
blood_2_POLY = dlmread('2blood_POLY_av_i.txt', '');
AVD_2_POLY = dlmread('AVD2_WHIPOLY_av_i.txt', '');
CO_2_POLY = dlmread('NCO2PT_av_i.txt', '');
COF_2_POLY = dlmread('C2_WHIPOLY_av_i.txt', '');
K_2_POLY = dlmread('K2_WHIPOLY_av_i.txt', '');
OJ_2_POLY = dlmread('OJ2_WHIPOLY_av_i.txt', '');
PD_2_POLY = dlmread('PD2_WHIPOLY_av_i.txt', '');
RW_2_POLY = dlmread('RW2_WHIPOLY_av_i.txt', '');
T_2_POLY = dlmread('T2_WHIPOLY_av_i.txt', '');
TS_2_POLY = dlmread('TS2_WHIPOLY_av_i.txt', '');
figure('color', 'w'); hold on;
plot(lambda, WHIPOLY, 'k--');
plot(lambda, blood_2_POLY, 'r-');
plot(lambda, AVD_2_POLY, 'g-');
plot(lambda, CO_2_POLY, 'b-');
plot(lambda, COF_2_POLY, 'm-');
plot(lambda, K_2_POLY, 'c-');
plot(lambda, OJ_2_POLY, 'y-');
plot(lambda, PD_2_POLY, 'k-');
plot(lambda, RW_2_POLY, 'k-.');
plot(lambda, T_2_POLY, 'm-.');
plot(lambda, TS_2_POLY, 'g-.');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('2ML Blood and Confusors on 100% WHITE POLYESTER', 'FontSize', 16);
legend('White Poly','Blood','Aloe Vera Drink', 'Cola', 'Coffee', 'Ketchup', 'Orange Juice', 'Plum Drink', 'Red Wine', 'Tea', 'Tomato Sauce');


figure('color', 'w');
plot(lambda, blood_2_POLY-WHIPOLY);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('2ML Blood on white poly Reflectance - white poly Reflectance', 'FontSize', 16);

%%%%%%%%%%%%%%%%%   JEANS   %%%%%%%%%%%%%%%%%%%%
JEAN = dlmread('JEAN_av_i.txt', '');
blood_2_J = dlmread('2blood_JEANS_av_i.txt', '');
AVD_2_J = dlmread('AVD2_JEANS_av_i.txt', '');
CO_2_J = dlmread('NCO2J_av_i.txt', '');
COF_2_J = dlmread('C2_JEANS_av_i.txt', '');
K_2_J = dlmread('K2_JEANS_av_i.txt', '');
OJ_2_J = dlmread('OJ2_JEANS_av_i.txt', '');
PD_2_J = dlmread('PD2_JEANS_av_i.txt', '');
RW_2_J = dlmread('RW2_JEANS_av_i.txt', '');
T_2_J = dlmread('T2_JEANS_av_i.txt', '');
TS_2_J = dlmread('TS2_JEANS_av_i.txt', '');
figure('color', 'w'); hold on;
plot(lambda, JEAN, 'k--');
plot(lambda, blood_2_J, 'r-');
plot(lambda, AVD_2_J, 'g-');
plot(lambda, CO_2_J, 'b-');
plot(lambda, COF_2_J, 'm-');
plot(lambda, K_2_J, 'c-');
plot(lambda, OJ_2_J, 'y-');
plot(lambda, PD_2_J, 'k-');
plot(lambda, RW_2_J, 'k-.');
plot(lambda, T_2_J, 'm-.');
plot(lambda, TS_2_J, 'g-.');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('2ML Blood and Confusors on JEANS', 'FontSize', 16);
legend('Jeans','Blood','Aloe Vera Drink', 'Cola', 'Coffee', 'Ketchup', 'Orange Juice', 'Plum Drink', 'Red Wine', 'Tea', 'Tomato Sauce');


figure('color', 'w');
plot(lambda, blood_2_J-JEAN);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('2ML Blood on Jean Reflectance - Jean Reflectance', 'FontSize', 16);

%%%%%%%%%%%%%%%%%   WOOD   %%%%%%%%%%%%%%%%%%%%
WOOD = dlmread('WOODD2_av_i.txt', '');
blood_1_WOOD = dlmread('1blood_WOOD_av_i.txt', '');
AVD_1_WOOD = dlmread('AVD1_WOOD_av_i.txt', '');
CO_1_WOOD = dlmread('NCO1W_av_i.txt', '');
COF_1_WOOD = dlmread('C1_WOOD_av_i.txt', '');
K_1_WOOD = dlmread('K1_WOOD_av_i.txt', '');
OJ_1_WOOD = dlmread('OJ1_WOOD_av_i.txt', '');
PD_1_WOOD = dlmread('PD1_WOOD_av_i.txt', '');
RW_1_WOOD = dlmread('RW1_WOOD_av_i.txt', '');
T_1_WOOD = dlmread('T1_WOOD_av_i.txt', '');
TS_1_WOOD = dlmread('TS1_WOOD_av_i.txt', '');
figure('color', 'w'); hold on;
plot(lambda, WOOD, 'k--');
plot(lambda, blood_1_WOOD, 'r-');
plot(lambda, AVD_1_WOOD, 'g-');
plot(lambda, CO_1_WOOD, 'b-');
plot(lambda, COF_1_WOOD, 'm-');
plot(lambda, K_1_WOOD, 'c-');
plot(lambda, OJ_1_WOOD, 'y-');
plot(lambda, PD_1_WOOD, 'k-');
plot(lambda, RW_1_WOOD, 'k-.');
plot(lambda, T_1_WOOD, 'm-.');
plot(lambda, TS_1_WOOD, 'g-.');
ylim([0 1.2]);xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('1ML Blood and Confusors on WOOD', 'FontSize', 16);
legend('Wood','Blood','Aloe Vera Drink', 'Cola', 'Coffee', 'Ketchup', 'Orange Juice', 'Plum Drink', 'Red Wine', 'Tea', 'Tomato Sauce');

figure('color', 'w');
plot(lambda, blood_1_WOOD-WOOD);
xlim([350 2500]);
xlabel('Wavelength(nm)', 'FontSize',14);ylabel('Reflectance', 'FontSize', 14);
title('1ML Blood on Wood Reflectance - wood Reflectance', 'FontSize', 16);


%% Index 1
%%%%%%%%%  BLOOD INDEX VISUALLY PLOT   %%%%%%%%%%%%%%%
%%%%%%%%% index 1 = (950-1200)/(950+1200), index2 = (950-1280)/(950+1280)
%%%%%%%%%   

%%%%%%%%%%%%%%%The effect of Using IFs %%%%%%%%%%%%%
%%%%%%%%%%%950 nm Blue shift


%%%%%%%%%%%%%%%%%%%%% 4ML Petri Dish   %%%%%%%%%%%%%%
%%% Petri dish
INDEX1_BLD_4_P = (blood_4_av(601)-blood_4_av(851))/(blood_4_av(601)+blood_4_av(851));
INDEX1_AVD_4_P = (AVD_4_P_av(601)-AVD_4_P_av(851))/(AVD_4_P_av(601)+AVD_4_P_av(851));
INDEX1_CO_4_P = (CO_4_P_av(601)-CO_4_P_av(851))/(CO_4_P_av(601)+CO_4_P_av(851));
INDEX1_COF_4_P = (COF_4_P_av(601)-COF_4_P_av(851))/(COF_4_P_av(601)+COF_4_P_av(851));
INDEX1_K_4_P = (K_4_P_av(601)-K_4_P_av(851))/(K_4_P_av(601)+K_4_P_av(851));
INDEX1_OJ_4_P = (OJ_4_P_av(601)-OJ_4_P_av(851))/(OJ_4_P_av(601)+OJ_4_P_av(851));
INDEX1_PD_4_P = (PD_4_P_av(601)-PD_4_P_av(851))/(PD_4_P_av(601)+PD_4_P_av(851));
INDEX1_RW_4_P = (RW_4_P_av(601)-RW_4_P_av(851))/(RW_4_P_av(601)+RW_4_P_av(851));
INDEX1_T_4_P = (T_4_P_av(601)-T_4_P_av(851))/(T_4_P_av(601)+T_4_P_av(851));
INDEX1_TS_4_P = (TS_4_P_av(601)-TS_4_P_av(851))/(TS_4_P_av(601)+TS_4_P_av(851));
%INDEX1_PETRI4 = [INDEX1_AVD4_P INDEX1_CS4_P INDEX1_C4_P INDEX1_K4_P INDEX1_OJ4_P INDEX1_PD4_P INDEX1_RW4_P INDEX1_T4_P INDEX1_TS4_P];
figure('color', 'w'); hold on;
plot(10.5, -0.6:0.005:1, 'k-');
plot(20.5, -0.6:0.005:1, 'k-');
plot(30.5, -0.6:0.005:1, 'k-');
plot(40.5, -0.6:0.005:1, 'k-');
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
%plot(270.5, -0.6:0.005:1, 'k-');
%plot(280.5, -0.6:0.005:1, 'k-');
%plot(290.5, -0.6:0.005:1, 'k-');



title('Blood Separation from Liquid Confusors', 'FontSize', 16); xlabel('Samples Representation', 'FontSize', 14);ylabel('Index 1', 'FontSize', 14);
xlim([0 261]);
%ylim = ([-0.6 1]);
%LINESTYLE = {'G*','B*','M*', 'C*', 'Y*', 'K*', rgb('orange'),rgb('DarkRed'), rgb('')};

h(10)=scatter(1, INDEX1_BLD_4_P, 'r', 'filled');

h(1) = plot(2, INDEX1_AVD_4_P, '*');
h(2) = plot(3, INDEX1_CO_4_P, '*');
h(3) = plot(4, INDEX1_COF_4_P, '*');
h(4) = plot(5, INDEX1_K_4_P, '*');
h(5) = plot(6, INDEX1_OJ_4_P, '*');
h(6) = plot(7, INDEX1_PD_4_P, '*');
h(7) = plot(8, INDEX1_RW_4_P, '*');
h(8) = plot(9, INDEX1_T_4_P, '*');
h(9) = plot(10, INDEX1_TS_4_P, '*');

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


%%%%%%%%%%%%%%%%%%%%% 10ML Petri Dish   %%%%%%%%%%%%%%
%%% Petri dish
INDEX1_BLD_10_P = (blood_10_av(601)-blood_10_av(851))/(blood_10_av(601)+blood_10_av(851));
INDEX1_AVD_10_P = (AVD_10_P_av(601)-AVD_10_P_av(851))/(AVD_10_P_av(601)+AVD_10_P_av(851));
INDEX1_CO_10_P = (CO_10_P_av(601)-CO_10_P_av(851))/(CO_10_P_av(601)+CO_10_P_av(851));
INDEX1_COF_10_P = (COF_10_P_av(601)-COF_10_P_av(851))/(COF_10_P_av(601)+COF_10_P_av(851));
INDEX1_K_10_P = (K_10_P_av(601)-K_10_P_av(851))/(K_10_P_av(601)+K_10_P_av(851));
INDEX1_OJ_10_P = (OJ_10_P_av(601)-OJ_10_P_av(851))/(OJ_10_P_av(601)+OJ_10_P_av(851));
INDEX1_PD_10_P = (PD_10_P_av(601)-PD_10_P_av(851))/(PD_10_P_av(601)+PD_10_P_av(851));
INDEX1_RW_10_P = (RW_10_P_av(601)-RW_10_P_av(851))/(RW_10_P_av(601)+RW_10_P_av(851));
INDEX1_T_10_P = (T_10_P_av(601)-T_10_P_av(851))/(T_10_P_av(601)+T_10_P_av(851));
INDEX1_TS_10_P = (TS_10_P_av(601)-TS_10_P_av(851))/(TS_10_P_av(601)+TS_10_P_av(851));
%INDEX1_PETRI4 = [INDEX1_AVD4_P INDEX1_CS4_P INDEX1_C4_P INDEX1_K4_P INDEX1_OJ4_P INDEX1_PD4_P INDEX1_RW4_P INDEX1_T4_P INDEX1_TS4_P];



h(10)=scatter(11, INDEX1_BLD_10_P, 'r', 'filled');

h(1) = plot(12, INDEX1_AVD_10_P, '*');
h(2) = plot(13, INDEX1_CO_10_P, '*');
h(3) = plot(14, INDEX1_COF_10_P, '*');
h(4) = plot(15, INDEX1_K_10_P, '*');
h(5) = plot(16, INDEX1_OJ_10_P, '*');
h(6) = plot(17, INDEX1_PD_10_P, '*');
h(7) = plot(18, INDEX1_RW_10_P, '*');
h(8) = plot(19, INDEX1_T_10_P, '*');
h(9) = plot(20, INDEX1_TS_10_P, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);




%%%%%%%%%%%%%%%%%%%     18ML Petri Dish    %%%%%%%%%%%%%%%%%%%%%
INDEX1_BLD_18_P = (blood_18_av(601)-blood_18_av(851))/(blood_18_av(601)+blood_18_av(851));
INDEX1_AVD_18_P = (AVD_18_P_av(601)-AVD_18_P_av(851))/(AVD_18_P_av(601)+AVD_18_P_av(851));
INDEX1_CO_18_P = (CO_18_P_av(601)-CO_18_P_av(851))/(CO_18_P_av(601)+CO_18_P_av(851));
INDEX1_COF_18_P = (COF_18_P_av(601)-COF_18_P_av(851))/(COF_18_P_av(601)+COF_18_P_av(851));
INDEX1_K_18_P = (K_18_P_av(601)-K_18_P_av(851))/(K_18_P_av(601)+K_18_P_av(851));
INDEX1_OJ_18_P = (OJ_18_P_av(601)-OJ_18_P_av(851))/(OJ_18_P_av(601)+OJ_18_P_av(851));
INDEX1_PD_18_P = (PD_18_P_av(601)-PD_18_P_av(851))/(PD_18_P_av(601)+PD_18_P_av(851));
INDEX1_RW_18_P = (RW_18_P_av(601)-RW_18_P_av(851))/(RW_18_P_av(601)+RW_18_P_av(851));
INDEX1_T_18_P = (T_18_P_av(601)-T_18_P_av(851))/(T_18_P_av(601)+T_18_P_av(851));
INDEX1_TS_18_P = (TS_18_P_av(601)-TS_18_P_av(851))/(TS_18_P_av(601)+TS_18_P_av(851));
%INDEX1_PETRI18 = [INDEX1_AVD18_P INDEX1_CS18_P INDEX1_C18_P INDEX1_K18_P INDEX1_OJ18_P INDEX1_PD18_P INDEX1_RW18_P INDEX1_T18_P INDEX1_TS18_P];

%plot(12:20, INDEX1_PETRI18, 'B*');
scatter(21, INDEX1_BLD_18_P, 'r', 'filled');

h(1) = plot(22, INDEX1_AVD_18_P, '*');
h(2) = plot(23, INDEX1_CO_18_P, '*');
h(3) = plot(24, INDEX1_COF_18_P, '*');
h(4) = plot(25, INDEX1_K_18_P, '*');
h(5) = plot(26, INDEX1_OJ_18_P, '*');
h(6) = plot(27, INDEX1_PD_18_P, '*');
h(7) = plot(28, INDEX1_RW_18_P, '*');
h(8) = plot(29, INDEX1_T_18_P, '*');
h(9) = plot(30, INDEX1_TS_18_P, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


%%%%%%%%%%%%%%%%%%%     30ML Petri Dish    %%%%%%%%%%%%%%%%%%%%%
INDEX1_BLD_30_P = (blood_30_av(601)-blood_30_av(851))/(blood_30_av(601)+blood_30_av(851));
INDEX1_AVD_30_P = (AVD_30_P_av(601)-AVD_30_P_av(851))/(AVD_30_P_av(601)+AVD_30_P_av(851));
INDEX1_CO_30_P = (CO_30_P_av(601)-CO_30_P_av(851))/(CO_30_P_av(601)+CO_30_P_av(851));
INDEX1_COF_30_P = (COF_30_P_av(601)-COF_30_P_av(851))/(COF_30_P_av(601)+COF_30_P_av(851));
INDEX1_K_30_P = (K_30_P_av(601)-K_30_P_av(851))/(K_30_P_av(601)+K_30_P_av(851));
INDEX1_OJ_30_P = (OJ_30_P_av(601)-OJ_30_P_av(851))/(OJ_30_P_av(601)+OJ_30_P_av(851));
INDEX1_PD_30_P = (PD_30_P_av(601)-PD_30_P_av(851))/(PD_30_P_av(601)+PD_30_P_av(851));
INDEX1_RW_30_P = (RW_30_P_av(601)-RW_30_P_av(851))/(RW_30_P_av(601)+RW_30_P_av(851));
INDEX1_T_30_P = (T_30_P_av(601)-T_30_P_av(851))/(T_30_P_av(601)+T_30_P_av(851));
INDEX1_TS_30_P = (TS_30_P_av(601)-TS_30_P_av(851))/(TS_30_P_av(601)+TS_30_P_av(851));
%INDEX1_PETRI30 = [INDEX1_AVD30_P INDEX1_CO30_P INDEX1_C30_P INDEX1_K30_P INDEX1_OJ30_P INDEX1_PD30_P INDEX1_RW30_P INDEX1_T30_P INDEX1_TS30_P];

%plot(22:30, INDEX1_PETRI30, 'B*');
scatter(31, INDEX1_BLD_30_P, 'r', 'filled');


h(1) = plot(32, INDEX1_AVD_30_P, '*');
h(2) = plot(33, INDEX1_CO_30_P, '*');
h(3) = plot(34, INDEX1_COF_30_P, '*');
h(4) = plot(35, INDEX1_K_30_P, '*');
h(5) = plot(36, INDEX1_OJ_30_P, '*');
h(6) = plot(37, INDEX1_PD_30_P, '*');
h(7) = plot(38, INDEX1_RW_30_P, '*');
h(8) = plot(39, INDEX1_T_30_P, '*');
h(9) = plot(40, INDEX1_TS_30_P, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

%%%%%%%%%%%%%%%%%%%     40ML Petri Dish    %%%%%%%%%%%%%%%%%%%%%
INDEX1_BLD_40_P = (blood_40_av(601)-blood_40_av(851))/(blood_40_av(601)+blood_40_av(851));
INDEX1_AVD_40_P = (AVD_40_P_av(601)-AVD_40_P_av(851))/(AVD_40_P_av(601)+AVD_40_P_av(851));
INDEX1_CO_40_P = (CO_40_P_av(601)-CO_40_P_av(851))/(CO_40_P_av(601)+CO_40_P_av(851));
INDEX1_COF_40_P = (COF_40_P_av(601)-COF_40_P_av(851))/(COF_40_P_av(601)+COF_40_P_av(851));
INDEX1_K_40_P = (K_40_P_av(601)-K_40_P_av(851))/(K_40_P_av(601)+K_40_P_av(851));
INDEX1_OJ_40_P = (OJ_40_P_av(601)-OJ_40_P_av(851))/(OJ_40_P_av(601)+OJ_40_P_av(851));
INDEX1_PD_40_P = (PD_40_P_av(601)-PD_40_P_av(851))/(PD_40_P_av(601)+PD_40_P_av(851));
INDEX1_RW_40_P = (RW_40_P_av(601)-RW_40_P_av(851))/(RW_40_P_av(601)+RW_40_P_av(851));
INDEX1_T_40_P = (T_40_P_av(601)-T_40_P_av(851))/(T_40_P_av(601)+T_40_P_av(851));
INDEX1_TS_40_P = (TS_40_P_av(601)-TS_40_P_av(851))/(TS_40_P_av(601)+TS_40_P_av(851));
%INDEX1_PETRI40 = [INDEX1_AVD40_P INDEX1_CO40_P INDEX1_C40_P INDEX1_K40_P INDEX1_OJ40_P INDEX1_PD40_P INDEX1_RW40_P INDEX1_T40_P INDEX1_TS40_P];

%plot(32:40, INDEX1_PETRI40, 'B*');
scatter(41, INDEX1_BLD_40_P, 'r', 'filled');

h(1) = plot(42, INDEX1_AVD_40_P, '*');
h(2) = plot(43, INDEX1_CO_40_P, '*');
h(3) = plot(44, INDEX1_COF_40_P, '*');
h(4) = plot(45, INDEX1_K_40_P, '*');
h(5) = plot(46, INDEX1_OJ_40_P, '*');
h(6) = plot(47, INDEX1_PD_40_P, '*');
h(7) = plot(48, INDEX1_RW_40_P, '*');
h(8) = plot(49, INDEX1_T_40_P, '*');
h(9) = plot(50, INDEX1_TS_40_P, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


%%%%%%%%%%%%%%%%%   Black Felt   %%%%%%%%%%%%%%%%%%%%
INDEX1_blood_4_BLKF = (blood_4_BLKF(601)-blood_4_BLKF(851))/(blood_4_BLKF(601)+blood_4_BLKF(851));
INDEX1_AVD_4_BLKF = (AVD_4_BLKF(601)-AVD_4_BLKF(851))/(AVD_4_BLKF(601)+AVD_4_BLKF(851));
INDEX1_CO_4_BLKF = (CO_4_BLKF(601)-CO_4_BLKF(851))/(CO_4_BLKF(601)+CO_4_BLKF(851));
INDEX1_COF_4_BLKF = (COF_4_BLKF(601)-COF_4_BLKF(851))/(COF_4_BLKF(601)+COF_4_BLKF(851));
INDEX1_K_4_BLKF = (K_4_BLKF(601)-K_4_BLKF(851))/(K_4_BLKF(601)+K_4_BLKF(851));
INDEX1_OJ_4_BLKF = (OJ_4_BLKF(601)-OJ_4_BLKF(851))/(OJ_4_BLKF(601)+OJ_4_BLKF(851));
INDEX1_PD_4_BLKF = (PD_4_BLKF(601)-PD_4_BLKF(851))/(PD_4_BLKF(601)+PD_4_BLKF(851));
INDEX1_RW_4_BLKF = (RW_4_BLKF(601)-RW_4_BLKF(851))/(RW_4_BLKF(601)+RW_4_BLKF(851));
INDEX1_T_4_BLKF = (T_4_BLKF(601)-T_4_BLKF(851))/(T_4_BLKF(601)+T_4_BLKF(851));
INDEX1_TS_4_BLKF = (TS_4_BLKF(601)-TS_4_BLKF(851))/(TS_4_BLKF(601)+TS_4_BLKF(851));%INDEX1_TS2_BLKF = (TS2_BLKF(601)-TS2_BLKF(851))/(TS2_BLKF(601)+TS2_BLKF(851));
%INDEX1_BLKF4 = [INDEX1_AVD4_BLKF INDEX1_CS4_BLKF INDEX1_C4_BLKF INDEX1_K4_BLKF INDEX1_OJ4_BLKF INDEX1_PD4_BLKF INDEX1_RW4_BLKF INDEX1_T4_BLKF  INDEX1_TS4_BLKF];
%plot(42:50, INDEX1_BLKF4, 'b*');
scatter(51, INDEX1_blood_4_BLKF, 'r', 'filled');

h(1) = plot(52, INDEX1_AVD_4_BLKF, '*');
h(2) = plot(53, INDEX1_CO_4_BLKF, '*');
h(3) = plot(54, INDEX1_COF_4_BLKF, '*');
h(4) = plot(55, INDEX1_K_4_BLKF, '*');
h(5) = plot(56, INDEX1_OJ_4_BLKF, '*');
h(6) = plot(57, INDEX1_PD_4_BLKF, '*');
h(7) = plot(58, INDEX1_RW_4_BLKF, '*');
h(8) = plot(59, INDEX1_T_4_BLKF, '*');
h(9) = plot(60, INDEX1_TS_4_BLKF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

%{
INDEX1_blood_8_BLKF = (blood_8_BLKF(601)-blood_8_BLKF(851))/(blood_8_BLKF(601)+blood_8_BLKF(851));
INDEX1_AVD8_BLKF = (AVD8_BLKF(601)-AVD8_BLKF(851))/(AVD8_BLKF(601)+AVD8_BLKF(851));
INDEX1_CS8_BLKF = (CS8_BLKF(601)-CS8_BLKF(851))/(CS8_BLKF(601)+CS8_BLKF(851));
INDEX1_C8_BLKF = (C8_BLKF(601)-C8_BLKF(851))/(C8_BLKF(601)+C8_BLKF(851));
INDEX1_K8_BLKF = (K8_BLKF(601)-K8_BLKF(851))/(K8_BLKF(601)+K8_BLKF(851));
INDEX1_OJ8_BLKF = (OJ8_BLKF(601)-OJ8_BLKF(851))/(OJ8_BLKF(601)+OJ8_BLKF(851));
INDEX1_PD8_BLKF = (PD8_BLKF(601)-PD8_BLKF(851))/(PD8_BLKF(601)+PD8_BLKF(851));
INDEX1_RW8_BLKF = (RW8_BLKF(601)-RW8_BLKF(851))/(RW8_BLKF(601)+RW8_BLKF(851));
INDEX1_T8_BLKF = (T8_BLKF(601)-T8_BLKF(851))/(T8_BLKF(601)+T8_BLKF(851));
%INDEX1_TS4_BLKF = (TS4_BLKF(601)-TS4_BLKF(851))/(TS4_BLKF(601)+TS4_BLKF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(61, INDEX1_blood_8_BLKF, 'r', 'filled');

h(1) = plot(62, INDEX1_AVD8_BLKF, '*');
h(2) = plot(63, INDEX1_CS8_BLKF, '*');
h(3) = plot(64, INDEX1_C8_BLKF, '*');
h(4) = plot(65, INDEX1_K8_BLKF, '*');
h(5) = plot(66, INDEX1_OJ8_BLKF, '*');
h(6) = plot(67, INDEX1_PD8_BLKF, '*');
h(7) = plot(68, INDEX1_RW8_BLKF, '*');
h(8) = plot(69, INDEX1_T8_BLKF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
%set(h(9), 'color', [0.5 0.8 1]);
%}
%%%%%% 10ML %%
INDEX1_blood_10_BLKF = (blood_10_BLKF(601)-blood_10_BLKF(851))/(blood_10_BLKF(601)+blood_10_BLKF(851));
INDEX1_AVD_10_BLKF = (AVD_10_BLKF(601)-AVD_10_BLKF(851))/(AVD_10_BLKF(601)+AVD_10_BLKF(851));
INDEX1_CO_10_BLKF = (CO_10_BLKF(601)-CO_10_BLKF(851))/(CO_10_BLKF(601)+CO_10_BLKF(851));
INDEX1_COF_10_BLKF = (COF_10_BLKF(601)-COF_10_BLKF(851))/(COF_10_BLKF(601)+COF_10_BLKF(851));
INDEX1_K_10_BLKF = (K_10_BLKF(601)-K_10_BLKF(851))/(K_10_BLKF(601)+K_10_BLKF(851));
INDEX1_OJ_10_BLKF = (OJ_10_BLKF(601)-OJ_10_BLKF(851))/(OJ_10_BLKF(601)+OJ_10_BLKF(851));
INDEX1_PD_10_BLKF = (PD_10_BLKF(601)-PD_10_BLKF(851))/(PD_10_BLKF(601)+PD_10_BLKF(851));
INDEX1_RW_10_BLKF = (RW_10_BLKF(601)-RW_10_BLKF(851))/(RW_10_BLKF(601)+RW_10_BLKF(851));
INDEX1_T_10_BLKF = (T_10_BLKF(601)-T_10_BLKF(851))/(T_10_BLKF(601)+T_10_BLKF(851));
INDEX1_TS_10_BLKF = (TS_10_BLKF(601)-TS_10_BLKF(851))/(TS_10_BLKF(601)+TS_10_BLKF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(61, INDEX1_blood_10_BLKF, 'r', 'filled');

h(1) = plot(62, INDEX1_AVD_10_BLKF, '*');
h(2) = plot(63, INDEX1_CO_10_BLKF, '*');
h(3) = plot(64, INDEX1_COF_10_BLKF, '*');
h(4) = plot(65, INDEX1_K_10_BLKF, '*');
h(5) = plot(66, INDEX1_OJ_10_BLKF, '*');
h(6) = plot(67, INDEX1_PD_10_BLKF, '*');
h(7) = plot(68, INDEX1_RW_10_BLKF, '*');
h(8) = plot(69, INDEX1_T_10_BLKF, '*');
h(9) = plot(70, INDEX1_TS_10_BLKF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

%%%%%% 18ML %%
INDEX1_blood_18_BLKF = (blood_18_BLKF(601)-blood_18_BLKF(851))/(blood_18_BLKF(601)+blood_18_BLKF(851));
INDEX1_AVD_18_BLKF = (AVD_18_BLKF(601)-AVD_18_BLKF(851))/(AVD_18_BLKF(601)+AVD_18_BLKF(851));
INDEX1_CO_18_BLKF = (CO_18_BLKF(601)-CO_18_BLKF(851))/(CO_18_BLKF(601)+CO_18_BLKF(851));
INDEX1_COF_18_BLKF = (COF_18_BLKF(601)-COF_18_BLKF(851))/(COF_18_BLKF(601)+COF_18_BLKF(851));
INDEX1_K_18_BLKF = (K_18_BLKF(601)-K_18_BLKF(851))/(K_18_BLKF(601)+K_18_BLKF(851));
INDEX1_OJ_18_BLKF = (OJ_18_BLKF(601)-OJ_18_BLKF(851))/(OJ_18_BLKF(601)+OJ_18_BLKF(851));
INDEX1_PD_18_BLKF = (PD_18_BLKF(601)-PD_18_BLKF(851))/(PD_18_BLKF(601)+PD_18_BLKF(851));
INDEX1_RW_18_BLKF = (RW_18_BLKF(601)-RW_18_BLKF(851))/(RW_18_BLKF(601)+RW_18_BLKF(851));
INDEX1_T_18_BLKF = (T_18_BLKF(601)-T_18_BLKF(851))/(T_18_BLKF(601)+T_18_BLKF(851));
INDEX1_TS_18_BLKF = (TS_18_BLKF(601)-TS_18_BLKF(851))/(TS_18_BLKF(601)+TS_18_BLKF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(71, INDEX1_blood_18_BLKF, 'r', 'filled');

h(1) = plot(72, INDEX1_AVD_18_BLKF, '*');
h(2) = plot(73, INDEX1_CO_18_BLKF, '*');
h(3) = plot(74, INDEX1_COF_18_BLKF, '*');
h(4) = plot(75, INDEX1_K_18_BLKF, '*');
h(5) = plot(76, INDEX1_OJ_18_BLKF, '*');
h(6) = plot(77, INDEX1_PD_18_BLKF, '*');
h(7) = plot(78, INDEX1_RW_18_BLKF, '*');
h(8) = plot(79, INDEX1_T_18_BLKF, '*');
h(9) = plot(80, INDEX1_TS_18_BLKF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


%%%%%% 30ML %%
INDEX1_blood_30_BLKF = (blood_30_BLKF(601)-blood_30_BLKF(851))/(blood_30_BLKF(601)+blood_30_BLKF(851));
INDEX1_AVD_30_BLKF = (AVD_30_BLKF(601)-AVD_30_BLKF(851))/(AVD_30_BLKF(601)+AVD_30_BLKF(851));
INDEX1_CO_30_BLKF = (CO_30_BLKF(601)-CO_30_BLKF(851))/(CO_30_BLKF(601)+CO_30_BLKF(851));
INDEX1_COF_30_BLKF = (COF_30_BLKF(601)-COF_30_BLKF(851))/(COF_30_BLKF(601)+COF_30_BLKF(851));
INDEX1_K_30_BLKF = (K_30_BLKF(601)-K_30_BLKF(851))/(K_30_BLKF(601)+K_30_BLKF(851));
INDEX1_OJ_30_BLKF = (OJ_30_BLKF(601)-OJ_30_BLKF(851))/(OJ_30_BLKF(601)+OJ_30_BLKF(851));
INDEX1_PD_30_BLKF = (PD_30_BLKF(601)-PD_30_BLKF(851))/(PD_30_BLKF(601)+PD_30_BLKF(851));
INDEX1_RW_30_BLKF = (RW_30_BLKF(601)-RW_30_BLKF(851))/(RW_30_BLKF(601)+RW_30_BLKF(851));
INDEX1_T_30_BLKF = (T_30_BLKF(601)-T_30_BLKF(851))/(T_30_BLKF(601)+T_30_BLKF(851));
INDEX1_TS_30_BLKF = (TS_30_BLKF(601)-TS_30_BLKF(851))/(TS_30_BLKF(601)+TS_30_BLKF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(81, INDEX1_blood_30_BLKF, 'r', 'filled');

h(1) = plot(82, INDEX1_AVD_30_BLKF, '*');
h(2) = plot(83, INDEX1_CO_30_BLKF, '*');
h(3) = plot(84, INDEX1_COF_30_BLKF, '*');
h(4) = plot(85, INDEX1_K_30_BLKF, '*');
h(5) = plot(86, INDEX1_OJ_30_BLKF, '*');
h(6) = plot(87, INDEX1_PD_30_BLKF, '*');
h(7) = plot(88, INDEX1_RW_30_BLKF, '*');
h(8) = plot(89, INDEX1_T_30_BLKF, '*');
h(9) = plot(90, INDEX1_TS_30_BLKF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);



%%%%%% 40ML %%
INDEX1_blood_40_BLKF = (blood_40_BLKF(601)-blood_40_BLKF(851))/(blood_40_BLKF(601)+blood_40_BLKF(851));
INDEX1_AVD_40_BLKF = (AVD_40_BLKF(601)-AVD_40_BLKF(851))/(AVD_40_BLKF(601)+AVD_40_BLKF(851));
INDEX1_CO_40_BLKF = (CO_40_BLKF(601)-CO_40_BLKF(851))/(CO_40_BLKF(601)+CO_40_BLKF(851));
INDEX1_COF_40_BLKF = (COF_40_BLKF(601)-COF_40_BLKF(851))/(COF_40_BLKF(601)+COF_40_BLKF(851));
INDEX1_K_40_BLKF = (K_40_BLKF(601)-K_40_BLKF(851))/(K_40_BLKF(601)+K_40_BLKF(851));
INDEX1_OJ_40_BLKF = (OJ_40_BLKF(601)-OJ_40_BLKF(851))/(OJ_40_BLKF(601)+OJ_40_BLKF(851));
INDEX1_PD_40_BLKF = (PD_40_BLKF(601)-PD_40_BLKF(851))/(PD_40_BLKF(601)+PD_40_BLKF(851));
INDEX1_RW_40_BLKF = (RW_40_BLKF(601)-RW_40_BLKF(851))/(RW_40_BLKF(601)+RW_40_BLKF(851));
INDEX1_T_40_BLKF = (T_40_BLKF(601)-T_40_BLKF(851))/(T_40_BLKF(601)+T_40_BLKF(851));
INDEX1_TS_40_BLKF = (TS_40_BLKF(601)-TS_40_BLKF(851))/(TS_40_BLKF(601)+TS_40_BLKF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(91, INDEX1_blood_40_BLKF, 'r', 'filled');

h(1) = plot(92, INDEX1_AVD_40_BLKF, '*');
h(2) = plot(93, INDEX1_CO_40_BLKF, '*');
h(3) = plot(94, INDEX1_COF_40_BLKF, '*');
h(4) = plot(95, INDEX1_K_40_BLKF, '*');
h(5) = plot(96, INDEX1_OJ_40_BLKF, '*');
h(6) = plot(97, INDEX1_PD_40_BLKF, '*');
h(7) = plot(98, INDEX1_RW_40_BLKF, '*');
h(8) = plot(99, INDEX1_T_40_BLKF, '*');
h(9) = plot(100, INDEX1_TS_40_BLKF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);



%%%%%%%%%%%%%%%%%   GREY Felt   %%%%%%%%%%%%%%%%%%%%
INDEX1_blood_4_GRYF = (blood_4_GRYF(601)-blood_4_GRYF(851))/(blood_4_GRYF(601)+blood_4_GRYF(851));
INDEX1_AVD_4_GRYF = (AVD_4_GRYF(601)-AVD_4_GRYF(851))/(AVD_4_GRYF(601)+AVD_4_GRYF(851));
INDEX1_CO_4_GRYF = (CO_4_GRYF(601)-CO_4_GRYF(851))/(CO_4_GRYF(601)+CO_4_GRYF(851));
INDEX1_COF_4_GRYF = (COF_4_GRYF(601)-COF_4_GRYF(851))/(COF_4_GRYF(601)+COF_4_GRYF(851));
INDEX1_K_4_GRYF = (K_4_GRYF(601)-K_4_GRYF(851))/(K_4_GRYF(601)+K_4_GRYF(851));
INDEX1_OJ_4_GRYF = (OJ_4_GRYF(601)-OJ_4_GRYF(851))/(OJ_4_GRYF(601)+OJ_4_GRYF(851));
INDEX1_PD_4_GRYF = (PD_4_GRYF(601)-PD_4_GRYF(851))/(PD_4_GRYF(601)+PD_4_GRYF(851));
INDEX1_RW_4_GRYF = (RW_4_GRYF(601)-RW_4_GRYF(851))/(RW_4_GRYF(601)+RW_4_GRYF(851));
INDEX1_T_4_GRYF = (T_4_GRYF(601)-T_4_GRYF(851))/(T_4_GRYF(601)+T_4_GRYF(851));
INDEX1_TS_4_GRYF = (TS_4_GRYF(601)-TS_4_GRYF(851))/(TS_4_GRYF(601)+TS_4_GRYF(851)); %INDEX1_TS2_GRYF = (TS2_GRYF(601)-TS2_GRYF(851))/(TS2_GRYF(601)+TS2_GRYF(851));
%INDEX1_GRYF4 = [INDEX1_AVD4_GRYF INDEX1_CS4_GRYF INDEX1_C4_GRYF INDEX1_OJ4_GRYF INDEX1_PD4_GRYF INDEX1_RW4_GRYF INDEX1_T4_GRYF INDEX1_TS4_GRYF];
%plot(62:69, INDEX1_GRYF4, 'B*');
scatter(101, INDEX1_blood_4_GRYF, 'r', 'filled');

h(1) = plot(102, INDEX1_AVD_4_GRYF, '*');
h(2) = plot(103, INDEX1_CO_4_GRYF, '*');
h(3) = plot(104, INDEX1_COF_4_GRYF, '*');
h(4) = plot(105, INDEX1_K_4_GRYF, '*');
h(5) = plot(106, INDEX1_OJ_4_GRYF, '*');
h(6) = plot(107, INDEX1_PD_4_GRYF, '*');
h(7) = plot(108, INDEX1_RW_4_GRYF, '*');
h(8) = plot(109, INDEX1_T_4_GRYF, '*');
h(9) = plot(110, INDEX1_TS_4_GRYF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);




%{
INDEX1_blood_8_GRYF = (blood_8_GRYF(601)-blood_8_GRYF(851))/(blood_8_GRYF(601)+blood_8_GRYF(851));
INDEX1_AVD8_GRYF = (AVD8_GRYF(601)-AVD8_GRYF(851))/(AVD8_GRYF(601)+AVD8_GRYF(851));
INDEX1_CS8_GRYF = (CS8_GRYF(601)-CS8_GRYF(851))/(CS8_GRYF(601)+CS8_GRYF(851));
INDEX1_C8_GRYF = (C8_GRYF(601)-C8_GRYF(851))/(C8_GRYF(601)+C8_GRYF(851));
INDEX1_OJ8_GRYF = (OJ8_GRYF(601)-OJ8_GRYF(851))/(OJ8_GRYF(601)+OJ8_GRYF(851));
INDEX1_PD8_GRYF = (PD8_GRYF(601)-PD8_GRYF(851))/(PD8_GRYF(601)+PD8_GRYF(851));
INDEX1_RW8_GRYF = (RW8_GRYF(601)-RW8_GRYF(851))/(RW8_GRYF(601)+RW8_GRYF(851));
INDEX1_T8_GRYF = (T8_GRYF(601)-T8_GRYF(851))/(T8_GRYF(601)+T8_GRYF(851));
%INDEX1_GRYF8 = [INDEX1_AVD8_GRYF INDEX1_CS8_GRYF INDEX1_C8_GRYF INDEX1_OJ8_GRYF INDEX1_PD8_GRYF INDEX1_RW8_GRYF INDEX1_T8_GRYF];
%plot(72:78, INDEX1_GRYF8, 'B*');
scatter(121, INDEX1_blood_8_GRYF, 'r', 'filled');

h(1) = plot(122, INDEX1_AVD8_GRYF, '*');
h(2) = plot(123, INDEX1_CS8_GRYF, '*');
h(3) = plot(124, INDEX1_C8_GRYF, '*');

h(5) = plot(126, INDEX1_OJ8_GRYF, '*');
h(6) = plot(127, INDEX1_PD8_GRYF, '*');
h(7) = plot(128, INDEX1_RW8_GRYF, '*');
h(8) = plot(129, INDEX1_T8_GRYF, '*');
%h(9) = plot(80, INDEX1_TS4_BLKF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
%set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
%set(h(9), 'color', [0.5 0.8 1]);
%}

%%%%%% 10ML %%
INDEX1_blood_10_GRYF = (blood_10_GRYF(601)-blood_10_GRYF(851))/(blood_10_GRYF(601)+blood_10_GRYF(851));
INDEX1_AVD_10_GRYF = (AVD_10_GRYF(601)-AVD_10_GRYF(851))/(AVD_10_GRYF(601)+AVD_10_GRYF(851));
INDEX1_CO_10_GRYF = (CO_10_GRYF(601)-CO_10_GRYF(851))/(CO_10_GRYF(601)+CO_10_GRYF(851));
INDEX1_COF_10_GRYF = (COF_10_GRYF(601)-COF_10_GRYF(851))/(COF_10_GRYF(601)+COF_10_GRYF(851));
INDEX1_K_10_GRYF = (K_10_GRYF(601)-K_10_GRYF(851))/(K_10_GRYF(601)+K_10_GRYF(851));
INDEX1_OJ_10_GRYF = (OJ_10_GRYF(601)-OJ_10_GRYF(851))/(OJ_10_GRYF(601)+OJ_10_GRYF(851));
INDEX1_PD_10_GRYF = (PD_10_GRYF(601)-PD_10_GRYF(851))/(PD_10_GRYF(601)+PD_10_GRYF(851));
INDEX1_RW_10_GRYF = (RW_10_GRYF(601)-RW_10_GRYF(851))/(RW_10_GRYF(601)+RW_10_GRYF(851));
INDEX1_T_10_GRYF = (T_10_GRYF(601)-T_10_GRYF(851))/(T_10_GRYF(601)+T_10_GRYF(851));
INDEX1_TS_10_GRYF = (TS_10_GRYF(601)-TS_10_GRYF(851))/(TS_10_GRYF(601)+TS_10_GRYF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(111, INDEX1_blood_10_GRYF, 'r', 'filled');

h(1) = plot(112, INDEX1_AVD_10_GRYF, '*');
h(2) = plot(113, INDEX1_CO_10_GRYF, '*');
h(3) = plot(114, INDEX1_COF_10_GRYF, '*');
h(4) = plot(115, INDEX1_K_10_GRYF, '*');
h(5) = plot(116, INDEX1_OJ_10_GRYF, '*');
h(6) = plot(117, INDEX1_PD_10_GRYF, '*');
h(7) = plot(118, INDEX1_RW_10_GRYF, '*');
h(8) = plot(119, INDEX1_T_10_GRYF, '*');
h(9) = plot(120, INDEX1_TS_10_GRYF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

%%%%%% 18ML %%
INDEX1_blood_18_GRYF = (blood_18_GRYF(601)-blood_18_GRYF(851))/(blood_18_GRYF(601)+blood_18_GRYF(851));
INDEX1_AVD_18_GRYF = (AVD_18_GRYF(601)-AVD_18_GRYF(851))/(AVD_18_GRYF(601)+AVD_18_GRYF(851));
INDEX1_CO_18_GRYF = (CO_18_GRYF(601)-CO_18_GRYF(851))/(CO_18_GRYF(601)+CO_18_GRYF(851));
INDEX1_COF_18_GRYF = (COF_18_GRYF(601)-COF_18_GRYF(851))/(COF_18_GRYF(601)+COF_18_GRYF(851));
INDEX1_K_18_GRYF = (K_18_GRYF(601)-K_18_GRYF(851))/(K_18_GRYF(601)+K_18_GRYF(851));
INDEX1_OJ_18_GRYF = (OJ_18_GRYF(601)-OJ_18_GRYF(851))/(OJ_18_GRYF(601)+OJ_18_GRYF(851));
INDEX1_PD_18_GRYF = (PD_18_GRYF(601)-PD_18_GRYF(851))/(PD_18_GRYF(601)+PD_18_GRYF(851));
INDEX1_RW_18_GRYF = (RW_18_GRYF(601)-RW_18_GRYF(851))/(RW_18_GRYF(601)+RW_18_GRYF(851));
INDEX1_T_18_GRYF = (T_18_GRYF(601)-T_18_GRYF(851))/(T_18_GRYF(601)+T_18_GRYF(851));
INDEX1_TS_18_GRYF = (TS_18_GRYF(601)-TS_18_GRYF(851))/(TS_18_GRYF(601)+TS_18_GRYF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(121, INDEX1_blood_18_GRYF, 'r', 'filled');

h(1) = plot(122, INDEX1_AVD_18_GRYF, '*');
h(2) = plot(123, INDEX1_CO_18_GRYF, '*');
h(3) = plot(124, INDEX1_COF_18_GRYF, '*');
h(4) = plot(125, INDEX1_K_18_GRYF, '*');
h(5) = plot(126, INDEX1_OJ_18_GRYF, '*');
h(6) = plot(127, INDEX1_PD_18_GRYF, '*');
h(7) = plot(128, INDEX1_RW_18_GRYF, '*');
h(8) = plot(129, INDEX1_T_18_GRYF, '*');
h(9) = plot(130, INDEX1_TS_18_GRYF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


%%%%%% 30ML %%
INDEX1_blood_30_GRYF = (blood_30_GRYF(601)-blood_30_GRYF(851))/(blood_30_GRYF(601)+blood_30_GRYF(851));
INDEX1_AVD_30_GRYF = (AVD_30_GRYF(601)-AVD_30_GRYF(851))/(AVD_30_GRYF(601)+AVD_30_GRYF(851));
INDEX1_CO_30_GRYF = (CO_30_GRYF(601)-CO_30_GRYF(851))/(CO_30_GRYF(601)+CO_30_GRYF(851));
INDEX1_COF_30_GRYF = (COF_30_GRYF(601)-COF_30_GRYF(851))/(COF_30_GRYF(601)+COF_30_GRYF(851));
INDEX1_K_30_GRYF = (K_30_GRYF(601)-K_30_GRYF(851))/(K_30_GRYF(601)+K_30_GRYF(851));
INDEX1_OJ_30_GRYF = (OJ_30_GRYF(601)-OJ_30_GRYF(851))/(OJ_30_GRYF(601)+OJ_30_GRYF(851));
INDEX1_PD_30_GRYF = (PD_30_GRYF(601)-PD_30_GRYF(851))/(PD_30_GRYF(601)+PD_30_GRYF(851));
INDEX1_RW_30_GRYF = (RW_30_GRYF(601)-RW_30_GRYF(851))/(RW_30_GRYF(601)+RW_30_GRYF(851));
INDEX1_T_30_GRYF = (T_30_GRYF(601)-T_30_GRYF(851))/(T_30_GRYF(601)+T_30_GRYF(851));
INDEX1_TS_30_GRYF = (TS_30_GRYF(601)-TS_30_GRYF(851))/(TS_30_GRYF(601)+TS_30_GRYF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(131, INDEX1_blood_30_GRYF, 'r', 'filled');

h(1) = plot(132, INDEX1_AVD_30_GRYF, '*');
h(2) = plot(133, INDEX1_CO_30_GRYF, '*');
h(3) = plot(134, INDEX1_COF_30_GRYF, '*');
h(4) = plot(135, INDEX1_K_30_GRYF, '*');
h(5) = plot(136, INDEX1_OJ_30_GRYF, '*');
h(6) = plot(137, INDEX1_PD_30_GRYF, '*');
h(7) = plot(138, INDEX1_RW_30_GRYF, '*');
h(8) = plot(139, INDEX1_T_30_GRYF, '*');
h(9) = plot(140, INDEX1_TS_30_GRYF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);



%%%%%% 40ML %%
INDEX1_blood_40_GRYF = (blood_40_GRYF(601)-blood_40_GRYF(851))/(blood_40_GRYF(601)+blood_40_GRYF(851));
INDEX1_AVD_40_GRYF = (AVD_40_GRYF(601)-AVD_40_GRYF(851))/(AVD_40_GRYF(601)+AVD_40_GRYF(851));
INDEX1_CO_40_GRYF = (CO_40_GRYF(601)-CO_40_GRYF(851))/(CO_40_GRYF(601)+CO_40_GRYF(851));
INDEX1_COF_40_GRYF = (COF_40_GRYF(601)-COF_40_GRYF(851))/(COF_40_GRYF(601)+COF_40_GRYF(851));
INDEX1_K_40_GRYF = (K_40_GRYF(601)-K_40_GRYF(851))/(K_40_GRYF(601)+K_40_GRYF(851));
INDEX1_OJ_40_GRYF = (OJ_40_GRYF(601)-OJ_40_GRYF(851))/(OJ_40_GRYF(601)+OJ_40_GRYF(851));
INDEX1_PD_40_GRYF = (PD_40_GRYF(601)-PD_40_GRYF(851))/(PD_40_GRYF(601)+PD_40_GRYF(851));
INDEX1_RW_40_GRYF = (RW_40_GRYF(601)-RW_40_GRYF(851))/(RW_40_GRYF(601)+RW_40_GRYF(851));
INDEX1_T_40_GRYF = (T_40_GRYF(601)-T_40_GRYF(851))/(T_40_GRYF(601)+T_40_GRYF(851));
INDEX1_TS_40_GRYF = (TS_40_GRYF(601)-TS_40_GRYF(851))/(TS_40_GRYF(601)+TS_40_GRYF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(141, INDEX1_blood_40_GRYF, 'r', 'filled');

h(1) = plot(142, INDEX1_AVD_40_GRYF, '*');
h(2) = plot(143, INDEX1_CO_40_GRYF, '*');
h(3) = plot(144, INDEX1_COF_40_GRYF, '*');
h(4) = plot(145, INDEX1_K_40_GRYF, '*');
h(5) = plot(146, INDEX1_OJ_40_GRYF, '*');
h(6) = plot(147, INDEX1_PD_40_GRYF, '*');
h(7) = plot(148, INDEX1_RW_40_GRYF, '*');
h(8) = plot(149, INDEX1_T_40_GRYF, '*');
h(9) = plot(150, INDEX1_TS_40_GRYF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);




%%%%%%%%%%%%%%%%%   GREEN Felt   %%%%%%%%%%%%%%%%%%%%
INDEX1_blood_4_GRNF = (blood_4_GRNF(601)-blood_4_GRNF(851))/(blood_4_GRNF(601)+blood_4_GRNF(851));
INDEX1_AVD_4_GRNF = (AVD_4_GRNF(601)-AVD_4_GRNF(851))/(AVD_4_GRNF(601)+AVD_4_GRNF(851));
INDEX1_CO_4_GRNF = (CO_4_GRNF(601)-CO_4_GRNF(851))/(CO_4_GRNF(601)+CO_4_GRNF(851));
INDEX1_COF_4_GRNF = (COF_4_GRNF(601)-COF_4_GRNF(851))/(COF_4_GRNF(601)+COF_4_GRNF(851));
INDEX1_K_4_GRNF = (K_4_GRNF(601)-K_4_GRNF(851))/(K_4_GRNF(601)+K_4_GRNF(851));
INDEX1_OJ_4_GRNF = (OJ_4_GRNF(601)-OJ_4_GRNF(851))/(OJ_4_GRNF(601)+OJ_4_GRNF(851));
INDEX1_PD_4_GRNF = (PD_4_GRNF(601)-PD_4_GRNF(851))/(PD_4_GRNF(601)+PD_4_GRNF(851));
INDEX1_RW_4_GRNF = (RW_4_GRNF(601)-RW_4_GRNF(851))/(RW_4_GRNF(601)+RW_4_GRNF(851));
INDEX1_T_4_GRNF = (T_4_GRNF(601)-T_4_GRNF(851))/(T_4_GRNF(601)+T_4_GRNF(851));
INDEX1_TS_4_GRNF = (TS_4_GRNF(601)-TS_4_GRNF(851))/(TS_4_GRNF(601)+TS_4_GRNF(851));%INDEX1_TS2_GRYF = (TS2_GRYF(601)-TS2_GRYF(851))/(TS2_GRYF(601)+TS2_GRYF(851));
%INDEX1_GRNF4 = [ INDEX1_AVD4_GRNF INDEX1_CS4_GRNF INDEX1_C4_GRNF INDEX1_OJ4_GRNF INDEX1_PD4_GRNF INDEX1_RW4_GRNF INDEX1_T4_GRNF INDEX1_TS4_GRNF];
%plot(82:89, INDEX1_GRYF4, 'B*');
scatter(151, INDEX1_blood_4_GRNF, 'r', 'filled');



h(1) = plot(152, INDEX1_AVD_4_GRNF, '*');
h(2) = plot(153, INDEX1_CO_4_GRNF, '*');
h(3) = plot(154, INDEX1_COF_4_GRNF, '*');
h(4) = plot(155, INDEX1_K_4_GRNF, '*');
h(5) = plot(156, INDEX1_OJ_4_GRNF, '*');
h(6) = plot(157, INDEX1_PD_4_GRNF, '*');
h(7) = plot(158, INDEX1_RW_4_GRNF, '*');
h(8) = plot(159, INDEX1_T_4_GRNF, '*');
h(9) = plot(160, INDEX1_TS_4_GRNF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

%{
INDEX1_blood_8_GRNF = (blood_8_GRNF(601)-blood_8_GRNF(851))/(blood_8_GRNF(601)+blood_8_GRNF(851));
INDEX1_AVD8_GRNF = (AVD8_GRNF(601)-AVD8_GRNF(851))/(AVD8_GRNF(601)+AVD8_GRNF(851));
INDEX1_CS8_GRNF = (CS8_GRNF(601)-CS8_GRNF(851))/(CS8_GRNF(601)+CS8_GRNF(851));
INDEX1_C8_GRNF = (C8_GRNF(601)-C8_GRNF(851))/(C8_GRNF(601)+C8_GRNF(851));
INDEX1_OJ8_GRNF = (OJ8_GRNF(601)-OJ8_GRNF(851))/(OJ8_GRNF(601)+OJ8_GRNF(851));
INDEX1_PD8_GRNF = (PD8_GRNF(601)-PD8_GRNF(851))/(PD8_GRNF(601)+PD8_GRNF(851));
INDEX1_RW8_GRNF = (RW8_GRNF(601)-RW8_GRNF(851))/(RW8_GRNF(601)+RW8_GRNF(851));
INDEX1_T8_GRNF = (T8_GRNF(601)-T8_GRNF(851))/(T8_GRNF(601)+T8_GRNF(851));
%INDEX1_GRNF8 = [ INDEX1_AVD8_GRNF INDEX1_CS8_GRNF INDEX1_C8_GRNF INDEX1_OJ8_GRNF INDEX1_PD8_GRNF INDEX1_RW8_GRNF INDEX1_T8_GRNF];
%plot(92:98, INDEX1_GRNF8, 'B*');
scatter(181, INDEX1_blood_8_GRNF, 'r', 'filled');


h(1) = plot(182, INDEX1_AVD8_GRNF, '*');
h(2) = plot(183, INDEX1_CS8_GRNF, '*');
h(3) = plot(184, INDEX1_C8_GRNF, '*');
%h(4) = plot(45, INDEX1_K4_BLKF, '*');
h(5) = plot(186, INDEX1_OJ8_GRNF, '*');
h(6) = plot(187, INDEX1_PD8_GRNF, '*');
h(7) = plot(188, INDEX1_RW8_GRNF, '*');
h(8) = plot(189, INDEX1_T8_GRNF, '*');
%h(9) = plot(100, INDEX1_TS8_GRNF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
%set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
%set(h(9), 'color', [0.5 0.8 1]);
%}

%%%%%% 10ML %%
INDEX1_blood_10_GRNF = (blood_10_GRNF(601)-blood_10_GRNF(851))/(blood_10_GRNF(601)+blood_10_GRNF(851));
INDEX1_AVD_10_GRNF = (AVD_10_GRNF(601)-AVD_10_GRNF(851))/(AVD_10_GRNF(601)+AVD_10_GRNF(851));
INDEX1_CO_10_GRNF = (CO_10_GRNF(601)-CO_10_GRNF(851))/(CO_10_GRNF(601)+CO_10_GRNF(851));
INDEX1_COF_10_GRNF = (COF_10_GRNF(601)-COF_10_GRNF(851))/(COF_10_GRNF(601)+COF_10_GRNF(851));
INDEX1_K_10_GRNF = (K_10_GRNF(601)-K_10_GRNF(851))/(K_10_GRNF(601)+K_10_GRNF(851));
INDEX1_OJ_10_GRNF = (OJ_10_GRNF(601)-OJ_10_GRNF(851))/(OJ_10_GRNF(601)+OJ_10_GRNF(851));
INDEX1_PD_10_GRNF = (PD_10_GRNF(601)-PD_10_GRNF(851))/(PD_10_GRNF(601)+PD_10_GRNF(851));
INDEX1_RW_10_GRNF = (RW_10_GRNF(601)-RW_10_GRNF(851))/(RW_10_GRNF(601)+RW_10_GRNF(851));
INDEX1_T_10_GRNF = (T_10_GRNF(601)-T_10_GRNF(851))/(T_10_GRNF(601)+T_10_GRNF(851));
INDEX1_TS_10_GRNF = (TS_10_GRNF(601)-TS_10_GRNF(851))/(TS_10_GRNF(601)+TS_10_GRNF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(161, INDEX1_blood_10_GRNF, 'r', 'filled');

h(1) = plot(162, INDEX1_AVD_10_GRNF, '*');
h(2) = plot(163, INDEX1_CO_10_GRNF, '*');
h(3) = plot(164, INDEX1_COF_10_GRNF, '*');
h(4) = plot(165, INDEX1_K_10_GRNF, '*');
h(5) = plot(166, INDEX1_OJ_10_GRNF, '*');
h(6) = plot(167, INDEX1_PD_10_GRNF, '*');
h(7) = plot(168, INDEX1_RW_10_GRNF, '*');
h(8) = plot(169, INDEX1_T_10_GRNF, '*');
h(9) = plot(170, INDEX1_TS_10_GRNF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

%%%%%% 18ML %%
INDEX1_blood_18_GRNF = (blood_18_GRNF(601)-blood_18_GRNF(851))/(blood_18_GRNF(601)+blood_18_GRNF(851));
INDEX1_AVD_18_GRNF = (AVD_18_GRNF(601)-AVD_18_GRNF(851))/(AVD_18_GRNF(601)+AVD_18_GRNF(851));
INDEX1_CO_18_GRNF = (CO_18_GRNF(601)-CO_18_GRNF(851))/(CO_18_GRNF(601)+CO_18_GRNF(851));
INDEX1_COF_18_GRNF = (COF_18_GRNF(601)-COF_18_GRNF(851))/(COF_18_GRNF(601)+COF_18_GRNF(851));
INDEX1_K_18_GRNF = (K_18_GRNF(601)-K_18_GRNF(851))/(K_18_GRNF(601)+K_18_GRNF(851));
INDEX1_OJ_18_GRNF = (OJ_18_GRNF(601)-OJ_18_GRNF(851))/(OJ_18_GRNF(601)+OJ_18_GRNF(851));
INDEX1_PD_18_GRNF = (PD_18_GRNF(601)-PD_18_GRNF(851))/(PD_18_GRNF(601)+PD_18_GRNF(851));
INDEX1_RW_18_GRNF = (RW_18_GRNF(601)-RW_18_GRNF(851))/(RW_18_GRNF(601)+RW_18_GRNF(851));
INDEX1_T_18_GRNF = (T_18_GRNF(601)-T_18_GRNF(851))/(T_18_GRNF(601)+T_18_GRNF(851));
INDEX1_TS_18_GRNF = (TS_18_GRNF(601)-TS_18_GRNF(851))/(TS_18_GRNF(601)+TS_18_GRNF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(171, INDEX1_blood_18_GRNF, 'r', 'filled');

h(1) = plot(172, INDEX1_AVD_18_GRNF, '*');
h(2) = plot(173, INDEX1_CO_18_GRNF, '*');
h(3) = plot(174, INDEX1_COF_18_GRNF, '*');
h(4) = plot(175, INDEX1_K_18_GRNF, '*');
h(5) = plot(176, INDEX1_OJ_18_GRNF, '*');
h(6) = plot(177, INDEX1_PD_18_GRNF, '*');
h(7) = plot(178, INDEX1_RW_18_GRNF, '*');
h(8) = plot(179, INDEX1_T_18_GRNF, '*');
h(9) = plot(180, INDEX1_TS_18_GRNF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


%%%%%% 30ML %%
INDEX1_blood_30_GRNF = (blood_30_GRNF(601)-blood_30_GRNF(851))/(blood_30_GRNF(601)+blood_30_GRNF(851));
INDEX1_AVD_30_GRNF = (AVD_30_GRNF(601)-AVD_30_GRNF(851))/(AVD_30_GRNF(601)+AVD_30_GRNF(851));
INDEX1_CO_30_GRNF = (CO_30_GRNF(601)-CO_30_GRNF(851))/(CO_30_GRNF(601)+CO_30_GRNF(851));
INDEX1_COF_30_GRNF = (COF_30_GRNF(601)-COF_30_GRNF(851))/(COF_30_GRNF(601)+COF_30_GRNF(851));
INDEX1_K_30_GRNF = (K_30_GRNF(601)-K_30_GRNF(851))/(K_30_GRNF(601)+K_30_GRNF(851));
INDEX1_OJ_30_GRNF = (OJ_30_GRNF(601)-OJ_30_GRNF(851))/(OJ_30_GRNF(601)+OJ_30_GRNF(851));
INDEX1_PD_30_GRNF = (PD_30_GRNF(601)-PD_30_GRNF(851))/(PD_30_GRNF(601)+PD_30_GRNF(851));
INDEX1_RW_30_GRNF = (RW_30_GRNF(601)-RW_30_GRNF(851))/(RW_30_GRNF(601)+RW_30_GRNF(851));
INDEX1_T_30_GRNF = (T_30_GRNF(601)-T_30_GRNF(851))/(T_30_GRNF(601)+T_30_GRNF(851));
INDEX1_TS_30_GRNF = (TS_30_GRNF(601)-TS_30_GRNF(851))/(TS_30_GRNF(601)+TS_30_GRNF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(181, INDEX1_blood_30_GRNF, 'r', 'filled');

h(1) = plot(182, INDEX1_AVD_30_GRNF, '*');
h(2) = plot(183, INDEX1_CO_30_GRNF, '*');
h(3) = plot(184, INDEX1_COF_30_GRNF, '*');
h(4) = plot(185, INDEX1_K_30_GRNF, '*');
h(5) = plot(186, INDEX1_OJ_30_GRNF, '*');
h(6) = plot(187, INDEX1_PD_30_GRNF, '*');
h(7) = plot(188, INDEX1_RW_30_GRNF, '*');
h(8) = plot(189, INDEX1_T_30_GRNF, '*');
h(9) = plot(190, INDEX1_TS_30_GRNF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);



%%%%%% 40ML %%
INDEX1_blood_40_GRNF = (blood_40_GRNF(601)-blood_40_GRNF(851))/(blood_40_GRNF(601)+blood_40_GRNF(851));
INDEX1_AVD_40_GRNF = (AVD_40_GRNF(601)-AVD_40_GRNF(851))/(AVD_40_GRNF(601)+AVD_40_GRNF(851));
INDEX1_CO_40_GRNF = (CO_40_GRNF(601)-CO_40_GRNF(851))/(CO_40_GRNF(601)+CO_40_GRNF(851));
INDEX1_COF_40_GRNF = (COF_40_GRNF(601)-COF_40_GRNF(851))/(COF_40_GRNF(601)+COF_40_GRNF(851));
INDEX1_K_40_GRNF = (K_40_GRNF(601)-K_40_GRNF(851))/(K_40_GRNF(601)+K_40_GRNF(851));
INDEX1_OJ_40_GRNF = (OJ_40_GRNF(601)-OJ_40_GRNF(851))/(OJ_40_GRNF(601)+OJ_40_GRNF(851));
INDEX1_PD_40_GRNF = (PD_40_GRNF(601)-PD_40_GRNF(851))/(PD_40_GRNF(601)+PD_40_GRNF(851));
INDEX1_RW_40_GRNF = (RW_40_GRNF(601)-RW_40_GRNF(851))/(RW_40_GRNF(601)+RW_40_GRNF(851));
INDEX1_T_40_GRNF = (T_40_GRNF(601)-T_40_GRNF(851))/(T_40_GRNF(601)+T_40_GRNF(851));
INDEX1_TS_40_GRNF = (TS_40_GRNF(601)-TS_40_GRNF(851))/(TS_40_GRNF(601)+TS_40_GRNF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(191, INDEX1_blood_40_GRNF, 'r', 'filled');

h(1) = plot(192, INDEX1_AVD_40_GRNF, '*');
h(2) = plot(193, INDEX1_CO_40_GRNF, '*');
h(3) = plot(194, INDEX1_COF_40_GRNF, '*');
h(4) = plot(195, INDEX1_K_40_GRNF, '*');
h(5) = plot(196, INDEX1_OJ_40_GRNF, '*');
h(6) = plot(197, INDEX1_PD_40_GRNF, '*');
h(7) = plot(198, INDEX1_RW_40_GRNF, '*');
h(8) = plot(199, INDEX1_T_40_GRNF, '*');
h(9) = plot(200, INDEX1_TS_40_GRNF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);



%%%%%%%%%%%%%%%%%   RED Felt   %%%%%%%%%%%%%%%%%%%%
INDEX1_blood_4_REDF = (blood_4_REDF(601)-blood_4_REDF(851))/(blood_4_REDF(601)+blood_4_REDF(851));
INDEX1_AVD_4_REDF = (AVD_4_REDF(601)-AVD_4_REDF(851))/(AVD_4_REDF(601)+AVD_4_REDF(851));
INDEX1_CO_4_REDF = (CO_4_REDF(601)-CO_4_REDF(851))/(CO_4_REDF(601)+CO_4_REDF(851));
INDEX1_COF_4_REDF = (COF_4_REDF(601)-COF_4_REDF(851))/(COF_4_REDF(601)+COF_4_REDF(851));
%INDEX1_K_4_REDF = (K_4_REDF(601)-K2_REDF(851))/(K2_REDF(601)+K2_REDF(851));
INDEX1_OJ_4_REDF = (OJ_4_REDF(601)-OJ_4_REDF(851))/(OJ_4_REDF(601)+OJ_4_REDF(851));
INDEX1_PD_4_REDF = (PD_4_REDF(601)-PD_4_REDF(851))/(PD_4_REDF(601)+PD_4_REDF(851));
INDEX1_RW_4_REDF = (RW_4_REDF(601)-RW_4_REDF(851))/(RW_4_REDF(601)+RW_4_REDF(851));
INDEX1_T_4_REDF = (T_4_REDF(601)-T_4_REDF(851))/(T_4_REDF(601)+T_4_REDF(851));
INDEX1_TS_4_REDF = (TS_4_REDF(601)-TS_4_REDF(851))/(TS_4_REDF(601)+TS_4_REDF(851));%INDEX1_TS2_REDF = (TS2_REDF(601)-TS2_REDF(851))/(TS2_REDF(601)+TS2_REDF(851));
%INDEX1_REDF4 = [INDEX1_AVD4_REDF INDEX1_CS4_REDF INDEX1_C4_REDF INDEX1_OJ4_REDF INDEX1_PD4_REDF INDEX1_RW4_REDF INDEX1_T4_REDF INDEX1_TS4_REDF];
%plot(102:109, INDEX1_REDF4, 'B*');
scatter(201, INDEX1_blood_4_REDF, 'r', 'filled');

h(1) = plot(202, INDEX1_AVD_4_REDF, '*');
h(2) = plot(203, INDEX1_CO_4_REDF, '*');
h(3) = plot(204, INDEX1_COF_4_REDF, '*');
%h(4) = plot(45, INDEX1_K4_BLKF, '*');
h(5) = plot(206, INDEX1_OJ_4_REDF, '*');
h(6) = plot(207, INDEX1_PD_4_REDF, '*');
h(7) = plot(208, INDEX1_RW_4_REDF, '*');
h(8) = plot(209, INDEX1_T_4_REDF, '*');
h(9) = plot(210, INDEX1_TS_4_REDF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
%set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);




INDEX1_blood_8_REDF = (blood_8_REDF(601)-blood_8_REDF(851))/(blood_8_REDF(601)+blood_8_REDF(851));
INDEX1_AVD_8_REDF = (AVD_8_REDF(601)-AVD_8_REDF(851))/(AVD_8_REDF(601)+AVD_8_REDF(851));
INDEX1_CO_8_REDF = (CO_8_REDF(601)-CO_8_REDF(851))/(CO_8_REDF(601)+CO_8_REDF(851));
INDEX1_COF_8_REDF = (COF_8_REDF(601)-COF_8_REDF(851))/(COF_8_REDF(601)+COF_8_REDF(851));
INDEX1_OJ_8_REDF = (OJ_8_REDF(601)-OJ_8_REDF(851))/(OJ_8_REDF(601)+OJ_8_REDF(851));
INDEX1_PD_8_REDF = (PD_8_REDF(601)-PD_8_REDF(851))/(PD_8_REDF(601)+PD_8_REDF(851));
INDEX1_RW_8_REDF = (RW_8_REDF(601)-RW_8_REDF(851))/(RW_8_REDF(601)+RW_8_REDF(851));
INDEX1_T_8_REDF = (T_8_REDF(601)-T_8_REDF(851))/(T_8_REDF(601)+T_8_REDF(851));
%INDEX1_REDF8 = [INDEX1_AVD8_REDF INDEX1_CS8_REDF INDEX1_C8_REDF INDEX1_OJ8_REDF INDEX1_PD8_REDF INDEX1_RW8_REDF INDEX1_T8_REDF];
%plot(112:118, INDEX1_REDF8, 'B*');
scatter(211, INDEX1_blood_8_REDF, 'r', 'filled');



h(1) = plot(212, INDEX1_AVD_8_REDF, '*');
h(2) = plot(213, INDEX1_CO_8_REDF, '*');
h(3) = plot(214, INDEX1_COF_8_REDF, '*');
%h(4) = plot(45, INDEX1_K4_BLKF, '*');
h(5) = plot(216, INDEX1_OJ_8_REDF, '*');
h(6) = plot(217, INDEX1_PD_8_REDF, '*');
h(7) = plot(218, INDEX1_RW_8_REDF, '*');
h(8) = plot(219, INDEX1_T_8_REDF, '*');
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



%%%%%%%%%%%%%%%%%   COTTON T-SHIRT   %%%%%%%%%%%%%%%%%%%%



INDEX1_blood_2_COTNT = (blood_2_COTNT(601)-blood_2_COTNT(851))/(blood_2_COTNT(601)+blood_2_COTNT(851));
INDEX1_AVD_2_COTNT = (AVD_2_COTNT(601)-AVD_2_COTNT(851))/(AVD_2_COTNT(601)+AVD_2_COTNT(851));
INDEX1_CO_2_COTNT = (CO_2_COTNT(601)-CO_2_COTNT(851))/(CO_2_COTNT(601)+CO_2_COTNT(851));
INDEX1_COF_2_COTNT = (COF_2_COTNT(601)-COF_2_COTNT(851))/(COF_2_COTNT(601)+COF_2_COTNT(851));
INDEX1_K_2_COTNT = (K_2_COTNT(601)-K_2_COTNT(851))/(K_2_COTNT(601)+K_2_COTNT(851));
INDEX1_OJ_2_COTNT = (OJ_2_COTNT(601)-OJ_2_COTNT(851))/(OJ_2_COTNT(601)+OJ_2_COTNT(851));
INDEX1_PD_2_COTNT = (PD_2_COTNT(601)-PD_2_COTNT(851))/(PD_2_COTNT(601)+PD_2_COTNT(851));
INDEX1_RW_2_COTNT = (RW_2_COTNT(601)-RW_2_COTNT(851))/(RW_2_COTNT(601)+RW_2_COTNT(851));
INDEX1_T_2_COTNT = (T_2_COTNT(601)-T_2_COTNT(851))/(T_2_COTNT(601)+T_2_COTNT(851));
INDEX1_TS_2_COTNT = (TS_2_COTNT(601)-TS_2_COTNT(851))/(TS_2_COTNT(601)+TS_2_COTNT(851));
%INDEX1_COTNT = [INDEX1_AVD2_COTNT INDEX1_CS2_COTNT INDEX1_C2_COTNT INDEX1_K2_COTNT INDEX1_OJ2_COTNT INDEX1_PD2_COTNT INDEX1_RW2_COTNT INDEX1_T2_COTNT INDEX1_TS2_COTNT];
%plot(122:130, INDEX1_COTNT, 'B*');
scatter(221, INDEX1_blood_2_COTNT, 'r', 'filled');


h(1) = plot(222, INDEX1_AVD_2_COTNT, '*');
h(2) = plot(223, INDEX1_CO_2_COTNT, '*');
h(3) = plot(224, INDEX1_COF_2_COTNT, '*');
h(4) = plot(225, INDEX1_K_2_COTNT, '*');
h(5) = plot(226, INDEX1_OJ_2_COTNT, '*');
h(6) = plot(227, INDEX1_PD_2_COTNT, '*');
h(7) = plot(228, INDEX1_RW_2_COTNT, '*');
h(8) = plot(229, INDEX1_T_2_COTNT, '*');
h(9) = plot(230, INDEX1_TS_2_COTNT, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);





%%%%%%%%%%%%%%%%%   POLYESTER T-shirt   %%%%%%%%%%%%%%%%%%%%

INDEX1_blood_2_POLY = (blood_2_POLY(601)-blood_2_POLY(851))/(blood_2_POLY(601)+blood_2_POLY(851));
INDEX1_AVD_2_POLY = (AVD_2_POLY(601)-AVD_2_POLY(851))/(AVD_2_POLY(601)+AVD_2_POLY(851));
INDEX1_CO_2_POLY = (CO_2_POLY(601)-CO_2_POLY(851))/(CO_2_POLY(601)+CO_2_POLY(851));
INDEX1_COF_2_POLY = (COF_2_POLY(601)-COF_2_POLY(851))/(COF_2_POLY(601)+COF_2_POLY(851));
INDEX1_K_2_POLY = (K_2_POLY(601)-K_2_POLY(851))/(K_2_POLY(601)+K_2_POLY(851));
INDEX1_OJ_2_POLY = (OJ_2_POLY(601)-OJ_2_POLY(851))/(OJ_2_POLY(601)+OJ_2_POLY(851));
INDEX1_PD_2_POLY = (PD_2_POLY(601)-PD_2_POLY(851))/(PD_2_POLY(601)+PD_2_POLY(851));
INDEX1_RW_2_POLY = (RW_2_POLY(601)-RW_2_POLY(851))/(RW_2_POLY(601)+RW_2_POLY(851));
INDEX1_T_2_POLY = (T_2_POLY(601)-T_2_POLY(851))/(T_2_POLY(601)+T_2_POLY(851));
INDEX1_TS_2_POLY = (TS_2_POLY(601)-TS_2_POLY(851))/(TS_2_POLY(601)+TS_2_POLY(851));
%INDEX1_POLY = [INDEX1_AVD2_POLY INDEX1_CS2_POLY INDEX1_C2_POLY INDEX1_K2_POLY INDEX1_OJ2_POLY INDEX1_PD2_POLY INDEX1_RW2_POLY INDEX1_T2_POLY INDEX1_TS2_POLY];
%plot(132:140, INDEX1_POLY, 'B*');
scatter(231, INDEX1_blood_2_POLY, 'r', 'filled');

h(1) = plot(232, INDEX1_AVD_2_POLY, '*');
h(2) = plot(233, INDEX1_CO_2_POLY, '*');
h(3) = plot(234, INDEX1_COF_2_POLY, '*');
h(4) = plot(235, INDEX1_K_2_POLY, '*');
h(5) = plot(236, INDEX1_OJ_2_POLY, '*');
h(6) = plot(237, INDEX1_PD_2_POLY, '*');
h(7) = plot(238, INDEX1_RW_2_POLY, '*');
h(8) = plot(239, INDEX1_T_2_POLY, '*');
h(9) = plot(240, INDEX1_TS_2_POLY, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);




%%%%%%%%%%%%%%%%%   JEANS   %%%%%%%%%%%%%%%%%%%%
INDEX1_blood_2_J = (blood_2_J(601)-blood_2_J(851))/(blood_2_J(601)+blood_2_J(851));
INDEX1_AVD_2_J = (AVD_2_J(601)-AVD_2_J(851))/(AVD_2_J(601)+AVD_2_J(851));
INDEX1_CO_2_J = (CO_2_J(601)-CO_2_J(851))/(CO_2_J(601)+CO_2_J(851));
INDEX1_COF_2_J = (COF_2_J(601)-COF_2_J(851))/(COF_2_J(601)+COF_2_J(851));
INDEX1_K_2_J = (K_2_J(601)-K_2_J(851))/(K_2_J(601)+K_2_J(851));
INDEX1_OJ_2_J = (OJ_2_J(601)-OJ_2_J(851))/(OJ_2_J(601)+OJ_2_J(851));
INDEX1_PD_2_J = (PD_2_J(601)-PD_2_J(851))/(PD_2_J(601)+PD_2_J(851));
INDEX1_RW_2_J = (RW_2_J(601)-RW_2_J(851))/(RW_2_J(601)+RW_2_J(851));
INDEX1_T_2_J = (T_2_J(601)-T_2_J(851))/(T_2_J(601)+T_2_J(851));
INDEX1_TS_2_J = (TS_2_J(601)-TS_2_J(851))/(TS_2_J(601)+TS_2_J(851));
%INDEX1_J = [INDEX1_AVD2_J INDEX1_CS2_J INDEX1_C2_J INDEX1_K2_J INDEX1_OJ2_J INDEX1_PD2_J INDEX1_RW2_J INDEX1_T2_J INDEX1_TS2_J];
%plot(142:150, INDEX1_J, 'B*');
scatter(241, INDEX1_blood_2_J, 'r', 'filled');


h(1) = plot(242, INDEX1_AVD_2_J, '*');
h(2) = plot(243, INDEX1_CO_2_J, '*');
h(3) = plot(244, INDEX1_COF_2_J, '*');
h(4) = plot(245, INDEX1_K_2_J, '*');
h(5) = plot(246, INDEX1_OJ_2_J, '*');
h(6) = plot(247, INDEX1_PD_2_J, '*');
h(7) = plot(248, INDEX1_RW_2_J, '*');
h(8) = plot(249, INDEX1_T_2_J, '*');
h(9) = plot(250, INDEX1_TS_2_J, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);



%%%%%%%%%%%%%%%%%   WOOD   %%%%%%%%%%%%%%%%%%%%
INDEX1_blood_1_W = (blood_1_WOOD(601)-blood_1_WOOD(851))/(blood_1_WOOD(601)+blood_1_WOOD(851));
INDEX1_AVD_1_W = (AVD_1_WOOD(601)-AVD_1_WOOD(851))/(AVD_1_WOOD(601)+AVD_1_WOOD(851));
INDEX1_CO_1_W = (CO_1_WOOD(601)-CO_1_WOOD(851))/(CO_1_WOOD(601)+CO_1_WOOD(851));
INDEX1_COF_1_W = (COF_1_WOOD(601)-COF_1_WOOD(851))/(COF_1_WOOD(601)+COF_1_WOOD(851));
INDEX1_K_1_W = (K_1_WOOD(601)-K_1_WOOD(851))/(K_1_WOOD(601)+K_1_WOOD(851));
INDEX1_OJ_1_W = (OJ_1_WOOD(601)-OJ_1_WOOD(851))/(OJ_1_WOOD(601)+OJ_1_WOOD(851));
INDEX1_PD_1_W = (PD_1_WOOD(601)-PD_1_WOOD(851))/(PD_1_WOOD(601)+PD_1_WOOD(851));
INDEX1_RW_1_W = (RW_1_WOOD(601)-RW_1_WOOD(851))/(RW_1_WOOD(601)+RW_1_WOOD(851));
INDEX1_T_1_W = (T_1_WOOD(601)-T_1_WOOD(851))/(T_1_WOOD(601)+T_1_WOOD(851));
INDEX1_TS_1_W = (TS_1_WOOD(601)-TS_1_WOOD(851))/(TS_1_WOOD(601)+TS_1_WOOD(851));
%INDEX1_W = [INDEX1_AVD1_W INDEX1_CS1_W INDEX1_C1_W INDEX1_K1_W INDEX1_OJ1_W INDEX1_PD1_W INDEX1_RW1_W INDEX1_T1_W INDEX1_TS1_W];
%plot(152:160, INDEX1_W, 'B*');
scatter(251, INDEX1_blood_1_W, 'r', 'filled');

h(1) = plot(252, INDEX1_AVD_1_W, '*');
h(2) = plot(253, INDEX1_CO_1_W, '*');
h(3) = plot(254, INDEX1_COF_1_W, '*');
h(4) = plot(255, INDEX1_K_1_W, '*');
h(5) = plot(256, INDEX1_OJ_1_W, '*');
h(6) = plot(257, INDEX1_PD_1_W, '*');
h(7) = plot(258, INDEX1_RW_1_W, '*');
h(8) = plot(259, INDEX1_T_1_W, '*');
h(9) = plot(260, INDEX1_TS_1_W, '*');

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
plot(0:0.1:260, -0.1, 'r-');

text(-8, -0.1, '-0.1');
%text(-11, -0.1, '-0.07');



mTB1 = uicontrol('style', 'text');% mTextBox1 = mTB1
set(mTB1, 'String', '4ML In PD')
set(mTB1, 'Units', 'Characters')
set(mTB1, 'FontSize', 10)
set(mTB1, 'Position', [19 41 3.9 4])
set(mTB1, 'BackgroundColor', [1 1 1])


mTB2 = uicontrol('style', 'text');
set(mTB2, 'String', '10ML In PD')
set(mTB2, 'Units', 'Characters')
set(mTB2, 'FontSize', 10)
set(mTB2, 'Position', [23 41 3.9 4])
set(mTB2, 'BackgroundColor', [1 1 1])

mTB3 = uicontrol('style', 'text');
set(mTB3, 'String', '18ML In PD')
set(mTB3, 'Units', 'Characters')
set(mTB3, 'FontSize', 10)
set(mTB3, 'Position', [27 41 3.9 4])
set(mTB3, 'BackgroundColor', [1 1 1])

 mTB4 = uicontrol('style', 'text');
set(mTB4, 'String', '30ML In PD')
set(mTB4, 'Units', 'Characters')
set(mTB4, 'FontSize', 10)
set(mTB4, 'Position', [31 41 3.9 4])
set(mTB4, 'BackgroundColor', [1 1 1])


 mTB5 = uicontrol('style', 'text');
set(mTB5, 'String', '40ML In PD')
set(mTB5, 'Units', 'Characters')
set(mTB5, 'FontSize', 10)
set(mTB5, 'Position', [35 41 3.9 4])
set(mTB5, 'BackgroundColor', [1 1 1])


 mTB6 = uicontrol('style', 'text');
set(mTB6, 'String', '4ML On BF')
set(mTB6, 'Units', 'Characters')
set(mTB6, 'FontSize', 10)
set(mTB6, 'Position', [39 41 3.9 4])
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
set(mTB8, 'Position', [43 41 3.9 4])
set(mTB8, 'BackgroundColor', [1 1 1])
 
mTB9 = uicontrol('style', 'text');
set(mTB9, 'String', '18ML On BF')
set(mTB9, 'Units', 'Characters')
set(mTB9, 'FontSize', 10)
set(mTB9, 'Position', [47 41 3.9 4])
set(mTB9, 'BackgroundColor', [1 1 1])

 mTB10 = uicontrol('style', 'text');
set(mTB10, 'String', '30ML On BF')
set(mTB10, 'Units', 'Characters')
set(mTB10, 'FontSize', 10)
set(mTB10, 'Position', [51 41 3.9 4])
set(mTB10, 'BackgroundColor', [1 1 1])

 mTB11 = uicontrol('style', 'text');
set(mTB11, 'String', '40ML On BF')
set(mTB11, 'Units', 'Characters')
set(mTB11, 'FontSize', 10)
set(mTB11, 'Position', [55 41 3.9 4])
set(mTB11, 'BackgroundColor', [1 1 1])

mTB12 = uicontrol('style', 'text');
set(mTB12, 'String', '4ML On GF')
set(mTB12, 'Units', 'Characters')
set(mTB12, 'FontSize', 10)
set(mTB12, 'Position', [59 41 3.9 4])
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
set(mTB14, 'Position', [63 41 3.9 4])
set(mTB14, 'BackgroundColor', [1 1 1])

 mTB15 = uicontrol('style', 'text');
set(mTB15, 'String', '18ML On GF')
set(mTB15, 'Units', 'Characters')
set(mTB15, 'FontSize', 10)
set(mTB15, 'Position', [67 41 3.9 4])
set(mTB15, 'BackgroundColor', [1 1 1])

 mTB16 = uicontrol('style', 'text');
set(mTB16, 'String', '30ML On GF')
set(mTB16, 'Units', 'Characters')
set(mTB16, 'FontSize', 10)
set(mTB16, 'Position', [71 41 3.9 4])
set(mTB16, 'BackgroundColor', [1 1 1])

 mTB17 = uicontrol('style', 'text');
set(mTB17, 'String', '40ML On GF')
set(mTB17, 'Units', 'Characters')
set(mTB17, 'FontSize', 10)
set(mTB17, 'Position', [75 41 3.9 4])
set(mTB17, 'BackgroundColor', [1 1 1])


 mTB18 = uicontrol('style', 'text');
set(mTB18, 'String', '4ML On GRF')
set(mTB18, 'Units', 'Characters')
set(mTB18, 'FontSize', 10)
set(mTB18, 'Position', [79 41 3.9 4])
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
set(mTB20, 'Position', [83 41 3.9 4])
set(mTB20, 'BackgroundColor', [1 1 1])

 mTB21 = uicontrol('style', 'text');
set(mTB21, 'String', '18ML On GRF')
set(mTB21, 'Units', 'Characters')
set(mTB21, 'FontSize', 10)
set(mTB21, 'Position', [87 41 3.9 4])
set(mTB21, 'BackgroundColor', [1 1 1])

 mTB22 = uicontrol('style', 'text');
set(mTB22, 'String', '30ML On GRF')
set(mTB22, 'Units', 'Characters')
set(mTB22, 'FontSize', 10)
set(mTB22, 'Position', [91 41 3.9 4])
set(mTB22, 'BackgroundColor', [1 1 1])


 mTB23 = uicontrol('style', 'text');
set(mTB23, 'String', '40ML On GRF')
set(mTB23, 'Units', 'Characters')
set(mTB23, 'FontSize', 10)
set(mTB23, 'Position', [95 41 3.9 4])
set(mTB23, 'BackgroundColor', [1 1 1])



 mTB24 = uicontrol('style', 'text');
set(mTB24, 'String', '4ML On RF')
set(mTB24, 'Units', 'Characters')
set(mTB24, 'FontSize', 10)
set(mTB24, 'Position', [99 41 3.9 4])
set(mTB24, 'BackgroundColor', [1 1 1])

 mTB25 = uicontrol('style', 'text');
set(mTB25, 'String', '8ML On RF')
set(mTB25, 'Units', 'Characters')
set(mTB25, 'FontSize', 10)
set(mTB25, 'Position', [103 41 3.9 4])
set(mTB25, 'BackgroundColor', [1 1 1])


 mTB26 = uicontrol('style', 'text');
set(mTB26, 'String', '2ML On WC')
set(mTB26, 'Units', 'Characters')
set(mTB26, 'FontSize', 10)
set(mTB26, 'Position', [107 41 3.9 4])
set(mTB26, 'BackgroundColor', [1 1 1])


 mTB27 = uicontrol('style', 'text');
set(mTB27, 'String', '2ML On WP')
set(mTB27, 'Units', 'Characters')
set(mTB27, 'FontSize', 10)
set(mTB27, 'Position', [111 41 3.9 4])
set(mTB27, 'BackgroundColor', [1 1 1])

 mTB28 = uicontrol('style', 'text');
set(mTB28, 'String', '2ML On J')
set(mTB28, 'Units', 'Characters')
set(mTB28, 'FontSize', 10)
set(mTB28, 'Position', [115 41 3.9 4])
set(mTB28, 'BackgroundColor', [1 1 1])


 mTB29 = uicontrol('style', 'text');
set(mTB29, 'String', '1ML On W')
set(mTB29, 'Units', 'Characters')
set(mTB29, 'FontSize', 10)
set(mTB29, 'Position', [119 41 3.9 4])
set(mTB29, 'BackgroundColor', [1 1 1])




%%
%%%%%%%%%%  Index 2   %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%% 4ML Petri Dish   %%%%%%%%%%%%%%
%% Petri dish
INDEX2_BLD_4_P = (blood_4_av(601)-blood_4_av(931))/(blood_4_av(601)+blood_4_av(931));
INDEX2_AVD_4_P = (AVD_4_P_av(601)-AVD_4_P_av(931))/(AVD_4_P_av(601)+AVD_4_P_av(931));
INDEX2_CO_4_P = (CO_4_P_av(601)-CO_4_P_av(931))/(CO_4_P_av(601)+CO_4_P_av(931));
INDEX2_COF_4_P = (COF_4_P_av(601)-COF_4_P_av(931))/(COF_4_P_av(601)+COF_4_P_av(931));
INDEX2_K_4_P = (K_4_P_av(601)-K_4_P_av(931))/(K_4_P_av(601)+K_4_P_av(931));
INDEX2_OJ_4_P = (OJ_4_P_av(601)-OJ_4_P_av(931))/(OJ_4_P_av(601)+OJ_4_P_av(931));
INDEX2_PD_4_P = (PD_4_P_av(601)-PD_4_P_av(931))/(PD_4_P_av(601)+PD_4_P_av(931));
INDEX2_RW_4_P = (RW_4_P_av(601)-RW_4_P_av(931))/(RW_4_P_av(601)+RW_4_P_av(931));
INDEX2_T_4_P = (T_4_P_av(601)-T_4_P_av(931))/(T_4_P_av(601)+T_4_P_av(931));
INDEX2_TS_4_P = (TS_4_P_av(601)-TS_4_P_av(931))/(TS_4_P_av(601)+TS_4_P_av(931));
%INDEX1_PETRI4 = [INDEX1_AVD4_P INDEX1_CS4_P INDEX1_C4_P INDEX1_K4_P INDEX1_OJ4_P INDEX1_PD4_P INDEX1_RW4_P INDEX1_T4_P INDEX1_TS4_P];
figure('color', 'w'); hold on;
plot(10.5, -0.6:0.005:1, 'k-');
plot(20.5, -0.6:0.005:1, 'k-');
plot(30.5, -0.6:0.005:1, 'k-');
plot(40.5, -0.6:0.005:1, 'k-');
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
%plot(270.5, -0.6:0.005:1, 'k-');
%plot(280.5, -0.6:0.005:1, 'k-');
%plot(290.5, -0.6:0.005:1, 'k-');

title('Blood Separation from Liquid Confusors', 'FontSize', 16); xlabel('None-samples Representation', 'FontSize', 14);ylabel('Index 2', 'FontSize', 14);
xlim([0 261]);

%LINESTYLE = {'G*','B*','M*', 'C*', 'Y*', 'K*', rgb('orange'),rgb('DarkRed'), rgb('')};

h(10)=scatter(1, INDEX2_BLD_4_P, 'r', 'filled');

h(1) = plot(2, INDEX2_AVD_4_P, '*');
h(2) = plot(3, INDEX2_CO_4_P, '*');
h(3) = plot(4, INDEX2_COF_4_P, '*');
h(4) = plot(5, INDEX2_K_4_P, '*');
h(5) = plot(6, INDEX2_OJ_4_P, '*');
h(6) = plot(7, INDEX2_PD_4_P, '*');
h(7) = plot(8, INDEX2_RW_4_P, '*');
h(8) = plot(9, INDEX2_T_4_P, '*');
h(9) = plot(10, INDEX2_TS_4_P, '*');

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


%%%%%%%%%%%%%%%%%%%     10ML Petri Dish    %%%%%%%%%%%%%%%%%%%%%
INDEX2_BLD_10_P = (blood_10_av(601)-blood_10_av(931))/(blood_10_av(601)+blood_10_av(931));
INDEX2_AVD_10_P = (AVD_10_P_av(601)-AVD_10_P_av(931))/(AVD_10_P_av(601)+AVD_10_P_av(931));
INDEX2_CO_10_P = (CO_10_P_av(601)-CO_10_P_av(931))/(CO_10_P_av(601)+CO_10_P_av(931));
INDEX2_COF_10_P = (COF_10_P_av(601)-COF_10_P_av(931))/(COF_10_P_av(601)+COF_10_P_av(931));
INDEX2_K_10_P = (K_10_P_av(601)-K_10_P_av(931))/(K_10_P_av(601)+K_10_P_av(931));
INDEX2_OJ_10_P = (OJ_10_P_av(601)-OJ_10_P_av(931))/(OJ_10_P_av(601)+OJ_10_P_av(931));
INDEX2_PD_10_P = (PD_10_P_av(601)-PD_10_P_av(931))/(PD_10_P_av(601)+PD_10_P_av(931));
INDEX2_RW_10_P = (RW_10_P_av(601)-RW_10_P_av(931))/(RW_10_P_av(601)+RW_10_P_av(931));
INDEX2_T_10_P = (T_10_P_av(601)-T_10_P_av(931))/(T_10_P_av(601)+T_10_P_av(931));
INDEX2_TS_10_P = (TS_10_P_av(601)-TS_10_P_av(931))/(TS_10_P_av(601)+TS_10_P_av(931));
%INDEX1_PETRI18 = [INDEX1_AVD18_P INDEX1_CS18_P INDEX1_C18_P INDEX1_K18_P INDEX1_OJ18_P INDEX1_PD18_P INDEX1_RW18_P INDEX1_T18_P INDEX1_TS18_P];

%plot(12:20, INDEX1_PETRI18, 'B*');
scatter(11, INDEX2_BLD_10_P, 'r', 'filled');

h(1) = plot(12, INDEX2_AVD_10_P, '*');
h(2) = plot(13, INDEX2_CO_10_P, '*');
h(3) = plot(14, INDEX2_COF_10_P, '*');
h(4) = plot(15, INDEX2_K_10_P, '*');
h(5) = plot(16, INDEX2_OJ_10_P, '*');
h(6) = plot(17, INDEX2_PD_10_P, '*');
h(7) = plot(18, INDEX2_RW_10_P, '*');
h(8) = plot(19, INDEX2_T_10_P, '*');
h(9) = plot(20, INDEX2_TS_10_P, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


%%%%%%%%%%%%%%%%%%%     18ML Petri Dish    %%%%%%%%%%%%%%%%%%%%%
INDEX2_BLD_18_P = (blood_18_av(601)-blood_18_av(931))/(blood_18_av(601)+blood_18_av(931));
INDEX2_AVD_18_P = (AVD_18_P_av(601)-AVD_18_P_av(931))/(AVD_18_P_av(601)+AVD_18_P_av(931));
INDEX2_CO_18_P = (CO_18_P_av(601)-CO_18_P_av(931))/(CO_18_P_av(601)+CO_18_P_av(931));
INDEX2_COF_18_P = (COF_18_P_av(601)-COF_18_P_av(931))/(COF_18_P_av(601)+COF_18_P_av(931));
INDEX2_K_18_P = (K_18_P_av(601)-K_18_P_av(931))/(K_18_P_av(601)+K_18_P_av(931));
INDEX2_OJ_18_P = (OJ_18_P_av(601)-OJ_18_P_av(931))/(OJ_18_P_av(601)+OJ_18_P_av(931));
INDEX2_PD_18_P = (PD_18_P_av(601)-PD_18_P_av(931))/(PD_18_P_av(601)+PD_18_P_av(931));
INDEX2_RW_18_P = (RW_18_P_av(601)-RW_18_P_av(931))/(RW_18_P_av(601)+RW_18_P_av(931));
INDEX2_T_18_P = (T_18_P_av(601)-T_18_P_av(931))/(T_18_P_av(601)+T_18_P_av(931));
INDEX2_TS_18_P = (TS_18_P_av(601)-TS_18_P_av(931))/(TS_18_P_av(601)+TS_18_P_av(931));
%INDEX1_PETRI18 = [INDEX1_AVD18_P INDEX1_CS18_P INDEX1_C18_P INDEX1_K18_P INDEX1_OJ18_P INDEX1_PD18_P INDEX1_RW18_P INDEX1_T18_P INDEX1_TS18_P];

%plot(12:20, INDEX1_PETRI18, 'B*');
scatter(21, INDEX2_BLD_18_P, 'r', 'filled');

h(1) = plot(22, INDEX2_AVD_18_P, '*');
h(2) = plot(23, INDEX2_CO_18_P, '*');
h(3) = plot(24, INDEX2_COF_18_P, '*');
h(4) = plot(25, INDEX2_K_18_P, '*');
h(5) = plot(26, INDEX2_OJ_18_P, '*');
h(6) = plot(27, INDEX2_PD_18_P, '*');
h(7) = plot(28, INDEX2_RW_18_P, '*');
h(8) = plot(29, INDEX2_T_18_P, '*');
h(9) = plot(30, INDEX2_TS_18_P, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


%%%%%%%%%%%%%%%%%%%     30ML Petri Dish    %%%%%%%%%%%%%%%%%%%%%
INDEX2_BLD_30_P = (blood_30_av(601)-blood_30_av(931))/(blood_30_av(601)+blood_30_av(931));
INDEX2_AVD_30_P = (AVD_30_P_av(601)-AVD_30_P_av(931))/(AVD_30_P_av(601)+AVD_30_P_av(931));
INDEX2_CO_30_P = (CO_30_P_av(601)-CO_30_P_av(931))/(CO_30_P_av(601)+CO_30_P_av(931));
INDEX2_COF_30_P = (COF_30_P_av(601)-COF_30_P_av(931))/(COF_30_P_av(601)+COF_30_P_av(931));
INDEX2_K_30_P = (K_30_P_av(601)-K_30_P_av(931))/(K_30_P_av(601)+K_30_P_av(931));
INDEX2_OJ_30_P = (OJ_30_P_av(601)-OJ_30_P_av(931))/(OJ_30_P_av(601)+OJ_30_P_av(931));
INDEX2_PD_30_P = (PD_30_P_av(601)-PD_30_P_av(931))/(PD_30_P_av(601)+PD_30_P_av(931));
INDEX2_RW_30_P = (RW_30_P_av(601)-RW_30_P_av(931))/(RW_30_P_av(601)+RW_30_P_av(931));
INDEX2_T_30_P = (T_30_P_av(601)-T_30_P_av(931))/(T_30_P_av(601)+T_30_P_av(931));
INDEX2_TS_30_P = (TS_30_P_av(601)-TS_30_P_av(931))/(TS_30_P_av(601)+TS_30_P_av(931));
%INDEX2_PETRI30 = [INDEX1_AVD30_P INDEX1_CS30_P INDEX1_C30_P INDEX1_K30_P INDEX1_OJ30_P INDEX1_PD30_P INDEX1_RW30_P INDEX1_T30_P INDEX1_TS30_P];

%plot(22:30, INDEX1_PETRI30, 'B*');
scatter(31, INDEX2_BLD_30_P, 'r', 'filled');


h(1) = plot(32, INDEX2_AVD_30_P, '*');
h(2) = plot(33, INDEX2_CO_30_P, '*');
h(3) = plot(34, INDEX2_COF_30_P, '*');
h(4) = plot(35, INDEX2_K_30_P, '*');
h(5) = plot(36, INDEX2_OJ_30_P, '*');
h(6) = plot(37, INDEX2_PD_30_P, '*');
h(7) = plot(38, INDEX2_RW_30_P, '*');
h(8) = plot(39, INDEX2_T_30_P, '*');
h(9) = plot(40, INDEX2_TS_30_P, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

%%%%%%%%%%%%%%%%%%%     40ML Petri Dish    %%%%%%%%%%%%%%%%%%%%%
INDEX2_BLD_40_P = (blood_40_av(601)-blood_40_av(931))/(blood_40_av(601)+blood_40_av(931));
INDEX2_AVD_40_P = (AVD_40_P_av(601)-AVD_40_P_av(931))/(AVD_40_P_av(601)+AVD_40_P_av(931));
INDEX2_CO_40_P = (CO_40_P_av(601)-CO_40_P_av(931))/(CO_40_P_av(601)+CO_40_P_av(931));
INDEX2_COF_40_P = (COF_40_P_av(601)-COF_40_P_av(931))/(COF_40_P_av(601)+COF_40_P_av(931));
INDEX2_K_40_P = (K_40_P_av(601)-K_40_P_av(931))/(K_40_P_av(601)+K_40_P_av(931));
INDEX2_OJ_40_P = (OJ_40_P_av(601)-OJ_40_P_av(931))/(OJ_40_P_av(601)+OJ_40_P_av(931));
INDEX2_PD_40_P = (PD_40_P_av(601)-PD_40_P_av(931))/(PD_40_P_av(601)+PD_40_P_av(931));
INDEX2_RW_40_P = (RW_40_P_av(601)-RW_40_P_av(931))/(RW_40_P_av(601)+RW_40_P_av(931));
INDEX2_T_40_P = (T_40_P_av(601)-T_40_P_av(931))/(T_40_P_av(601)+T_40_P_av(931));
INDEX2_TS_40_P = (TS_40_P_av(601)-TS_40_P_av(931))/(TS_40_P_av(601)+TS_40_P_av(931));
%INDEX1_PETRI40 = [INDEX1_AVD40_P INDEX1_CS40_P INDEX1_C40_P INDEX1_K40_P INDEX1_OJ40_P INDEX1_PD40_P INDEX1_RW40_P INDEX1_T40_P INDEX1_TS40_P];

%plot(32:40, INDEX1_PETRI40, 'B*');
scatter(41, INDEX2_BLD_40_P, 'r', 'filled');

h(1) = plot(42, INDEX2_AVD_40_P, '*');
h(2) = plot(43, INDEX2_CO_40_P, '*');
h(3) = plot(44, INDEX2_COF_40_P, '*');
h(4) = plot(45, INDEX2_K_40_P, '*');
h(5) = plot(46, INDEX2_OJ_40_P, '*');
h(6) = plot(47, INDEX2_PD_40_P, '*');
h(7) = plot(48, INDEX2_RW_40_P, '*');
h(8) = plot(49, INDEX2_T_40_P, '*');
h(9) = plot(50, INDEX2_TS_40_P, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


%%%%%%%%%%%%%%%%%   Black Felt   %%%%%%%%%%%%%%%%%%%%
INDEX2_blood_4_BLKF = (blood_4_BLKF(601)-blood_4_BLKF(931))/(blood_4_BLKF(601)+blood_4_BLKF(931));
INDEX2_AVD_4_BLKF = (AVD_4_BLKF(601)-AVD_4_BLKF(931))/(AVD_4_BLKF(601)+AVD_4_BLKF(931));
INDEX2_CO_4_BLKF = (CO_4_BLKF(601)-CO_4_BLKF(931))/(CO_4_BLKF(601)+CO_4_BLKF(931));
INDEX2_COF_4_BLKF = (COF_4_BLKF(601)-COF_4_BLKF(931))/(COF_4_BLKF(601)+COF_4_BLKF(931));
INDEX2_K_4_BLKF = (K_4_BLKF(601)-K_4_BLKF(931))/(K_4_BLKF(601)+K_4_BLKF(931));
INDEX2_OJ_4_BLKF = (OJ_4_BLKF(601)-OJ_4_BLKF(931))/(OJ_4_BLKF(601)+OJ_4_BLKF(931));
INDEX2_PD_4_BLKF = (PD_4_BLKF(601)-PD_4_BLKF(931))/(PD_4_BLKF(601)+PD_4_BLKF(931));
INDEX2_RW_4_BLKF = (RW_4_BLKF(601)-RW_4_BLKF(931))/(RW_4_BLKF(601)+RW_4_BLKF(931));
INDEX2_T_4_BLKF = (T_4_BLKF(601)-T_4_BLKF(931))/(T_4_BLKF(601)+T_4_BLKF(931));
INDEX2_TS_4_BLKF = (TS_4_BLKF(601)-TS_4_BLKF(931))/(TS_4_BLKF(601)+TS_4_BLKF(931));%INDEX1_TS2_BLKF = (TS2_BLKF(601)-TS2_BLKF(851))/(TS2_BLKF(601)+TS2_BLKF(851));
%INDEX1_BLKF4 = [INDEX1_AVD4_BLKF INDEX1_CS4_BLKF INDEX1_C4_BLKF INDEX1_K4_BLKF INDEX1_OJ4_BLKF INDEX1_PD4_BLKF INDEX1_RW4_BLKF INDEX1_T4_BLKF  INDEX1_TS4_BLKF];
%plot(42:50, INDEX1_BLKF4, 'b*');
scatter(51, INDEX2_blood_4_BLKF, 'r', 'filled');

h(1) = plot(52, INDEX2_AVD_4_BLKF, '*');
h(2) = plot(53, INDEX2_CO_4_BLKF, '*');
h(3) = plot(54, INDEX2_COF_4_BLKF, '*');
h(4) = plot(55, INDEX2_K_4_BLKF, '*');
h(5) = plot(56, INDEX2_OJ_4_BLKF, '*');
h(6) = plot(57, INDEX2_PD_4_BLKF, '*');
h(7) = plot(58, INDEX2_RW_4_BLKF, '*');
h(8) = plot(59, INDEX2_T_4_BLKF, '*');
h(9) = plot(60, INDEX2_TS_4_BLKF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

%{
INDEX2_blood_8_BLKF = (blood_8_BLKF(601)-blood_8_BLKF(931))/(blood_8_BLKF(601)+blood_8_BLKF(931));
INDEX2_AVD8_BLKF = (AVD8_BLKF(601)-AVD8_BLKF(931))/(AVD8_BLKF(601)+AVD8_BLKF(931));
INDEX2_COLA8_BLKF = (CS8_BLKF(601)-CS8_BLKF(931))/(CS8_BLKF(601)+CS8_BLKF(931));
INDEX2_C8_BLKF = (C8_BLKF(601)-C8_BLKF(931))/(C8_BLKF(601)+C8_BLKF(931));
INDEX2_K8_BLKF = (K8_BLKF(601)-K8_BLKF(931))/(K8_BLKF(601)+K8_BLKF(931));
INDEX2_OJ8_BLKF = (OJ8_BLKF(601)-OJ8_BLKF(931))/(OJ8_BLKF(601)+OJ8_BLKF(931));
INDEX2_PD8_BLKF = (PD8_BLKF(601)-PD8_BLKF(931))/(PD8_BLKF(601)+PD8_BLKF(931));
INDEX2_RW8_BLKF = (RW8_BLKF(601)-RW8_BLKF(931))/(RW8_BLKF(601)+RW8_BLKF(931));
INDEX2_T8_BLKF = (T8_BLKF(601)-T8_BLKF(931))/(T8_BLKF(601)+T8_BLKF(931));
%INDEX1_TS4_BLKF = (TS4_BLKF(601)-TS4_BLKF(851))/(TS4_BLKF(601)+TS4_BLKF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(61, INDEX2_blood_8_BLKF, 'r', 'filled');

h(1) = plot(62, INDEX2_AVD8_BLKF, '*');
h(2) = plot(63, INDEX2_COLA8_BLKF, '*');
h(3) = plot(64, INDEX2_C8_BLKF, '*');
h(4) = plot(65, INDEX2_K8_BLKF, '*');
h(5) = plot(66, INDEX2_OJ8_BLKF, '*');
h(6) = plot(67, INDEX2_PD8_BLKF, '*');
h(7) = plot(68, INDEX2_RW8_BLKF, '*');
h(8) = plot(69, INDEX2_T8_BLKF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
%set(h(9), 'color', [0.5 0.8 1]);
%}

%%%%%% 10ML %%
INDEX2_blood_10_BLKF = (blood_10_BLKF(601)-blood_10_BLKF(931))/(blood_10_BLKF(601)+blood_10_BLKF(931));
INDEX2_AVD_10_BLKF = (AVD_10_BLKF(601)-AVD_10_BLKF(931))/(AVD_10_BLKF(601)+AVD_10_BLKF(931));
INDEX2_CO_10_BLKF = (CO_10_BLKF(601)-CO_10_BLKF(893))/(CO_10_BLKF(601)+CO_10_BLKF(931));
INDEX2_COF_10_BLKF = (COF_10_BLKF(601)-COF_10_BLKF(931))/(COF_10_BLKF(601)+COF_10_BLKF(931));
INDEX2_K_10_BLKF = (K_10_BLKF(601)-K_10_BLKF(931))/(K_10_BLKF(601)+K_10_BLKF(931));
INDEX2_OJ_10_BLKF = (OJ_10_BLKF(601)-OJ_10_BLKF(931))/(OJ_10_BLKF(601)+OJ_10_BLKF(931));
INDEX2_PD_10_BLKF = (PD_10_BLKF(601)-PD_10_BLKF(931))/(PD_10_BLKF(601)+PD_10_BLKF(931));
INDEX2_RW_10_BLKF = (RW_10_BLKF(601)-RW_10_BLKF(931))/(RW_10_BLKF(601)+RW_10_BLKF(931));
INDEX2_T_10_BLKF = (T_10_BLKF(601)-T_10_BLKF(931))/(T_10_BLKF(601)+T_10_BLKF(931));
INDEX2_TS_10_BLKF = (TS_10_BLKF(601)-TS_10_BLKF(851))/(TS_10_BLKF(601)+TS_10_BLKF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(61, INDEX2_blood_10_BLKF, 'r', 'filled');

h(1) = plot(62, INDEX2_AVD_10_BLKF, '*');
h(2) = plot(63, INDEX2_CO_10_BLKF, '*');
h(3) = plot(64, INDEX2_COF_10_BLKF, '*');
h(4) = plot(65, INDEX2_K_10_BLKF, '*');
h(5) = plot(66, INDEX2_OJ_10_BLKF, '*');
h(6) = plot(67, INDEX2_PD_10_BLKF, '*');
h(7) = plot(68, INDEX2_RW_10_BLKF, '*');
h(8) = plot(69, INDEX2_T_10_BLKF, '*');
h(9) = plot(70, INDEX2_TS_10_BLKF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

%%%%%% 18ML %%
INDEX2_blood_18_BLKF = (blood_18_BLKF(601)-blood_18_BLKF(931))/(blood_18_BLKF(601)+blood_18_BLKF(931));
INDEX2_AVD_18_BLKF = (AVD_18_BLKF(601)-AVD_18_BLKF(931))/(AVD_18_BLKF(601)+AVD_18_BLKF(931));
INDEX2_CO_18_BLKF = (CO_18_BLKF(601)-CO_18_BLKF(931))/(CO_18_BLKF(601)+CO_18_BLKF(931));
INDEX2_COF_18_BLKF = (COF_18_BLKF(601)-COF_18_BLKF(931))/(COF_18_BLKF(601)+COF_18_BLKF(931));
INDEX2_K_18_BLKF = (K_18_BLKF(601)-K_18_BLKF(931))/(K_18_BLKF(601)+K_18_BLKF(931));
INDEX2_OJ_18_BLKF = (OJ_18_BLKF(601)-OJ_18_BLKF(931))/(OJ_18_BLKF(601)+OJ_18_BLKF(931));
INDEX2_PD_18_BLKF = (PD_18_BLKF(601)-PD_18_BLKF(931))/(PD_18_BLKF(601)+PD_18_BLKF(931));
INDEX2_RW_18_BLKF = (RW_18_BLKF(601)-RW_18_BLKF(931))/(RW_18_BLKF(601)+RW_18_BLKF(931));
INDEX2_T_18_BLKF = (T_18_BLKF(601)-T_18_BLKF(931))/(T_18_BLKF(601)+T_18_BLKF(931));
INDEX2_TS_18_BLKF = (TS_18_BLKF(601)-TS_18_BLKF(851))/(TS_18_BLKF(601)+TS_18_BLKF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(71, INDEX2_blood_18_BLKF, 'r', 'filled');

h(1) = plot(72, INDEX2_AVD_18_BLKF, '*');
h(2) = plot(73, INDEX2_CO_18_BLKF, '*');
h(3) = plot(74, INDEX2_COF_18_BLKF, '*');
h(4) = plot(75, INDEX2_K_18_BLKF, '*');
h(5) = plot(76, INDEX2_OJ_18_BLKF, '*');
h(6) = plot(77, INDEX2_PD_18_BLKF, '*');
h(7) = plot(78, INDEX2_RW_18_BLKF, '*');
h(8) = plot(79, INDEX2_T_18_BLKF, '*');
h(9) = plot(80, INDEX2_TS_18_BLKF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


%%%%%% 30ML %%
INDEX2_blood_30_BLKF = (blood_30_BLKF(601)-blood_30_BLKF(931))/(blood_30_BLKF(601)+blood_30_BLKF(931));
INDEX2_AVD_30_BLKF = (AVD_30_BLKF(601)-AVD_30_BLKF(931))/(AVD_30_BLKF(601)+AVD_30_BLKF(931));
INDEX2_CO_30_BLKF = (CO_30_BLKF(601)-CO_30_BLKF(931))/(CO_30_BLKF(601)+CO_30_BLKF(931));
INDEX2_COF_30_BLKF = (COF_30_BLKF(601)-COF_30_BLKF(931))/(COF_30_BLKF(601)+COF_30_BLKF(931));
INDEX2_K_30_BLKF = (K_30_BLKF(601)-K_30_BLKF(931))/(K_30_BLKF(601)+K_30_BLKF(931));
INDEX2_OJ_30_BLKF = (OJ_30_BLKF(601)-OJ_30_BLKF(931))/(OJ_30_BLKF(601)+OJ_30_BLKF(931));
INDEX2_PD_30_BLKF = (PD_30_BLKF(601)-PD_30_BLKF(931))/(PD_30_BLKF(601)+PD_30_BLKF(931));
INDEX2_RW_30_BLKF = (RW_30_BLKF(601)-RW_30_BLKF(931))/(RW_30_BLKF(601)+RW_30_BLKF(931));
INDEX2_T_30_BLKF = (T_30_BLKF(601)-T_30_BLKF(931))/(T_30_BLKF(601)+T_30_BLKF(931));
INDEX2_TS_30_BLKF = (TS_30_BLKF(601)-TS_30_BLKF(851))/(TS_30_BLKF(601)+TS_30_BLKF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(81, INDEX2_blood_30_BLKF, 'r', 'filled');

h(1) = plot(82, INDEX2_AVD_30_BLKF, '*');
h(2) = plot(83, INDEX2_CO_30_BLKF, '*');
h(3) = plot(84, INDEX2_COF_30_BLKF, '*');
h(4) = plot(85, INDEX2_K_30_BLKF, '*');
h(5) = plot(86, INDEX2_OJ_30_BLKF, '*');
h(6) = plot(87, INDEX2_PD_30_BLKF, '*');
h(7) = plot(88, INDEX2_RW_30_BLKF, '*');
h(8) = plot(89, INDEX2_T_30_BLKF, '*');
h(9) = plot(90, INDEX2_TS_30_BLKF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);



%%%%%% 40ML %%
INDEX2_blood_40_BLKF = (blood_40_BLKF(601)-blood_40_BLKF(931))/(blood_40_BLKF(601)+blood_40_BLKF(931));
INDEX2_AVD_40_BLKF = (AVD_40_BLKF(601)-AVD_40_BLKF(931))/(AVD_40_BLKF(601)+AVD_40_BLKF(931));
INDEX2_CO_40_BLKF = (CO_40_BLKF(601)-CO_40_BLKF(931))/(CO_40_BLKF(601)+CO_40_BLKF(931));
INDEX2_COF_40_BLKF = (COF_40_BLKF(601)-COF_40_BLKF(931))/(COF_40_BLKF(601)+COF_40_BLKF(931));
INDEX2_K_40_BLKF = (K_40_BLKF(601)-K_40_BLKF(931))/(K_40_BLKF(601)+K_40_BLKF(931));
INDEX2_OJ_40_BLKF = (OJ_40_BLKF(601)-OJ_40_BLKF(931))/(OJ_40_BLKF(601)+OJ_40_BLKF(931));
INDEX2_PD_40_BLKF = (PD_40_BLKF(601)-PD_40_BLKF(931))/(PD_40_BLKF(601)+PD_40_BLKF(931));
INDEX2_RW_40_BLKF = (RW_40_BLKF(601)-RW_40_BLKF(931))/(RW_40_BLKF(601)+RW_40_BLKF(931));
INDEX2_T_40_BLKF = (T_40_BLKF(601)-T_40_BLKF(931))/(T_40_BLKF(601)+T_40_BLKF(931));
INDEX2_TS_40_BLKF = (TS_40_BLKF(601)-TS_40_BLKF(851))/(TS_40_BLKF(601)+TS_40_BLKF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(91, INDEX2_blood_40_BLKF, 'r', 'filled');

h(1) = plot(92, INDEX2_AVD_40_BLKF, '*');
h(2) = plot(93, INDEX2_CO_40_BLKF, '*');
h(3) = plot(94, INDEX2_COF_40_BLKF, '*');
h(4) = plot(95, INDEX2_K_40_BLKF, '*');
h(5) = plot(96, INDEX2_OJ_40_BLKF, '*');
h(6) = plot(97, INDEX2_PD_40_BLKF, '*');
h(7) = plot(98, INDEX2_RW_40_BLKF, '*');
h(8) = plot(99, INDEX2_T_40_BLKF, '*');
h(9) = plot(100, INDEX2_TS_40_BLKF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


%%%%%%%%%%%%%%%%%   GREY Felt   %%%%%%%%%%%%%%%%%%%%
INDEX2_blood_4_GRYF = (blood_4_GRYF(601)-blood_4_GRYF(931))/(blood_4_GRYF(601)+blood_4_GRYF(931));
INDEX2_AVD_4_GRYF = (AVD_4_GRYF(601)-AVD_4_GRYF(931))/(AVD_4_GRYF(601)+AVD_4_GRYF(931));
INDEX2_CO_4_GRYF = (CO_4_GRYF(601)-CO_4_GRYF(931))/(CO_4_GRYF(601)+CO_4_GRYF(931));
INDEX2_COF_4_GRYF = (COF_4_GRYF(601)-COF_4_GRYF(931))/(COF_4_GRYF(601)+COF_4_GRYF(931));
INDEX2_K_4_GRYF = (K_4_GRYF(601)-K_4_GRYF(851))/(K_4_GRYF(601)+K_4_GRYF(851));
INDEX2_OJ_4_GRYF = (OJ_4_GRYF(601)-OJ_4_GRYF(931))/(OJ_4_GRYF(601)+OJ_4_GRYF(931));
INDEX2_PD_4_GRYF = (PD_4_GRYF(601)-PD_4_GRYF(931))/(PD_4_GRYF(601)+PD_4_GRYF(931));
INDEX2_RW_4_GRYF = (RW_4_GRYF(601)-RW_4_GRYF(931))/(RW_4_GRYF(601)+RW_4_GRYF(931));
INDEX2_T_4_GRYF = (T_4_GRYF(601)-T_4_GRYF(931))/(T_4_GRYF(601)+T_4_GRYF(931));
INDEX2_TS_4_GRYF = (TS_4_GRYF(601)-TS_4_GRYF(931))/(TS_4_GRYF(601)+TS_4_GRYF(931)); %INDEX1_TS2_GRYF = (TS2_GRYF(601)-TS2_GRYF(851))/(TS2_GRYF(601)+TS2_GRYF(851));
%INDEX1_GRYF4 = [INDEX1_AVD4_GRYF INDEX1_CS4_GRYF INDEX1_C4_GRYF INDEX1_OJ4_GRYF INDEX1_PD4_GRYF INDEX1_RW4_GRYF INDEX1_T4_GRYF INDEX1_TS4_GRYF];
%plot(62:69, INDEX1_GRYF4, 'B*');
scatter(101, INDEX2_blood_4_GRYF, 'r', 'filled');

h(1) = plot(102, INDEX2_AVD_4_GRYF, '*');
h(2) = plot(103, INDEX2_CO_4_GRYF, '*');
h(3) = plot(104, INDEX2_COF_4_GRYF, '*');
h(4) = plot(105, INDEX2_K_4_GRYF, '*');
h(5) = plot(106, INDEX2_OJ_4_GRYF, '*');
h(6) = plot(107, INDEX2_PD_4_GRYF, '*');
h(7) = plot(108, INDEX2_RW_4_GRYF, '*');
h(8) = plot(109, INDEX2_T_4_GRYF, '*');
h(9) = plot(110, INDEX2_TS_4_GRYF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);




%{
INDEX2_blood_8_GRYF = (blood_8_GRYF(601)-blood_8_GRYF(931))/(blood_8_GRYF(601)+blood_8_GRYF(931));
INDEX2_AVD8_GRYF = (AVD8_GRYF(601)-AVD8_GRYF(931))/(AVD8_GRYF(601)+AVD8_GRYF(931));
INDEX2_CS8_GRYF = (CS8_GRYF(601)-CS8_GRYF(931))/(CS8_GRYF(601)+CS8_GRYF(931));
INDEX2_C8_GRYF = (C8_GRYF(601)-C8_GRYF(931))/(C8_GRYF(601)+C8_GRYF(931));
INDEX2_OJ8_GRYF = (OJ8_GRYF(601)-OJ8_GRYF(931))/(OJ8_GRYF(601)+OJ8_GRYF(931));
INDEX2_PD8_GRYF = (PD8_GRYF(601)-PD8_GRYF(931))/(PD8_GRYF(601)+PD8_GRYF(931));
INDEX2_RW8_GRYF = (RW8_GRYF(601)-RW8_GRYF(931))/(RW8_GRYF(601)+RW8_GRYF(931));
INDEX2_T8_GRYF = (T8_GRYF(601)-T8_GRYF(931))/(T8_GRYF(601)+T8_GRYF(931));
%INDEX1_GRYF8 = [INDEX1_AVD8_GRYF INDEX1_CS8_GRYF INDEX1_C8_GRYF INDEX1_OJ8_GRYF INDEX1_PD8_GRYF INDEX1_RW8_GRYF INDEX1_T8_GRYF];
%plot(72:78, INDEX1_GRYF8, 'B*');
scatter(121, INDEX2_blood_8_GRYF, 'r', 'filled');

h(1) = plot(122, INDEX2_AVD8_GRYF, '*');
h(2) = plot(123, INDEX2_CS8_GRYF, '*');
h(3) = plot(124, INDEX2_C8_GRYF, '*');

h(5) = plot(126, INDEX2_OJ8_GRYF, '*');
h(6) = plot(127, INDEX2_PD8_GRYF, '*');
h(7) = plot(128, INDEX2_RW8_GRYF, '*');
h(8) = plot(129, INDEX2_T8_GRYF, '*');
%h(9) = plot(80, INDEX1_TS4_BLKF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
%set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
%set(h(9), 'color', [0.5 0.8 1]);
%}


%%%%%% 10ML %%
INDEX2_blood_10_GRYF = (blood_10_GRYF(601)-blood_10_GRYF(931))/(blood_10_GRYF(601)+blood_10_GRYF(931));
INDEX2_AVD_10_GRYF = (AVD_10_GRYF(601)-AVD_10_GRYF(931))/(AVD_10_GRYF(601)+AVD_10_GRYF(931));
INDEX2_CO_10_GRYF = (CO_10_GRYF(601)-CO_10_GRYF(931))/(CO_10_GRYF(601)+CO_10_GRYF(931));
INDEX2_COF_10_GRYF = (COF_10_GRYF(601)-COF_10_GRYF(931))/(COF_10_GRYF(601)+COF_10_GRYF(931));
INDEX2_K_10_GRYF = (K_10_GRYF(601)-K_10_GRYF(931))/(K_10_GRYF(601)+K_10_GRYF(931));
INDEX2_OJ_10_GRYF = (OJ_10_GRYF(601)-OJ_10_GRYF(931))/(OJ_10_GRYF(601)+OJ_10_GRYF(931));
INDEX2_PD_10_GRYF = (PD_10_GRYF(601)-PD_10_GRYF(931))/(PD_10_GRYF(601)+PD_10_GRYF(931));
INDEX2_RW_10_GRYF = (RW_10_GRYF(601)-RW_10_GRYF(931))/(RW_10_GRYF(601)+RW_10_GRYF(931));
INDEX2_T_10_GRYF = (T_10_GRYF(601)-T_10_GRYF(931))/(T_10_GRYF(601)+T_10_GRYF(931));
INDEX2_TS_10_GRYF = (TS_10_GRYF(601)-TS_10_GRYF(851))/(TS_10_GRYF(601)+TS_10_GRYF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(111, INDEX2_blood_10_GRYF, 'r', 'filled');

h(1) = plot(112, INDEX2_AVD_10_GRYF, '*');
h(2) = plot(113, INDEX2_CO_10_GRYF, '*');
h(3) = plot(114, INDEX2_COF_10_GRYF, '*');
h(4) = plot(115, INDEX2_K_10_GRYF, '*');
h(5) = plot(116, INDEX2_OJ_10_GRYF, '*');
h(6) = plot(117, INDEX2_PD_10_GRYF, '*');
h(7) = plot(118, INDEX2_RW_10_GRYF, '*');
h(8) = plot(119, INDEX2_T_10_GRYF, '*');
h(9) = plot(120, INDEX2_TS_10_GRYF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

%%%%%% 18ML %%
INDEX2_blood_18_GRYF = (blood_18_GRYF(601)-blood_18_GRYF(931))/(blood_18_GRYF(601)+blood_18_GRYF(931));
INDEX2_AVD_18_GRYF = (AVD_18_GRYF(601)-AVD_18_GRYF(931))/(AVD_18_GRYF(601)+AVD_18_GRYF(931));
INDEX2_CO_18_GRYF = (CO_18_GRYF(601)-CO_18_GRYF(931))/(CO_18_GRYF(601)+CO_18_GRYF(931));
INDEX2_COF_18_GRYF = (COF_18_GRYF(601)-COF_18_GRYF(931))/(COF_18_GRYF(601)+COF_18_GRYF(931));
INDEX2_K_18_GRYF = (K_18_GRYF(601)-K_18_GRYF(931))/(K_18_GRYF(601)+K_18_GRYF(931));
INDEX2_OJ_18_GRYF = (OJ_18_GRYF(601)-OJ_18_GRYF(931))/(OJ_18_GRYF(601)+OJ_18_GRYF(931));
INDEX2_PD_18_GRYF = (PD_18_GRYF(601)-PD_18_GRYF(931))/(PD_18_GRYF(601)+PD_18_GRYF(931));
INDEX2_RW_18_GRYF = (RW_18_GRYF(601)-RW_18_GRYF(931))/(RW_18_GRYF(601)+RW_18_GRYF(931));
INDEX2_T_18_GRYF = (T_18_GRYF(601)-T_18_GRYF(931))/(T_18_GRYF(601)+T_18_GRYF(931));
INDEX2_TS_18_GRYF = (TS_18_GRYF(601)-TS_18_GRYF(851))/(TS_18_GRYF(601)+TS_18_GRYF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(121, INDEX2_blood_18_GRYF, 'r', 'filled');

h(1) = plot(122, INDEX2_AVD_18_GRYF, '*');
h(2) = plot(123, INDEX2_CO_18_GRYF, '*');
h(3) = plot(124, INDEX2_COF_18_GRYF, '*');
h(4) = plot(125, INDEX2_K_18_GRYF, '*');
h(5) = plot(126, INDEX2_OJ_18_GRYF, '*');
h(6) = plot(127, INDEX2_PD_18_GRYF, '*');
h(7) = plot(128, INDEX2_RW_18_GRYF, '*');
h(8) = plot(129, INDEX2_T_18_GRYF, '*');
h(9) = plot(130, INDEX2_TS_18_GRYF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


%%%%%% 30ML %%
INDEX2_blood_30_GRYF = (blood_30_GRYF(601)-blood_30_GRYF(931))/(blood_30_GRYF(601)+blood_30_GRYF(931));
INDEX2_AVD_30_GRYF = (AVD_30_GRYF(601)-AVD_30_GRYF(931))/(AVD_30_GRYF(601)+AVD_30_GRYF(931));
INDEX2_CO_30_GRYF = (CO_30_GRYF(601)-CO_30_GRYF(931))/(CO_30_GRYF(601)+CO_30_GRYF(931));
INDEX2_COF_30_GRYF = (COF_30_GRYF(601)-COF_30_GRYF(931))/(COF_30_GRYF(601)+COF_30_GRYF(931));
INDEX2_K_30_GRYF = (K_30_GRYF(601)-K_30_GRYF(931))/(K_30_GRYF(601)+K_30_GRYF(931));
INDEX2_OJ_30_GRYF = (OJ_30_GRYF(601)-OJ_30_GRYF(931))/(OJ_30_GRYF(601)+OJ_30_GRYF(931));
INDEX2_PD_30_GRYF = (PD_30_GRYF(601)-PD_30_GRYF(931))/(PD_30_GRYF(601)+PD_30_GRYF(931));
INDEX2_RW_30_GRYF = (RW_30_GRYF(601)-RW_30_GRYF(931))/(RW_30_GRYF(601)+RW_30_GRYF(931));
INDEX2_T_30_GRYF = (T_30_GRYF(601)-T_30_GRYF(931))/(T_30_GRYF(601)+T_30_GRYF(931));
INDEX2_TS_30_GRYF = (TS_30_GRYF(601)-TS_30_GRYF(851))/(TS_30_GRYF(601)+TS_30_GRYF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(131, INDEX2_blood_30_GRYF, 'r', 'filled');

h(1) = plot(132, INDEX2_AVD_30_GRYF, '*');
h(2) = plot(133, INDEX2_CO_30_GRYF, '*');
h(3) = plot(134, INDEX2_COF_30_GRYF, '*');
h(4) = plot(135, INDEX2_K_30_GRYF, '*');
h(5) = plot(136, INDEX2_OJ_30_GRYF, '*');
h(6) = plot(137, INDEX2_PD_30_GRYF, '*');
h(7) = plot(138, INDEX2_RW_30_GRYF, '*');
h(8) = plot(139, INDEX2_T_30_GRYF, '*');
h(9) = plot(140, INDEX2_TS_30_GRYF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);



%%%%%% 40ML %%
INDEX2_blood_40_GRYF = (blood_40_GRYF(601)-blood_40_GRYF(931))/(blood_40_GRYF(601)+blood_40_GRYF(931));
INDEX2_AVD_40_GRYF = (AVD_40_GRYF(601)-AVD_40_GRYF(931))/(AVD_40_GRYF(601)+AVD_40_GRYF(931));
INDEX2_CO_40_GRYF = (CO_40_GRYF(601)-CO_40_GRYF(931))/(CO_40_GRYF(601)+CO_40_GRYF(931));
INDEX2_COF_40_GRYF = (COF_40_GRYF(601)-COF_40_GRYF(931))/(COF_40_GRYF(601)+COF_40_GRYF(931));
INDEX2_K_40_GRYF = (K_40_GRYF(601)-K_40_GRYF(931))/(K_40_GRYF(601)+K_40_GRYF(931));
INDEX2_OJ_40_GRYF = (OJ_40_GRYF(601)-OJ_40_GRYF(931))/(OJ_40_GRYF(601)+OJ_40_GRYF(931));
INDEX2_PD_40_GRYF = (PD_40_GRYF(601)-PD_40_GRYF(931))/(PD_40_GRYF(601)+PD_40_GRYF(931));
INDEX2_RW_40_GRYF = (RW_40_GRYF(601)-RW_40_GRYF(931))/(RW_40_GRYF(601)+RW_40_GRYF(931));
INDEX2_T_40_GRYF = (T_40_GRYF(601)-T_40_GRYF(931))/(T_40_GRYF(601)+T_40_GRYF(931));
INDEX2_TS_40_GRYF = (TS_40_GRYF(601)-TS_40_GRYF(851))/(TS_40_GRYF(601)+TS_40_GRYF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(141, INDEX2_blood_40_GRYF, 'r', 'filled');

h(1) = plot(142, INDEX2_AVD_40_GRYF, '*');
h(2) = plot(143, INDEX2_CO_40_GRYF, '*');
h(3) = plot(144, INDEX2_COF_40_GRYF, '*');
h(4) = plot(145, INDEX2_K_40_GRYF, '*');
h(5) = plot(146, INDEX2_OJ_40_GRYF, '*');
h(6) = plot(147, INDEX2_PD_40_GRYF, '*');
h(7) = plot(148, INDEX2_RW_40_GRYF, '*');
h(8) = plot(149, INDEX2_T_40_GRYF, '*');
h(9) = plot(150, INDEX2_TS_40_GRYF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);






%%%%%%%%%%%%%%%%%   GREEN Felt   %%%%%%%%%%%%%%%%%%%%
INDEX2_blood_4_GRNF = (blood_4_GRNF(601)-blood_4_GRNF(931))/(blood_4_GRNF(601)+blood_4_GRNF(931));
INDEX2_AVD_4_GRNF = (AVD_4_GRNF(601)-AVD_4_GRNF(931))/(AVD_4_GRNF(601)+AVD_4_GRNF(931));
INDEX2_CO_4_GRNF = (CO_4_GRNF(601)-CO_4_GRNF(931))/(CO_4_GRNF(601)+CO_4_GRNF(931));
INDEX2_COF_4_GRNF = (COF_4_GRNF(601)-COF_4_GRNF(931))/(COF_4_GRNF(601)+COF_4_GRNF(931));
INDEX2_K_4_GRNF = (K_4_GRNF(601)-K_4_GRNF(851))/(K_4_GRNF(601)+K_4_GRNF(851));
INDEX2_OJ_4_GRNF = (OJ_4_GRNF(601)-OJ_4_GRNF(931))/(OJ_4_GRNF(601)+OJ_4_GRNF(931));
INDEX2_PD_4_GRNF = (PD_4_GRNF(601)-PD_4_GRNF(931))/(PD_4_GRNF(601)+PD_4_GRNF(931));
INDEX2_RW_4_GRNF = (RW_4_GRNF(601)-RW_4_GRNF(931))/(RW_4_GRNF(601)+RW_4_GRNF(931));
INDEX2_T_4_GRNF = (T_4_GRNF(601)-T_4_GRNF(931))/(T_4_GRNF(601)+T_4_GRNF(931));
INDEX2_TS_4_GRNF = (TS_4_GRNF(601)-TS_4_GRNF(931))/(TS_4_GRNF(601)+TS_4_GRNF(931));%INDEX1_TS2_GRYF = (TS2_GRYF(601)-TS2_GRYF(851))/(TS2_GRYF(601)+TS2_GRYF(851));
%INDEX1_GRNF4 = [ INDEX1_AVD4_GRNF INDEX1_CS4_GRNF INDEX1_C4_GRNF INDEX1_OJ4_GRNF INDEX1_PD4_GRNF INDEX1_RW4_GRNF INDEX1_T4_GRNF INDEX1_TS4_GRNF];
%plot(82:89, INDEX1_GRYF4, 'B*');
scatter(151, INDEX2_blood_4_GRNF, 'r', 'filled');



h(1) = plot(152, INDEX2_AVD_4_GRNF, '*');
h(2) = plot(153, INDEX2_CO_4_GRNF, '*');
h(3) = plot(154, INDEX2_COF_4_GRNF, '*');
h(4) = plot(155, INDEX2_K_4_GRNF, '*');
h(5) = plot(156, INDEX2_OJ_4_GRNF, '*');
h(6) = plot(157, INDEX2_PD_4_GRNF, '*');
h(7) = plot(158, INDEX2_RW_4_GRNF, '*');
h(8) = plot(159, INDEX2_T_4_GRNF, '*');
h(9) = plot(160, INDEX2_TS_4_GRNF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

%{
INDEX2_blood_8_GRNF = (blood_8_GRNF(601)-blood_8_GRNF(931))/(blood_8_GRNF(601)+blood_8_GRNF(931));
INDEX2_AVD8_GRNF = (AVD8_GRNF(601)-AVD8_GRNF(931))/(AVD8_GRNF(601)+AVD8_GRNF(931));
INDEX2_CS8_GRNF = (CS8_GRNF(601)-CS8_GRNF(931))/(CS8_GRNF(601)+CS8_GRNF(931));
INDEX2_C8_GRNF = (C8_GRNF(601)-C8_GRNF(931))/(C8_GRNF(601)+C8_GRNF(931));
INDEX2_OJ8_GRNF = (OJ8_GRNF(601)-OJ8_GRNF(931))/(OJ8_GRNF(601)+OJ8_GRNF(931));
INDEX2_PD8_GRNF = (PD8_GRNF(601)-PD8_GRNF(931))/(PD8_GRNF(601)+PD8_GRNF(931));
INDEX2_RW8_GRNF = (RW8_GRNF(601)-RW8_GRNF(931))/(RW8_GRNF(601)+RW8_GRNF(931));
INDEX2_T8_GRNF = (T8_GRNF(601)-T8_GRNF(931))/(T8_GRNF(601)+T8_GRNF(931));
%INDEX1_GRNF8 = [ INDEX1_AVD8_GRNF INDEX1_CS8_GRNF INDEX1_C8_GRNF INDEX1_OJ8_GRNF INDEX1_PD8_GRNF INDEX1_RW8_GRNF INDEX1_T8_GRNF];
%plot(92:98, INDEX1_GRNF8, 'B*');
scatter(181, INDEX2_blood_8_GRNF, 'r', 'filled');


h(1) = plot(182, INDEX2_AVD8_GRNF, '*');
h(2) = plot(183, INDEX2_CS8_GRNF, '*');
h(3) = plot(184, INDEX2_C8_GRNF, '*');
%h(4) = plot(45, INDEX1_K4_BLKF, '*');
h(5) = plot(186, INDEX2_OJ8_GRNF, '*');
h(6) = plot(187, INDEX2_PD8_GRNF, '*');
h(7) = plot(188, INDEX2_RW8_GRNF, '*');
h(8) = plot(189, INDEX2_T8_GRNF, '*');
%h(9) = plot(100, INDEX1_TS8_GRNF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
%set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
%set(h(9), 'color', [0.5 0.8 1]);
%}




%%%%%% 10ML %%
INDEX2_blood_10_GRNF = (blood_10_GRNF(601)-blood_10_GRNF(931))/(blood_10_GRNF(601)+blood_10_GRNF(931));
INDEX2_AVD_10_GRNF = (AVD_10_GRNF(601)-AVD_10_GRNF(931))/(AVD_10_GRNF(601)+AVD_10_GRNF(931));
INDEX2_CO_10_GRNF = (CO_10_GRNF(601)-CO_10_GRNF(931))/(CO_10_GRNF(601)+CO_10_GRNF(931));
INDEX2_COF_10_GRNF = (COF_10_GRNF(601)-COF_10_GRNF(931))/(COF_10_GRNF(601)+COF_10_GRNF(931));
INDEX2_K_10_GRNF = (K_10_GRNF(601)-K_10_GRNF(931))/(K_10_GRNF(601)+K_10_GRNF(931));
INDEX2_OJ_10_GRNF = (OJ_10_GRNF(601)-OJ_10_GRNF(931))/(OJ_10_GRNF(601)+OJ_10_GRNF(931));
INDEX2_PD_10_GRNF = (PD_10_GRNF(601)-PD_10_GRNF(931))/(PD_10_GRNF(601)+PD_10_GRNF(931));
INDEX2_RW_10_GRNF = (RW_10_GRNF(601)-RW_10_GRNF(931))/(RW_10_GRNF(601)+RW_10_GRNF(931));
INDEX2_T_10_GRNF = (T_10_GRNF(601)-T_10_GRNF(931))/(T_10_GRNF(601)+T_10_GRNF(931));
INDEX2_TS_10_GRNF = (TS_10_GRNF(601)-TS_10_GRNF(851))/(TS_10_GRNF(601)+TS_10_GRNF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(161, INDEX2_blood_10_GRNF, 'r', 'filled');

h(1) = plot(162, INDEX2_AVD_10_GRNF, '*');
h(2) = plot(163, INDEX2_CO_10_GRNF, '*');
h(3) = plot(164, INDEX2_COF_10_GRNF, '*');
h(4) = plot(165, INDEX2_K_10_GRNF, '*');
h(5) = plot(166, INDEX2_OJ_10_GRNF, '*');
h(6) = plot(167, INDEX2_PD_10_GRNF, '*');
h(7) = plot(168, INDEX2_RW_10_GRNF, '*');
h(8) = plot(169, INDEX2_T_10_GRNF, '*');
h(9) = plot(170, INDEX2_TS_10_GRNF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);

%%%%%% 18ML %%
INDEX2_blood_18_GRNF = (blood_18_GRNF(601)-blood_18_GRNF(931))/(blood_18_GRNF(601)+blood_18_GRNF(931));
INDEX2_AVD_18_GRNF = (AVD_18_GRNF(601)-AVD_18_GRNF(931))/(AVD_18_GRNF(601)+AVD_18_GRNF(931));
INDEX2_CO_18_GRNF = (CO_18_GRNF(601)-CO_18_GRNF(931))/(CO_18_GRNF(601)+CO_18_GRNF(931));
INDEX2_COF_18_GRNF = (COF_18_GRNF(601)-COF_18_GRNF(931))/(COF_18_GRNF(601)+COF_18_GRNF(931));
INDEX2_K_18_GRNF = (K_18_GRNF(601)-K_18_GRNF(931))/(K_18_GRNF(601)+K_18_GRNF(931));
INDEX2_OJ_18_GRNF = (OJ_18_GRNF(601)-OJ_18_GRNF(931))/(OJ_18_GRNF(601)+OJ_18_GRNF(931));
INDEX2_PD_18_GRNF = (PD_18_GRNF(601)-PD_18_GRNF(931))/(PD_18_GRNF(601)+PD_18_GRNF(931));
INDEX2_RW_18_GRNF = (RW_18_GRNF(601)-RW_18_GRNF(931))/(RW_18_GRNF(601)+RW_18_GRNF(931));
INDEX2_T_18_GRNF = (T_18_GRNF(601)-T_18_GRNF(931))/(T_18_GRNF(601)+T_18_GRNF(931));
INDEX2_TS_18_GRNF = (TS_18_GRNF(601)-TS_18_GRNF(851))/(TS_18_GRNF(601)+TS_18_GRNF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(171, INDEX2_blood_18_GRNF, 'r', 'filled');

h(1) = plot(172, INDEX2_AVD_18_GRNF, '*');
h(2) = plot(173, INDEX2_CO_18_GRNF, '*');
h(3) = plot(174, INDEX2_COF_18_GRNF, '*');
h(4) = plot(175, INDEX2_K_18_GRNF, '*');
h(5) = plot(176, INDEX2_OJ_18_GRNF, '*');
h(6) = plot(177, INDEX2_PD_18_GRNF, '*');
h(7) = plot(178, INDEX2_RW_18_GRNF, '*');
h(8) = plot(179, INDEX2_T_18_GRNF, '*');
h(9) = plot(180, INDEX2_TS_18_GRNF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);


%%%%%% 30ML %%
INDEX2_blood_30_GRNF = (blood_30_GRNF(601)-blood_30_GRNF(931))/(blood_30_GRNF(601)+blood_30_GRNF(931));
INDEX2_AVD_30_GRNF = (AVD_30_GRNF(601)-AVD_30_GRNF(931))/(AVD_30_GRNF(601)+AVD_30_GRNF(931));
INDEX2_CO_30_GRNF = (CO_30_GRNF(601)-CO_30_GRNF(931))/(CO_30_GRNF(601)+CO_30_GRNF(931));
INDEX2_COF_30_GRNF = (COF_30_GRNF(601)-COF_30_GRNF(931))/(COF_30_GRNF(601)+COF_30_GRNF(931));
INDEX2_K_30_GRNF = (K_30_GRNF(601)-K_30_GRNF(931))/(K_30_GRNF(601)+K_30_GRNF(931));
INDEX2_OJ_30_GRNF = (OJ_30_GRNF(601)-OJ_30_GRNF(931))/(OJ_30_GRNF(601)+OJ_30_GRNF(931));
INDEX2_PD_30_GRNF = (PD_30_GRNF(601)-PD_30_GRNF(931))/(PD_30_GRNF(601)+PD_30_GRNF(931));
INDEX2_RW_30_GRNF = (RW_30_GRNF(601)-RW_30_GRNF(931))/(RW_30_GRNF(601)+RW_30_GRNF(931));
INDEX2_T_30_GRNF = (T_30_GRNF(601)-T_30_GRNF(931))/(T_30_GRNF(601)+T_30_GRNF(931));
INDEX2_TS_30_GRNF = (TS_30_GRNF(601)-TS_30_GRNF(851))/(TS_30_GRNF(601)+TS_30_GRNF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(181, INDEX2_blood_30_GRNF, 'r', 'filled');

h(1) = plot(182, INDEX2_AVD_30_GRNF, '*');
h(2) = plot(183, INDEX2_CO_30_GRNF, '*');
h(3) = plot(184, INDEX2_COF_30_GRNF, '*');
h(4) = plot(185, INDEX2_K_30_GRNF, '*');
h(5) = plot(186, INDEX2_OJ_30_GRNF, '*');
h(6) = plot(187, INDEX2_PD_30_GRNF, '*');
h(7) = plot(188, INDEX2_RW_30_GRNF, '*');
h(8) = plot(189, INDEX2_T_30_GRNF, '*');
h(9) = plot(190, INDEX2_TS_30_GRNF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);



%%%%%% 40ML %%
INDEX2_blood_40_GRNF = (blood_40_GRNF(601)-blood_40_GRNF(931))/(blood_40_GRNF(601)+blood_40_GRNF(931));
INDEX2_AVD_40_GRNF = (AVD_40_GRNF(601)-AVD_40_GRNF(931))/(AVD_40_GRNF(601)+AVD_40_GRNF(931));
INDEX2_CO_40_GRNF = (CO_40_GRNF(601)-CO_40_GRNF(931))/(CO_40_GRNF(601)+CO_40_GRNF(931));
INDEX2_COF_40_GRNF = (COF_40_GRNF(601)-COF_40_GRNF(931))/(COF_40_GRNF(601)+COF_40_GRNF(931));
INDEX2_K_40_GRNF = (K_40_GRNF(601)-K_40_GRNF(931))/(K_40_GRNF(601)+K_40_GRNF(931));
INDEX2_OJ_40_GRNF = (OJ_40_GRNF(601)-OJ_40_GRNF(931))/(OJ_40_GRNF(601)+OJ_40_GRNF(931));
INDEX2_PD_40_GRNF = (PD_40_GRNF(601)-PD_40_GRNF(931))/(PD_40_GRNF(601)+PD_40_GRNF(931));
INDEX2_RW_40_GRNF = (RW_40_GRNF(601)-RW_40_GRNF(931))/(RW_40_GRNF(601)+RW_40_GRNF(931));
INDEX2_T_40_GRNF = (T_40_GRNF(601)-T_40_GRNF(931))/(T_40_GRNF(601)+T_40_GRNF(931));
INDEX2_TS_40_GRNF = (TS_40_GRNF(601)-TS_40_GRNF(851))/(TS_40_GRNF(601)+TS_40_GRNF(851));
%INDEX1_BLKF8 = [INDEX1_AVD8_BLKF INDEX1_CS8_BLKF INDEX1_C8_BLKF INDEX1_K8_BLKF INDEX1_OJ8_BLKF INDEX1_PD8_BLKF INDEX1_RW8_BLKF INDEX1_T8_BLKF];
%plot(52:59, INDEX1_BLKF8, 'b*');
scatter(191, INDEX2_blood_40_GRNF, 'r', 'filled');

h(1) = plot(192, INDEX2_AVD_40_GRNF, '*');
h(2) = plot(193, INDEX2_CO_40_GRNF, '*');
h(3) = plot(194, INDEX2_COF_40_GRNF, '*');
h(4) = plot(195, INDEX2_K_40_GRNF, '*');
h(5) = plot(196, INDEX2_OJ_40_GRNF, '*');
h(6) = plot(197, INDEX2_PD_40_GRNF, '*');
h(7) = plot(198, INDEX2_RW_40_GRNF, '*');
h(8) = plot(199, INDEX2_T_40_GRNF, '*');
h(9) = plot(200, INDEX2_TS_40_GRNF, '*');


set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);



%%%%%%%%%%%%%%%%%   RED Felt   %%%%%%%%%%%%%%%%%%%%
INDEX2_blood_4_REDF = (blood_4_REDF(601)-blood_4_REDF(931))/(blood_4_REDF(601)+blood_4_REDF(931));
INDEX2_AVD_4_REDF = (AVD_4_REDF(601)-AVD_4_REDF(931))/(AVD_4_REDF(601)+AVD_4_REDF(931));
INDEX2_CO_4_REDF = (CO_4_REDF(601)-CO_4_REDF(931))/(CO_4_REDF(601)+CO_4_REDF(931));
INDEX2_COF_4_REDF = (COF_4_REDF(601)-COF_4_REDF(931))/(COF_4_REDF(601)+COF_4_REDF(931));
%INDEX1_K2_REDF = (K2_REDF(601)-K2_REDF(851))/(K2_REDF(601)+K2_REDF(851));
INDEX2_OJ_4_REDF = (OJ_4_REDF(601)-OJ_4_REDF(931))/(OJ_4_REDF(601)+OJ_4_REDF(931));
INDEX2_PD_4_REDF = (PD_4_REDF(601)-PD_4_REDF(931))/(PD_4_REDF(601)+PD_4_REDF(931));
INDEX2_RW_4_REDF = (RW_4_REDF(601)-RW_4_REDF(931))/(RW_4_REDF(601)+RW_4_REDF(931));
INDEX2_T_4_REDF = (T_4_REDF(601)-T_4_REDF(931))/(T_4_REDF(601)+T_4_REDF(931));
INDEX2_TS_4_REDF = (TS_4_REDF(601)-TS_4_REDF(931))/(TS_4_REDF(601)+TS_4_REDF(931));%INDEX1_TS2_REDF = (TS2_REDF(601)-TS2_REDF(851))/(TS2_REDF(601)+TS2_REDF(851));
%INDEX1_REDF4 = [INDEX1_AVD4_REDF INDEX1_CS4_REDF INDEX1_C4_REDF INDEX1_OJ4_REDF INDEX1_PD4_REDF INDEX1_RW4_REDF INDEX1_T4_REDF INDEX1_TS4_REDF];
%plot(102:109, INDEX1_REDF4, 'B*');
scatter(201, INDEX2_blood_4_REDF, 'r', 'filled');

h(1) = plot(202, INDEX2_AVD_4_REDF, '*');
h(2) = plot(203, INDEX2_CO_4_REDF, '*');
h(3) = plot(204, INDEX2_COF_4_REDF, '*');
%h(4) = plot(45, INDEX1_K4_BLKF, '*');
h(5) = plot(206, INDEX2_OJ_4_REDF, '*');
h(6) = plot(207, INDEX2_PD_4_REDF, '*');
h(7) = plot(208, INDEX2_RW_4_REDF, '*');
h(8) = plot(209, INDEX2_T_4_REDF, '*');
h(9) = plot(210, INDEX2_TS_4_REDF, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
%set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);




INDEX2_blood_8_REDF = (blood_8_REDF(601)-blood_8_REDF(931))/(blood_8_REDF(601)+blood_8_REDF(931));
INDEX2_AVD_8_REDF = (AVD_8_REDF(601)-AVD_8_REDF(931))/(AVD_8_REDF(601)+AVD_8_REDF(931));
INDEX2_CO_8_REDF = (CO_8_REDF(601)-CO_8_REDF(931))/(CO_8_REDF(601)+CO_8_REDF(931));
INDEX2_COF_8_REDF = (COF_8_REDF(601)-COF_8_REDF(931))/(COF_8_REDF(601)+COF_8_REDF(931));
INDEX2_OJ_8_REDF = (OJ_8_REDF(601)-OJ_8_REDF(931))/(OJ_8_REDF(601)+OJ_8_REDF(931));
INDEX2_PD_8_REDF = (PD_8_REDF(601)-PD_8_REDF(931))/(PD_8_REDF(601)+PD_8_REDF(931));
INDEX2_RW_8_REDF = (RW_8_REDF(601)-RW_8_REDF(931))/(RW_8_REDF(601)+RW_8_REDF(931));
INDEX2_T_8_REDF = (T_8_REDF(601)-T_8_REDF(931))/(T_8_REDF(601)+T_8_REDF(931));
%INDEX2_TS_8_REDF = (TS_8_REDF(601)-T_8_REDF(931))/(T_8_REDF(601)+T_8_REDF(931));
%[INDEX1_AVD8_REDF INDEX1_CS8_REDF INDEX1_C8_REDF INDEX1_OJ8_REDF INDEX1_PD8_REDF INDEX1_RW8_REDF INDEX1_T8_REDF];
%plot(112:118, INDEX1_REDF8, 'B*');
scatter(211, INDEX2_blood_8_REDF, 'r', 'filled');



h(1) = plot(212, INDEX2_AVD_8_REDF, '*');
h(2) = plot(213, INDEX2_CO_8_REDF, '*');
h(3) = plot(214, INDEX2_COF_8_REDF, '*');
%h(4) = plot(45, INDEX1_K4_BLKF, '*');
h(5) = plot(216, INDEX2_OJ_8_REDF, '*');
h(6) = plot(217, INDEX2_PD_8_REDF, '*');
h(7) = plot(218, INDEX2_RW_8_REDF, '*');
h(8) = plot(219, INDEX2_T_8_REDF, '*');
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



%%%%%%%%%%%%%%%%%   COTTON T-SHIRT   %%%%%%%%%%%%%%%%%%%%



INDEX2_blood_2_COTNT = (blood_2_COTNT(601)-blood_2_COTNT(931))/(blood_2_COTNT(601)+blood_2_COTNT(931));
INDEX2_AVD_2_COTNT = (AVD_2_COTNT(601)-AVD_2_COTNT(931))/(AVD_2_COTNT(601)+AVD_2_COTNT(931));
INDEX2_CO_2_COTNT = (CO_2_COTNT(601)-CO_2_COTNT(931))/(CO_2_COTNT(601)+CO_2_COTNT(931));
INDEX2_COF_2_COTNT = (COF_2_COTNT(601)-COF_2_COTNT(931))/(COF_2_COTNT(601)+COF_2_COTNT(931));
INDEX2_K_2_COTNT = (K_2_COTNT(601)-K_2_COTNT(931))/(K_2_COTNT(601)+K_2_COTNT(931));
INDEX2_OJ_2_COTNT = (OJ_2_COTNT(601)-OJ_2_COTNT(931))/(OJ_2_COTNT(601)+OJ_2_COTNT(931));
INDEX2_PD_2_COTNT = (PD_2_COTNT(601)-PD_2_COTNT(931))/(PD_2_COTNT(601)+PD_2_COTNT(931));
INDEX2_RW_2_COTNT = (RW_2_COTNT(601)-RW_2_COTNT(931))/(RW_2_COTNT(601)+RW_2_COTNT(931));
INDEX2_T_2_COTNT = (T_2_COTNT(601)-T_2_COTNT(931))/(T_2_COTNT(601)+T_2_COTNT(931));
INDEX2_TS_2_COTNT = (TS_2_COTNT(601)-TS_2_COTNT(931))/(TS_2_COTNT(601)+TS_2_COTNT(931));
%INDEX1_COTNT = [INDEX1_AVD2_COTNT INDEX1_CS2_COTNT INDEX1_C2_COTNT INDEX1_K2_COTNT INDEX1_OJ2_COTNT INDEX1_PD2_COTNT INDEX1_RW2_COTNT INDEX1_T2_COTNT INDEX1_TS2_COTNT];
%plot(122:130, INDEX1_COTNT, 'B*');
scatter(221, INDEX2_blood_2_COTNT, 'r', 'filled');


h(1) = plot(222, INDEX2_AVD_2_COTNT, '*');
h(2) = plot(223, INDEX2_CO_2_COTNT, '*');
h(3) = plot(224, INDEX2_COF_2_COTNT, '*');
h(4) = plot(225, INDEX2_K_2_COTNT, '*');
h(5) = plot(226, INDEX2_OJ_2_COTNT, '*');
h(6) = plot(227, INDEX2_PD_2_COTNT, '*');
h(7) = plot(228, INDEX2_RW_2_COTNT, '*');
h(8) = plot(229, INDEX2_T_2_COTNT, '*');
h(9) = plot(230, INDEX2_TS_2_COTNT, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);





%%%%%%%%%%%%%%%%%   POLYESTER T-shirt   %%%%%%%%%%%%%%%%%%%%

INDEX2_blood_2_POLY = (blood_2_POLY(601)-blood_2_POLY(931))/(blood_2_POLY(601)+blood_2_POLY(931));
INDEX2_AVD_2_POLY = (AVD_2_POLY(601)-AVD_2_POLY(931))/(AVD_2_POLY(601)+AVD_2_POLY(931));
INDEX2_CO_2_POLY = (CO_2_POLY(601)-CO_2_POLY(931))/(CO_2_POLY(601)+CO_2_POLY(931));
INDEX2_COF_2_POLY = (COF_2_POLY(601)-COF_2_POLY(931))/(COF_2_POLY(601)+COF_2_POLY(931));
INDEX2_K_2_POLY = (K_2_POLY(601)-K_2_POLY(931))/(K_2_POLY(601)+K_2_POLY(931));
INDEX2_OJ_2_POLY = (OJ_2_POLY(601)-OJ_2_POLY(931))/(OJ_2_POLY(601)+OJ_2_POLY(931));
INDEX2_PD_2_POLY = (PD_2_POLY(601)-PD_2_POLY(931))/(PD_2_POLY(601)+PD_2_POLY(931));
INDEX2_RW_2_POLY = (RW_2_POLY(601)-RW_2_POLY(931))/(RW_2_POLY(601)+RW_2_POLY(931));
INDEX2_T_2_POLY = (T_2_POLY(601)-T_2_POLY(931))/(T_2_POLY(601)+T_2_POLY(931));
INDEX2_TS_2_POLY = (TS_2_POLY(601)-TS_2_POLY(931))/(TS_2_POLY(601)+TS_2_POLY(931));
%INDEX1_POLY = [INDEX1_AVD2_POLY INDEX1_CS2_POLY INDEX1_C2_POLY INDEX1_K2_POLY INDEX1_OJ2_POLY INDEX1_PD2_POLY INDEX1_RW2_POLY INDEX1_T2_POLY INDEX1_TS2_POLY];
%plot(132:140, INDEX1_POLY, 'B*');
scatter(231, INDEX2_blood_2_POLY, 'r', 'filled');

h(1) = plot(232, INDEX2_AVD_2_POLY, '*');
h(2) = plot(233, INDEX2_CO_2_POLY, '*');
h(3) = plot(234, INDEX2_COF_2_POLY, '*');
h(4) = plot(235, INDEX2_K_2_POLY, '*');
h(5) = plot(236, INDEX2_OJ_2_POLY, '*');
h(6) = plot(237, INDEX2_PD_2_POLY, '*');
h(7) = plot(238, INDEX2_RW_2_POLY, '*');
h(8) = plot(239, INDEX2_T_2_POLY, '*');
h(9) = plot(240, INDEX2_TS_2_POLY, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);




%%%%%%%%%%%%%%%%%   JEANS   %%%%%%%%%%%%%%%%%%%%
INDEX2_blood_2_J = (blood_2_J(601)-blood_2_J(931))/(blood_2_J(601)+blood_2_J(931));
INDEX2_AVD_2_J = (AVD_2_J(601)-AVD_2_J(931))/(AVD_2_J(601)+AVD_2_J(931));
INDEX2_CO_2_J = (CO_2_J(601)-CO_2_J(931))/(CO_2_J(601)+CO_2_J(931));
INDEX2_COF_2_J = (COF_2_J(601)-COF_2_J(931))/(COF_2_J(601)+COF_2_J(931));
INDEX2_K_2_J = (K_2_J(601)-K_2_J(931))/(K_2_J(601)+K_2_J(931));
INDEX2_OJ_2_J = (OJ_2_J(601)-OJ_2_J(931))/(OJ_2_J(601)+OJ_2_J(931));
INDEX2_PD_2_J = (PD_2_J(601)-PD_2_J(931))/(PD_2_J(601)+PD_2_J(931));
INDEX2_RW_2_J = (RW_2_J(601)-RW_2_J(931))/(RW_2_J(601)+RW_2_J(931));
INDEX2_T_2_J = (T_2_J(601)-T_2_J(931))/(T_2_J(601)+T_2_J(931));
INDEX2_TS_2_J = (TS_2_J(601)-TS_2_J(931))/(TS_2_J(601)+TS_2_J(931));
%INDEX1_J = [INDEX1_AVD2_J INDEX1_CS2_J INDEX1_C2_J INDEX1_K2_J INDEX1_OJ2_J INDEX1_PD2_J INDEX1_RW2_J INDEX1_T2_J INDEX1_TS2_J];
%plot(142:150, INDEX1_J, 'B*');
scatter(241, INDEX2_blood_2_J, 'r', 'filled');


h(1) = plot(242, INDEX2_AVD_2_J, '*');
h(2) = plot(243, INDEX2_CO_2_J, '*');
h(3) = plot(244, INDEX2_COF_2_J, '*');
h(4) = plot(245, INDEX2_K_2_J, '*');
h(5) = plot(246, INDEX2_OJ_2_J, '*');
h(6) = plot(247, INDEX2_PD_2_J, '*');
h(7) = plot(248, INDEX2_RW_2_J, '*');
h(8) = plot(249, INDEX2_T_2_J, '*');
h(9) = plot(250, INDEX2_TS_2_J, '*');

set(h(1), 'color', [0 1 0]);
set(h(2), 'color', [0 0 1]);
set(h(3), 'color', [1 1 0]);
set(h(4), 'color', [0 1 1]);
set(h(5), 'color', [0.5 0 1]);
set(h(6), 'color', [0 0 0]);
set(h(7), 'color', [1 0.5 0]);
set(h(8), 'color', [0 0.5 1]);
set(h(9), 'color', [0.5 0.8 1]);



%%%%%%%%%%%%%%%%%   WOOD   %%%%%%%%%%%%%%%%%%%%
INDEX2_blood_1_W = (blood_1_WOOD(601)-blood_1_WOOD(931))/(blood_1_WOOD(601)+blood_1_WOOD(931));
INDEX2_AVD_1_W = (AVD_1_WOOD(601)-AVD_1_WOOD(931))/(AVD_1_WOOD(601)+AVD_1_WOOD(931));
INDEX2_CO_1_W = (CO_1_WOOD(601)-CO_1_WOOD(931))/(CO_1_WOOD(601)+CO_1_WOOD(931));
INDEX2_COF_1_W = (COF_1_WOOD(601)-COF_1_WOOD(931))/(COF_1_WOOD(601)+COF_1_WOOD(931));
INDEX2_K_1_W = (K_1_WOOD(601)-K_1_WOOD(931))/(K_1_WOOD(601)+K_1_WOOD(931));
INDEX2_OJ_1_W = (OJ_1_WOOD(601)-OJ_1_WOOD(931))/(OJ_1_WOOD(601)+OJ_1_WOOD(931));
INDEX2_PD_1_W = (PD_1_WOOD(601)-PD_1_WOOD(931))/(PD_1_WOOD(601)+PD_1_WOOD(931));
INDEX2_RW_1_W = (RW_1_WOOD(601)-RW_1_WOOD(931))/(RW_1_WOOD(601)+RW_1_WOOD(931));
INDEX2_T_1_W = (T_1_WOOD(601)-T_1_WOOD(931))/(T_1_WOOD(601)+T_1_WOOD(931));
INDEX2_TS_1_W = (TS_1_WOOD(601)-TS_1_WOOD(931))/(TS_1_WOOD(601)+TS_1_WOOD(931));
%INDEX1_W = [INDEX1_AVD1_W INDEX1_CS1_W INDEX1_C1_W INDEX1_K1_W INDEX1_OJ1_W INDEX1_PD1_W INDEX1_RW1_W INDEX1_T1_W INDEX1_TS1_W];
%plot(152:160, INDEX1_W, 'B*');
scatter(251, INDEX2_blood_1_W, 'r', 'filled');

h(1) = plot(252, INDEX2_AVD_1_W, '*');
h(2) = plot(253, INDEX2_CO_1_W, '*');
h(3) = plot(254, INDEX2_COF_1_W, '*');
h(4) = plot(255, INDEX2_K_1_W, '*');
h(5) = plot(256, INDEX2_OJ_1_W, '*');
h(6) = plot(257, INDEX2_PD_1_W, '*');
h(7) = plot(258, INDEX2_RW_1_W, '*');
h(8) = plot(259, INDEX2_T_1_W, '*');
h(9) = plot(260, INDEX2_TS_1_W, '*');

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
plot(0:0.1:260, -0.1, 'r-');
text(-8, -0.1, '-0.1');



mTB1 = uicontrol('style', 'text');% mTextBox1 = mTB1
set(mTB1, 'String', '4ML In PD')
set(mTB1, 'Units', 'Characters')
set(mTB1, 'FontSize', 10)
set(mTB1, 'Position', [19 40 3.9 4])
set(mTB1, 'BackgroundColor', [1 1 1])


mTB2 = uicontrol('style', 'text');
set(mTB2, 'String', '10ML In PD')
set(mTB2, 'Units', 'Characters')
set(mTB2, 'FontSize', 10)
set(mTB2, 'Position', [23 40 3.9 4])
set(mTB2, 'BackgroundColor', [1 1 1])

mTB3 = uicontrol('style', 'text');
set(mTB3, 'String', '18ML In PD')
set(mTB3, 'Units', 'Characters')
set(mTB3, 'FontSize', 10)
set(mTB3, 'Position', [27 40 3.9 4])
set(mTB3, 'BackgroundColor', [1 1 1])

 mTB4 = uicontrol('style', 'text');
set(mTB4, 'String', '30ML In PD')
set(mTB4, 'Units', 'Characters')
set(mTB4, 'FontSize', 10)
set(mTB4, 'Position', [31 40 3.9 4])
set(mTB4, 'BackgroundColor', [1 1 1])


 mTB5 = uicontrol('style', 'text');
set(mTB5, 'String', '40ML In PD')
set(mTB5, 'Units', 'Characters')
set(mTB5, 'FontSize', 10)
set(mTB5, 'Position', [35 40 3.9 4])
set(mTB5, 'BackgroundColor', [1 1 1])


 mTB6 = uicontrol('style', 'text');
set(mTB6, 'String', '4ML On BF')
set(mTB6, 'Units', 'Characters')
set(mTB6, 'FontSize', 10)
set(mTB6, 'Position', [39 40 3.9 4])
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
set(mTB8, 'Position', [43 40 3.9 4])
set(mTB8, 'BackgroundColor', [1 1 1])
 
mTB9 = uicontrol('style', 'text');
set(mTB9, 'String', '18ML On BF')
set(mTB9, 'Units', 'Characters')
set(mTB9, 'FontSize', 10)
set(mTB9, 'Position', [47 40 3.9 4])
set(mTB9, 'BackgroundColor', [1 1 1])

 mTB10 = uicontrol('style', 'text');
set(mTB10, 'String', '30ML On BF')
set(mTB10, 'Units', 'Characters')
set(mTB10, 'FontSize', 10)
set(mTB10, 'Position', [51 40 3.9 4])
set(mTB10, 'BackgroundColor', [1 1 1])

 mTB11 = uicontrol('style', 'text');
set(mTB11, 'String', '40ML On BF')
set(mTB11, 'Units', 'Characters')
set(mTB11, 'FontSize', 10)
set(mTB11, 'Position', [55 40 3.9 4])
set(mTB11, 'BackgroundColor', [1 1 1])

mTB12 = uicontrol('style', 'text');
set(mTB12, 'String', '4ML On GF')
set(mTB12, 'Units', 'Characters')
set(mTB12, 'FontSize', 10)
set(mTB12, 'Position', [59 40 3.9 4])
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
set(mTB14, 'Position', [63 40 3.9 4])
set(mTB14, 'BackgroundColor', [1 1 1])

 mTB15 = uicontrol('style', 'text');
set(mTB15, 'String', '18ML On GF')
set(mTB15, 'Units', 'Characters')
set(mTB15, 'FontSize', 10)
set(mTB15, 'Position', [67 40 3.9 4])
set(mTB15, 'BackgroundColor', [1 1 1])

 mTB16 = uicontrol('style', 'text');
set(mTB16, 'String', '30ML On GF')
set(mTB16, 'Units', 'Characters')
set(mTB16, 'FontSize', 10)
set(mTB16, 'Position', [71 40 3.9 4])
set(mTB16, 'BackgroundColor', [1 1 1])

 mTB17 = uicontrol('style', 'text');
set(mTB17, 'String', '40ML On GF')
set(mTB17, 'Units', 'Characters')
set(mTB17, 'FontSize', 10)
set(mTB17, 'Position', [75 40 3.9 4])
set(mTB17, 'BackgroundColor', [1 1 1])


 mTB18 = uicontrol('style', 'text');
set(mTB18, 'String', '4ML On GRF')
set(mTB18, 'Units', 'Characters')
set(mTB18, 'FontSize', 10)
set(mTB18, 'Position', [79 40 3.9 4])
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
set(mTB20, 'Position', [83 40 3.9 4])
set(mTB20, 'BackgroundColor', [1 1 1])

 mTB21 = uicontrol('style', 'text');
set(mTB21, 'String', '18ML On GRF')
set(mTB21, 'Units', 'Characters')
set(mTB21, 'FontSize', 10)
set(mTB21, 'Position', [87 40 3.9 4])
set(mTB21, 'BackgroundColor', [1 1 1])

 mTB22 = uicontrol('style', 'text');
set(mTB22, 'String', '30ML On GRF')
set(mTB22, 'Units', 'Characters')
set(mTB22, 'FontSize', 10)
set(mTB22, 'Position', [91 40 3.9 4])
set(mTB22, 'BackgroundColor', [1 1 1])


 mTB23 = uicontrol('style', 'text');
set(mTB23, 'String', '40ML On GRF')
set(mTB23, 'Units', 'Characters')
set(mTB23, 'FontSize', 10)
set(mTB23, 'Position', [95 40 3.9 4])
set(mTB23, 'BackgroundColor', [1 1 1])



 mTB24 = uicontrol('style', 'text');
set(mTB24, 'String', '4ML On RF')
set(mTB24, 'Units', 'Characters')
set(mTB24, 'FontSize', 10)
set(mTB24, 'Position', [99 40 3.9 4])
set(mTB24, 'BackgroundColor', [1 1 1])

 mTB25 = uicontrol('style', 'text');
set(mTB25, 'String', '8ML On RF')
set(mTB25, 'Units', 'Characters')
set(mTB25, 'FontSize', 10)
set(mTB25, 'Position', [103 40 3.9 4])
set(mTB25, 'BackgroundColor', [1 1 1])


 mTB26 = uicontrol('style', 'text');
set(mTB26, 'String', '2ML On WhC')
set(mTB26, 'Units', 'Characters')
set(mTB26, 'FontSize', 10)
set(mTB26, 'Position', [107 40 3.9 4])
set(mTB26, 'BackgroundColor', [1 1 1])


 mTB27 = uicontrol('style', 'text');
set(mTB27, 'String', '2ML On WP')
set(mTB27, 'Units', 'Characters')
set(mTB27, 'FontSize', 10)
set(mTB27, 'Position', [111 40 3.9 4])
set(mTB27, 'BackgroundColor', [1 1 1])

 mTB28 = uicontrol('style', 'text');
set(mTB28, 'String', '2ML On J')
set(mTB28, 'Units', 'Characters')
set(mTB28, 'FontSize', 10)
set(mTB28, 'Position', [115 40 3.9 4])
set(mTB28, 'BackgroundColor', [1 1 1])


 mTB29 = uicontrol('style', 'text');
set(mTB29, 'String', '1ML On W')
set(mTB29, 'Units', 'Characters')
set(mTB29, 'FontSize', 10)
set(mTB29, 'Position', [119 40 3.9 4])
set(mTB29, 'BackgroundColor', [1 1 1])




