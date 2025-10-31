%% RBD evaluation/discussion

%function RBD_discussion(ROI_BLD_RF)

%  RBD_discussion is used to discuss the RBD performance, in which RBD
%  measured values are not as good as modeled values

%  ROI_BLD_RF is the bloodstain on Red felt region of interest part. RBD is
%  the separation between bloodstain and non-bloodstains, and RBD values of
%  all the tested non-bloodstains(including substrates) have almost the
%  same value, therefore, we need to investigate Blood RBD and one
%  non-blood or substrate RBD, in order to see the separation of RBD values
%  between blood and non-blood/substrates.

%% ref. padding
Im_ref550 = zeros(2748,3840);
Im_ref550(7:2744, 1:3700) = Ref550;

Im_ref690 = zeros(2748,3840);
Im_ref690(7:2744, 1:3700) = Ref690;

Im_ref850 = zeros(2748,3840);
Im_ref850(7:2744, 1:3700) = Ref850;

%% %%%%%%%%%%%%%%%%%%%  BLD on Fabric 3D %%%%%%%%%%%%%%%%%%%%

%% useful parameters
e = 0;
lambda = 350:2500;

%% ground truth spectrum
path_spectra = '../../data/';
addpath(path_spectra);
filename = fullfile('Integrated Spectra','BloodOnWhiteCotnMean.mn_i.txt');
spectrum_BLD_GRNF = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
       
%% filter selection
IF_NO = '550';

%% reflectance image
Ref = Im_ref550;
[m,n,k]=size(Ref);

%% CWL
angle_lowLimit = 0:24;
path_BS = '../data/BS_2ndEdition/';
addpath(path_BS);
myFiles = dir(fullfile(path_BS, strcat('*',IF_NO, '_2ndEdition.txt')));
if isempty(myFiles)
    filename = fullfile(path_BS,'BlueShiftAverage_2ndEdition.txt');
    BS = dlmread(filename,'',1,0);
    CWL= round(str2double(IF_NO)+round(BS(angle_lowLimit*10+1,2)));
else 
    filename = fullfile(path_BS, myFiles.name);
    BS = dlmread(filename,'',1,0);%angle_lowLimit corresponds to BS(1,:)
    CWL= round(BS(angle_lowLimit*10+1,2));
end

