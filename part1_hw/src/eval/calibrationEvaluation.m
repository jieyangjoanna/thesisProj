% Calibration evaluation

angle_lowLimit = 0:24;
path_BS = '../../data/BS_2ndEdition/';
addpath(path_BS);
IF_NO = '550';
% myDir = 'C:\AcademicProjects\CRISIS_Camra\MSI image processing\MSI images\RBD';
% myFiles = dir(fullfile(path, 'BS_2ndEdition', strcat('*',IF_NO, '_2ndEdition.txt')));
myFiles = dir(fullfile(path_BS, strcat('*',IF_NO, '_2ndEdition.txt')));
if isempty(myFiles)
    filename = fullfile(path_BS, 'BlueShiftAverage_2ndEdition.txt');
    BS = dlmread(filename,'',1,0);
    CWL= round(str2double(IF_NO)+round(BS(angle_lowLimit*10+1,2)));
else 
    % filename = fullfile('BS_2ndEdition',myFiles.name);
    filename = fullfile(myFiles.name);
    BS = dlmread(filename,'',1,0);%angle_lowLimit corresponds to BS(1,:)
    CWL= round(BS(angle_lowLimit*10+1,2));
end

path_spectra = '../../data/ASDSpectra/';
addpath(path_Spectra);
BlackSandPaper = dlmread('BlackSandPaper04092018.txt','',1,0);
Reflectance_BlackPaint = BlackSandPaper(:,2);

%load('blksand.mat');
%Reflectance_BlackPaint = blksand;




%load('whtsand.mat');%Reflectance_WhitePaint = whtsand2_av;
whiteSandPaper04092018 = dlmread('WhiteSandPaper04092018.txt','',1,0);
Reflectance_WhitePaint = whiteSandPaper04092018(:,2);
%file = dlmread('BlueCotnMean.mn.txt','',41,0);
%Reflectance_BlueCotn = file(:,2);
%file = dlmread('WhiteLineFabricMean.mn.txt', '', 41, 0);
%wall = dlmread('LightBlueWall04092018.txt','',1,0);
%Reflectance_WhiteLineFabric = wall(:,2);
file = dlmread('WhiteLineFabric4Layers.txt', '', 1, 0);
%GF = dlmread('GrayFeltMean.mn.txt','',42,0);
Reflectance_WhiteLineFabric = file(:,2);

Reflectance_BlackPaint_CWL_Evl = zeros(25,1);
Reflectance_WhitePaint_CWL_Evl = zeros(25,1);
%Reflectance_BlueCotn_CWL_Evl = zeros(21,1);
Reflectance_WhiteLineFabric_CWL_Evl = zeros(25,1);

%spectrolon = dlmread('Spectrolon.txt','',1,0);
%Ref_spec = spectrolon(:,2);



%% ref. image padding
Im_ref = zeros(2748,3840);

path_cal_panel = '../../data/20180416_cal_panel/';
addpath(path_cal_panel);
load 04162018_IF850_correct_alignedto690_ref_RegTo_04162018_IF690_noCalPanel_correct.mat

Im_ref(7:2744, 1:3700) = Recovered(7:2744, 1:3700);


%% fabric ground truth


figure();imshow(Im_ref,[]);
display('Please select black panel, white calibration panel, and target pints: ');
[Black_Panel_x, Black_Panel_y]=getpts
[White_Panel_x, White_Panel_y]=getpts
[Target_x, Target_y]=getpts

% RF without bloodstains or confusors.
[RF_x, RF_y]=getpts
ROI_RFOnly = roipoly(Im_ref, RF_x, RF_y);

[GF_x, GF_y]=getpts
ROI_GFOnly = roipoly(Im_ref, GF_x, GF_y);

[WP_x, WP_y]=getpts
ROI_WPOnly = roipoly(Im_ref, WP_x, WP_y);

[BC_x, BC_y]=getpts
ROI_BCOnly = roipoly(Im_ref, BC_x, BC_y);

[GRNF_x, GRNF_y]=getpts
ROI_GRNFOnly = roipoly(Im_ref, GRNF_x, GRNF_y);
[J_x, J_y]=getpts
ROI_JOnly = roipoly(Im_ref, J_x, J_y);

[WC_x, WC_y]=getpts
ROI_WCOnly = roipoly(Im_ref, WC_x, WC_y);

[W_x, W_y]=getpts
ROI_WOnly = roipoly(Im_ref, W_x, W_y);

ROI_BlackPanel = roipoly(Im_ref, Black_Panel_x, Black_Panel_y);
ROI_WhitePanel = roipoly(Im_ref, White_Panel_x, White_Panel_y);
ROI_Target = roipoly(Im_ref, Target_x, Target_y);

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

    %Reflectance_BlackPaint_CWL_Evl(angle_lowLimit+1) = mean(Reflectance_BlackPaint(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %Reflectance_WhitePaint_CWL_Evl(angle_lowLimit+1) = mean(Reflectance_WhitePaint(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %Reflectance_WhiteLineFabric_CWL_Evl(angle_lowLimit+1) = mean(Reflectance_WhiteLineFabric(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
end

%Black panel
ROI_BlackPanel_cal = zeros(25,1);
for angle_lowLimit=1:24
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_BlackPanel_cut = Radial_Cut_I.*ROI_BlackPanel;
    if isempty(nonzeros(ROI_BlackPanel_cut))
        error('No Black panel calibration points selected! ');
    else
        ROI_BlackPanel_cal(angle_lowLimit+1)= mean(nonzeros(ROI_BlackPanel_cut));
    end
end

figure();hold on;grid on;
plot(0:24, Reflectance_BlackPaint_CWL_Evl,'k*');
plot(0:24, ROI_BlackPanel_cal,'b*-');
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal.'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','Black sand paper')

%White panel
ROI_WhitePanel_cal = zeros(25,1);
for angle_lowLimit = 0:22
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_WhitePanel_cut = Radial_Cut_I.*ROI_WhitePanel;
    if isempty(nonzeros(ROI_WhitePanel_cut))
        error('No white panel calibration points selected! ');
    else
        ROI_WhitePanel_cal(angle_lowLimit+1)= mean(nonzeros(ROI_WhitePanel_cut));
    end
end

figure();hold on; grid on;
plot(0:24, Reflectance_WhitePaint_CWL_Evl,'k*');
plot(0:24, ROI_WhitePanel_cal,'b*-');
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal.'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','White sand paper')

%Target cal.
% white line fabric
ROI_WhiteLineFabric_cal = zeros(25,1);
for angle_lowLimit = 0:20
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_WhiteLineFabric_cut = Radial_Cut_I.*ROI_Target;
    if isempty(nonzeros(ROI_WhiteLineFabric_cut))
        error('No white panel calibration points selected! ');
    else
        ROI_WhiteLineFabric_cal(angle_lowLimit+1)= mean(nonzeros(ROI_WhiteLineFabric_cut));
    end
end

 


% RF
ROI_RF_cal = zeros(25,1);
for angle_lowLimit = 2:20
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_RFOnly;
    if isempty(nonzeros(ROI_Target_cut))
        error('No target points selected! ');
    else
        ROI_RF_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end

figure();hold on;grid on;
plot(2:20, RF_CWL_Evl(3:21),'k*');
plot(2:20, ROI_RF_cal(3:21),'b*-');
plot(2:20, ROI_RF_cal(3:21).*1.15,'c-');
plot(2:20, ROI_RF_cal(3:21).*0.85, 'c-')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for RF'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','RF calibrated','115% of Cal. Ref.','85% of Cal. Ref.')

%GF
ROI_GF_cal = zeros(25,1);
for angle_lowLimit = 4:19
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_GFOnly;
    if isempty(nonzeros(ROI_Target_cut))
        error('No target points selected! ');
    else
        ROI_GF_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end
figure();hold on;grid on;
plot(4:19, GF_CWL_Evl(5:20),'k*');
plot(4:19, ROI_GF_cal(5:20),'b*-');
plot(4:19, ROI_GF_cal(5:20).*1.15,'c-');
plot(4:19, ROI_GF_cal(5:20).*0.85, 'c-')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for GF'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','GF calibrated','115% of Cal. Ref.','85% of Cal. Ref.')

%WP
ROI_WP_cal = zeros(25,1);
for angle_lowLimit = 3:15
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_WPOnly;
    if isempty(nonzeros(ROI_Target_cut))
        error('No target points selected! ');
    else
        ROI_WP_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end
figure();hold on;grid on;
plot(3:15, WP_CWL_Evl(4:16),'k*');
plot(3:15, ROI_WP_cal(4:16),'b*-');
plot(3:15, ROI_WP_cal(4:16).*1.15,'c-');
plot(3:15, ROI_WP_cal(4:16).*0.85, 'c-')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for WP'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','WP calibrated','115% of Cal. Ref.','85% of Cal. Ref.')

%BC
ROI_BC_cal = zeros(25,1);
for angle_lowLimit = 5:21
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_BCOnly;
    if isempty(nonzeros(ROI_Target_cut))
        error('No target points selected! ');
    else
        ROI_BC_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end
figure();hold on;grid on;
plot(5:21, BC_CWL_Evl(6:22),'k*');
plot(5:21, ROI_BC_cal(6:22),'b*-');
plot(5:21, ROI_BC_cal(6:22).*1.15,'c-');
plot(5:21, ROI_BC_cal(6:22).*0.85, 'c-')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for BC'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','BC calibrated','115% of Cal. Ref.','85% of Cal. Ref.')