for angle_lowLimit=0:24
    BLD_RF_CWL_Evl(angle_lowLimit+1) = mean(spectrum_BLD_GRNF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %GF_CWL_Evl(angle_lowLimit+1) = mean(GF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %WP_CWL_Evl(angle_lowLimit+1) = mean(WP(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %BC_CWL_Evl(angle_lowLimit+1) = mean(BC(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %GRNF_CWL_Evl(angle_lowLimit+1) = mean(GRNF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %J_CWL_Evl(angle_lowLimit+1) = mean(J(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %WC_CWL_Evl(angle_lowLimit+1) = mean(WC(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %W_CWL_Evl(angle_lowLimit+1) = mean(W(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %BF_CWL_Evl(angle_lowLimit+1) = mean(BF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));

end
%Ref550_BLD_RF = ROI_BLD_RF.*Im_ref550;
%Ref690_BLD_RF = ROI_BLD_RF.*Im_ref690;
%Ref850_BLD_RF = ROI_BLD_RF.*Im_ref850;
%% calibrated ref.
angle = []; % angles that have BLD pixels
figure();
for angle_lowLimit = 2:20
    [~, Cut] = Radial_Cut(angle_lowLimit, Ref);
    ROI_Target_cut = Cut.*ROI_BLD_WC;% ROI means one entire fabric area
    if isempty(nonzeros(ROI_Target_cut))
       % error('No target points selected! ');
       Ref_cal = 99;
    else
    angle = [angle, angle_lowLimit];
    % subset of scored image
    idx_ROI_cut = find(ROI_Target_cut>0);
    %reshape image
    I = reshape(Ref,[m*n,k]);
    % selected ROI on image.
    Ref_cal = double(I(idx_ROI_cut,:));
       x = angle_lowLimit*ones(1,length(idx_ROI_cut));
    y = Ref_cal';
    z = CWL(angle_lowLimit)*ones(1,length(idx_ROI_cut));
  h1=plot3(x,y,z,'g*');
hold on;
  % h1=plot(angle_lowLimit*ones(length(idx_ROI_cut),1),Ref_cal,'g*' ); %2d
    end
    
end
h2=plot3(angle, BLD_RF_CWL_Evl(angle),CWL(angle),'s','markerSize',10,'MarkerFaceColor','g','MarkerEdgeColor','k','LineWidth',2);

%h2=plot(angle, BLD_RF_CWL_Evl(angle),
%'s','markerSize',10,'MarkerFaceColor','g','MarkerEdgeColor','k');%2d

%plot(angle, BLD_RF_CWL_Evl(angle), 's','markerSize',12,'MarkerFaceColor','g');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% filter selection
IF_NO = '690';

%% reflectance image
Ref = Im_ref690;

%% CWL
angle_lowLimit = 0:24;
myFiles = dir(fullfile(path_BS, strcat('*',IF_NO, '_2ndEdition.txt')));
if isempty(myFiles)
    filename = fullfile(path_BS,'BlueShiftAverage_2ndEdition.txt');
    BS = dlmread(filename,'',1,0);
    CWL= round(str2double(IF_NO)+round(BS(angle_lowLimit*10+1,2)));
else 
    filename = fullfile(path_BS,myFiles.name);
    BS = dlmread(filename,'',1,0);%angle_lowLimit corresponds to BS(1,:)
    CWL= round(BS(angle_lowLimit*10+1,2));
end
for angle_lowLimit=0:24
    BLD_RF_CWL_Evl(angle_lowLimit+1) = mean(spectrum_BLD_GRNF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %GF_CWL_Evl(angle_lowLimit+1) = mean(GF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %WP_CWL_Evl(angle_lowLimit+1) = mean(WP(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %BC_CWL_Evl(angle_lowLimit+1) = mean(BC(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %GRNF_CWL_Evl(angle_lowLimit+1) = mean(GRNF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %J_CWL_Evl(angle_lowLimit+1) = mean(J(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %WC_CWL_Evl(angle_lowLimit+1) = mean(WC(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %W_CWL_Evl(angle_lowLimit+1) = mean(W(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %BF_CWL_Evl(angle_lowLimit+1) = mean(BF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));

end
%% calibrated ref.
angle = []; % angles that have BLD pixels
for angle_lowLimit = 2:20
    [~, Cut] = Radial_Cut(angle_lowLimit, Ref);
    ROI_Target_cut = Cut.*ROI_BLD_WC;% ROI means one entire fabric area
    if isempty(nonzeros(ROI_Target_cut))
       % error('No target points selected! ');
       Ref_cal = 99;
    else
    angle = [angle, angle_lowLimit];
    % subset of scored image
    idx_ROI_cut = find(ROI_Target_cut>0);
    %reshape image
    I = reshape(Ref,[m*n,k]);
    % selected ROI on image.
    Ref_cal = double(I(idx_ROI_cut,:));
    x = angle_lowLimit*ones(1,length(idx_ROI_cut));
    y = Ref_cal';
    z = CWL(angle_lowLimit)*ones(1,length(idx_ROI_cut));
 h3= plot3(x,y,z,'r*');
hold on;
    end
    
end
%plot(angle, BLD_RF_CWL_Evl(angle), 's','markerSize',12,'MarkerFaceColor','r');
h4 = plot3(angle, BLD_RF_CWL_Evl(angle),CWL(angle),'s','markerSize',10,'MarkerFaceColor','r', 'MarkerEdgeColor','k','LineWidth',2);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% filter selection
IF_NO = '850';

%% reflectance image
Ref = Im_ref850;

%% CWL
angle_lowLimit = 0:24;
myFiles = dir(fullfile(path_BS, strcat('*',IF_NO, '_2ndEdition.txt')));
if isempty(myFiles)
    filename = fullfile(path_BS,'BlueShiftAverage_2ndEdition.txt');
    BS = dlmread(filename,'',1,0);
    CWL= round(str2double(IF_NO)+round(BS(angle_lowLimit*10+1,2)));
else 
    filename = fullfile(path_BS,myFiles.name);
    BS = dlmread(filename,'',1,0);%angle_lowLimit corresponds to BS(1,:)
    CWL= round(BS(angle_lowLimit*10+1,2));
end
for angle_lowLimit=0:24
    BLD_RF_CWL_Evl(angle_lowLimit+1) = mean(spectrum_BLD_GRNF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %GF_CWL_Evl(angle_lowLimit+1) = mean(GF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %WP_CWL_Evl(angle_lowLimit+1) = mean(WP(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %BC_CWL_Evl(angle_lowLimit+1) = mean(BC(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %GRNF_CWL_Evl(angle_lowLimit+1) = mean(GRNF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %J_CWL_Evl(angle_lowLimit+1) = mean(J(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %WC_CWL_Evl(angle_lowLimit+1) = mean(WC(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %W_CWL_Evl(angle_lowLimit+1) = mean(W(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %BF_CWL_Evl(angle_lowLimit+1) = mean(BF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));

end

%% calibrated ref.
angle = []; % angles that have BLD pixels
for angle_lowLimit = 2:20
    [~, Cut] = Radial_Cut(angle_lowLimit, Ref);
    ROI_Target_cut = Cut.*ROI_BLD_WC;% ROI means one entire fabric area
    if isempty(nonzeros(ROI_Target_cut))
       % error('No target points selected! ');
       Ref_cal = 99;
    else
    angle = [angle, angle_lowLimit];
    % subset of scored image
    idx_ROI_cut = find(ROI_Target_cut>0);
    %reshape image
    I = reshape(Ref,[m*n,k]);
    % selected ROI on image.
    Ref_cal = double(I(idx_ROI_cut,:));
     x = angle_lowLimit*ones(1,length(idx_ROI_cut));
    y = Ref_cal';
    z = CWL(angle_lowLimit)*ones(1,length(idx_ROI_cut));
  h5=plot3(x,y,z,'b*');
hold on;
    end
    
end
h6=plot3(angle, BLD_RF_CWL_Evl(angle),CWL(angle),'s','markerSize',10,'MarkerFaceColor','b','MarkerEdgeColor','m','LineWidth',2);
title('Bloodstains on Fabric')
xlabel('Angle (degree)');ylabel('Reflectance');zlabel('Wavelength (nm)')
grid on;

ah1 = gca;
legend(ah1, [h1 h2 h3], 'Cal. Ref. 550nm','Ground truth Ref. 550nm','Cal. Ref. 690nm');
set(legend, 'FontSize', 10);
ah2 = axes('position', get(gca, 'position'), 'visible','off');
legend(ah2, [h4 h5 h6],'Ground truth Ref. 690nm','Cal. Ref. 850nm','Ground truth Ref. 850nm');
set(legend, 'FontSize', 10);

hold off

%end
% for RF substrate
%load ROI_RF this should exclude BLD_RF region
%ROI_RF = ROI;
%RBD_discussion(ROI_RF);
path_ROIs = '../../data/ROIs/substrateOnly/';
addpath(path_ROIs);
load W_x
load W_y
ROI_Bckground = roipoly(Im_ref550, W_x, W_y);


%% %%%%%%%%%%%%%%%%%%%  Only Fabric 3D   %%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ground truth spectrum
filename = fullfile('Integrated Spectra','WhiteCotnMean_i.txt');
spectrum_GRNF = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
       
%% filter selection
IF_NO = '550';

%% reflectance image
Ref = Im_ref550;
[m,n,k]=size(Ref);

%% CWL
angle_lowLimit = 0:24;
myFiles = dir(fullfile(path_BS, strcat('*',IF_NO, '_2ndEdition.txt')));
if isempty(myFiles)
    filename = fullfile(path_BS,'BlueShiftAverage_2ndEdition.txt');
    BS = dlmread(filename,'',1,0);
    CWL= round(str2double(IF_NO)+round(BS(angle_lowLimit*10+1,2)));
else 
    filename = fullfile(path_BS,myFiles.name);
    BS = dlmread(filename,'',1,0);%angle_lowLimit corresponds to BS(1,:)
    CWL= round(BS(angle_lowLimit*10+1,2));
end

for angle_lowLimit=0:24
    BLD_RF_CWL_Evl(angle_lowLimit+1) = mean(spectrum_GRNF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %GF_CWL_Evl(angle_lowLimit+1) = mean(GF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %WP_CWL_Evl(angle_lowLimit+1) = mean(WP(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %BC_CWL_Evl(angle_lowLimit+1) = mean(BC(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %GRNF_CWL_Evl(angle_lowLimit+1) = mean(GRNF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %J_CWL_Evl(angle_lowLimit+1) = mean(J(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %WC_CWL_Evl(angle_lowLimit+1) = mean(WC(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %W_CWL_Evl(angle_lowLimit+1) = mean(W(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %BF_CWL_Evl(angle_lowLimit+1) = mean(BF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));

end
%% calibrated ref.
%% 3d plot
angle = []; % angles that have BLD pixels
figure;
for angle_lowLimit = 2:20
    [~, Cut] = Radial_Cut(angle_lowLimit, Ref);
    ROI_Target_cut = Cut.*ROI_Bckground;% ROI means one entire fabric area
    if isempty(nonzeros(ROI_Target_cut))
       % error('No target points selected! ');
       Ref_cal = 99;
    else
    angle = [angle, angle_lowLimit];
    % subset of scored image
    idx_ROI_cut = find(ROI_Target_cut>0);
    %reshape image
    I = reshape(Ref,[m*n,k]);
    % selected ROI on image.
    Ref_cal = double(I(idx_ROI_cut,:));
    x = angle_lowLimit*ones(1,length(idx_ROI_cut));
    y = Ref_cal';
    z = CWL(angle_lowLimit)*ones(1,length(idx_ROI_cut));
  h1=plot3(x,y,z,'g*');
hold on;
    end
    
end
grid on;
h2=plot3(angle, BLD_RF_CWL_Evl(angle),CWL(angle),'s','markerSize',10,'MarkerFaceColor','g','MarkerEdgeColor','k','LineWidth',2);
%plot(angle, BLD_RF_CWL_Evl(angle), 's','markerSize',12,'MarkerFaceColor','g');
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% filter selection
IF_NO = '690';

%% reflectance image
Ref = Im_ref690;

%% CWL
angle_lowLimit = 0:24;
myFiles = dir(fullfile(path_BS, strcat('*',IF_NO, '_2ndEdition.txt')));
if isempty(myFiles)
    filename = fullfile(path_BS,'BlueShiftAverage_2ndEdition.txt');
    BS = dlmread(filename,'',1,0);
    CWL= round(str2double(IF_NO)+round(BS(angle_lowLimit*10+1,2)));
else 
    filename = fullfile(path_BS,myFiles.name);
    BS = dlmread(filename,'',1,0);%angle_lowLimit corresponds to BS(1,:)
    CWL= round(BS(angle_lowLimit*10+1,2));
end
for angle_lowLimit=0:24
    BLD_RF_CWL_Evl(angle_lowLimit+1) = mean(spectrum_GRNF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %GF_CWL_Evl(angle_lowLimit+1) = mean(GF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %WP_CWL_Evl(angle_lowLimit+1) = mean(WP(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %BC_CWL_Evl(angle_lowLimit+1) = mean(BC(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %GRNF_CWL_Evl(angle_lowLimit+1) = mean(GRNF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %J_CWL_Evl(angle_lowLimit+1) = mean(J(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %WC_CWL_Evl(angle_lowLimit+1) = mean(WC(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %W_CWL_Evl(angle_lowLimit+1) = mean(W(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %BF_CWL_Evl(angle_lowLimit+1) = mean(BF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));

end
%% calibrated ref.
angle = []; % angles that have BLD pixels
for angle_lowLimit = 2:20
    [~, Cut] = Radial_Cut(angle_lowLimit, Ref);
    ROI_Target_cut = Cut.*ROI_Bckground;% ROI means one entire fabric area
    if isempty(nonzeros(ROI_Target_cut))
       % error('No target points selected! ');
       Ref_cal = 99;
    else
    angle = [angle, angle_lowLimit];
    % subset of scored image
    idx_ROI_cut = find(ROI_Target_cut>0);
    %reshape image
    I = reshape(Ref,[m*n,k]);
    % selected ROI on image.
    Ref_cal = double(I(idx_ROI_cut,:));
   x = angle_lowLimit*ones(1,length(idx_ROI_cut));
    y = Ref_cal';
    z = CWL(angle_lowLimit)*ones(1,length(idx_ROI_cut));
 h3= plot3(x,y,z,'r*');
hold on;
    end
    
end
h4 = plot3(angle, BLD_RF_CWL_Evl(angle),CWL(angle),'s','markerSize',10,'MarkerFaceColor','r', 'MarkerEdgeColor','k','LineWidth',2);

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% filter selection
IF_NO = '850';

%% reflectance image
Ref = Im_ref850;

%% CWL
angle_lowLimit = 0:24;
myFiles = dir(fullfile(path_BS, strcat('*',IF_NO, '_2ndEdition.txt')));
if isempty(myFiles)
    filename = fullfile(path_BS,'BlueShiftAverage_2ndEdition.txt');
    BS = dlmread(filename,'',1,0);
    CWL= round(str2double(IF_NO)+round(BS(angle_lowLimit*10+1,2)));
else 
    filename = fullfile(path_BS,myFiles.name);
    BS = dlmread(filename,'',1,0);%angle_lowLimit corresponds to BS(1,:)
    CWL= round(BS(angle_lowLimit*10+1,2));
end
for angle_lowLimit=0:24
    BLD_RF_CWL_Evl(angle_lowLimit+1) = mean(spectrum_GRNF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %GF_CWL_Evl(angle_lowLimit+1) = mean(GF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %WP_CWL_Evl(angle_lowLimit+1) = mean(WP(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %BC_CWL_Evl(angle_lowLimit+1) = mean(BC(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %GRNF_CWL_Evl(angle_lowLimit+1) = mean(GRNF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %J_CWL_Evl(angle_lowLimit+1) = mean(J(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %WC_CWL_Evl(angle_lowLimit+1) = mean(WC(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %W_CWL_Evl(angle_lowLimit+1) = mean(W(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));
    %BF_CWL_Evl(angle_lowLimit+1) = mean(BF(CWL(angle_lowLimit+1)-5-350+1:CWL(angle_lowLimit+1)+5-350+1));

end

%% calibrated ref.
angle = []; % angles that have BLD pixels

for angle_lowLimit = 0:24
    [~, Cut] = Radial_Cut(angle_lowLimit, Ref);
    ROI_Target_cut = Cut.*ROI_Bckground;% ROI means one entire fabric area
    if isempty(nonzeros(ROI_Target_cut))
       % error('No target points selected! ');
       Ref_cal = 99;
    else
    angle = [angle, angle_lowLimit];
    % subset of scored image
    idx_ROI_cut = find(ROI_Target_cut>0);
    %reshape image
    I = reshape(Ref,[m*n,k]);
    % selected ROI on image.
    Ref_cal = double(I(idx_ROI_cut,:));
     x = angle_lowLimit*ones(1,length(idx_ROI_cut));
    y = Ref_cal';
    z = CWL(angle_lowLimit)*ones(1,length(idx_ROI_cut));
  h5=plot3(x,y,z,'b*');
hold on;
    end
    
end
h6=plot3(angle, BLD_RF_CWL_Evl(angle),CWL(angle),'s','markerSize',10,'MarkerFaceColor','b','MarkerEdgeColor','m','LineWidth',2);
title('Fabric Only')
xlabel('Angle (degree)');ylabel('Reflectance');zlabel('Wavelength (nm)')
grid on;

ah1 = gca;
legend(ah1, [h1 h2 h3], 'Cal. Ref. 550nm','Ground truth Ref. 550nm','Cal. Ref. 690nm');
set(legend, 'FontSize', 10);
ah2 = axes('position', get(gca, 'position'), 'visible','off');
legend(ah2, [h4 h5 h6],'Ground truth Ref. 690nm','Cal. Ref. 850nm','Ground truth Ref. 850nm');
set(legend, 'FontSize', 10);

hold off
%% plot refl.
figure();hold on;
plot(lambda, spectrum_BLD_GRNF,'r.');
plot(lambda, spectrum_GRNF,'k.')
xlabel('Wavelength (nm)');ylabel('Reflectance');
legend('Blood on W','W')
xlim([350 1000]);grid on
hold off

%% plot RBD vs. AoV
path_RBD = '../../data/RBD';
addpath(path_RBD);
load 04162018_correct_RegTo_04162018_IF690_noCalPanel_scaled_RBD.mat
load ROI_W
ROI_Bckground = ROI_W;
%RBD_BLD_W  = RBD_value_Index8;%.*ROI_BLD_W;
angle = []; % angles that have BLD pixels
figure;hold on;
for angle_lowLimit = 0:24
    % blood on fabric
    [~, Cut] = Radial_Cut(angle_lowLimit, RBD_value_Index8);
    ROI_BLD_cut = Cut.*ROI_BLD_W;% ROI means one entire fabric area
    ROI_bckground_cut = Cut.*ROI_Bckground;% %%%%%%%%% only fabric
    
    if isempty(nonzeros(ROI_BLD_cut))
       % error('No target points selected! ');
       RBD_BLD = 99;
    else
    angle = [angle, angle_lowLimit];
    % subset of scored image
    idx_ROI_cut = find(ROI_BLD_cut>0);
    idx_bckground_cut = find(ROI_bckground_cut>0);
    %reshape image
    I = reshape(RBD_value_Index8,[m*n,k]);
    % selected ROI on image.
    RBD_BLD = double(I(idx_ROI_cut,:));
    RBD_bckground = double(I(idx_bckground_cut,:));
    % chose another way of plotting to show the RBD distribution with
    % number of pixels
    h1=plot(angle_lowLimit*ones(length(idx_ROI_cut),1),RBD_BLD,'r*' ); %2d
    
    h2=plot((angle_lowLimit+0.2)*ones(length(idx_bckground_cut),1),RBD_bckground,'k*' ); %2d
    end
end
legend([h1 h2],'Blood on substrate','Substrate')
xlabel('AoV (degree)');ylabel('RBD value')
grid on;
hold off

%% Investigate the reason of bad performance of noFilter image, might not have goog registration