%GRNF
ROI_GRNF_cal = zeros(25,1);
for angle_lowLimit = 1:17
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_GRNFOnly;
    if isempty(nonzeros(ROI_Target_cut))
        error('No target points selected! ');
    else
        ROI_GRNF_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end
figure();hold on;grid on;
plot(1:17, GRNF_CWL_Evl(2:18),'k*');
plot(1:17, ROI_GRNF_cal(2:18),'b*-');
plot(1:17, ROI_GRNF_cal(2:18).*1.15,'c-');
plot(1:17, ROI_GRNF_cal(2:18).*0.85, 'c-')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for GRNF'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','GRNF calibrated','115% of Cal. Ref.','85% of Cal. Ref.')

%J
ROI_J_cal = zeros(25,1);
for angle_lowLimit = 2:18
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_JOnly;
    if isempty(nonzeros(ROI_Target_cut))
        error('No target points selected! ');
    else
        ROI_J_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end
figure();hold on;grid on;
plot(2:18, J_CWL_Evl(3:19),'k*');
plot(2:18, ROI_J_cal(3:19),'b*-');
plot(2:18, ROI_J_cal(3:19).*1.15,'c-');
plot(2:18, ROI_J_cal(3:19).*0.85, 'c-')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for J'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','J calibrated','115% of Cal. Ref.','85% of Cal. Ref.')

%WC
ROI_WC_cal = zeros(25,1);
for angle_lowLimit = 5:20
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_WCOnly;
    if isempty(nonzeros(ROI_Target_cut))
        error('No target points selected! ');
    else
        ROI_WC_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end
figure();hold on;grid on;
plot(5:20, WC_CWL_Evl(6:21),'k*');
plot(5:20, ROI_WC_cal(6:21),'b*-');
plot(5:20, ROI_WC_cal(6:21).*1.15,'c-');
plot(5:20, ROI_WC_cal(6:21).*0.85, 'c-')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for WC'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','WC calibrated','115% of Cal. Ref.','85% of Cal. Ref.')

%W
ROI_W_cal = zeros(25,1);
for angle_lowLimit = 5:20
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, Im_ref);
    ROI_Target_cut = Radial_Cut_I.*ROI_WOnly;
    if isempty(nonzeros(ROI_Target_cut))
        error('No target points selected! ');
    else
        ROI_W_cal(angle_lowLimit+1) = mean(nonzeros(ROI_Target_cut));
    end
end
figure();hold on;grid on;
plot(5:20, W_CWL_Evl(6:21),'k*');
plot(5:20, ROI_W_cal(6:21),'b*-');
plot(5:20, ROI_W_cal(6:21).*1.15,'c-');
plot(5:20, ROI_W_cal(6:21).*0.85, 'c-')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal. for W'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Ground truth','W calibrated','115% of Cal. Ref.','85% of Cal. Ref.')


%% detection performance vs. AoV


%% RF













% cal target and panels
figure();hold on;grid on;
plot(0:24, Reflectance_BlackPaint_CWL_Evl,'k-*');
plot(0:24, ROI_BlackPanel_cal,'g-*');
plot(0:22, Reflectance_WhitePaint_CWL_Evl(1:23),'k-*');
plot(0:22, ROI_WhitePanel_cal(1:23),'r-*');
plot(0:20, Reflectance_WhiteLineFabric_CWL_Evl(1:21),'k-*');
plot(0:20, ROI_WhiteLineFabric_cal(1:21),'b-*');
plot(0:20, Reflectance_WhiteLineFabric_CWL_Evl(1:21).*1.1,'c-');
plot(0:20, Reflectance_WhiteLineFabric_CWL_Evl(1:21).*0.9, 'c-')
hold off;
title(strcat('IF',IF_NO, '  Ref. Cal.'));
xlabel('Half AOV (degree)');ylabel('Reflectance');
legend('Black panel ground truth','Black panel','White panel ground truth','White panel','White line fabric ground truth','WhiteLine fabric','+/-10% accuracy')



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