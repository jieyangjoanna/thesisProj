function [Black_Panel_x, Black_Panel_y, White_Panel_x, White_Panel_y, Im_ref, CWL, angle_unCal] = Reflectance_Cal2(Reflectance_BlackPanel, Reflectance_WhitePanel, I, IF_NO, path)
%Reflectance_Cal2 is an updated form of Refletance_Cal function
%   This function transforms a Digital Number image into reflectance
%   Input image 'Im' is the Digital Number image, and 'Im_Dark' image is the
%   corresponding dark image that was taken with the same exposure time as
%   the IF filtered image.

%   Each IF filtered image should be calibrated separately.
% angle_unCal is the angles that are not calibrated

%%
%reflectance ground truth
%load('blksand.mat');
%Reflectance_BlackPanel = blksand;



%load('whtsand.mat');
%WhiteSandPaper_old = dlmread('WhiteSandPaper11092017_measure04092018.txt','',1,0);
%Reflectance_WhitePanel_old = WhiteSandPaper_old(:,2);
%tyvec = dlmread('Tyvec2layers04092018.txt','',1,0);
%Reflectance_WhitePanel = whtsand2_av;

%load('jean1NoInk.mat');
%Reflectance_Jean1NoInk = jean1;
%load('jean1ink.mat');
%Reflectance_Jean1WInk = jean1ink;
%file = dlmread('WhiteLineFabricMean.mn.txt', '', 41, 0);
%GF = dlmread('GrayFeltWashed.txt','',1,0);
%Reflectance_GF = GF(:,2);

%file = dlmread('WhiteLineFabric4Layers.txt', '', 1, 0);
%Reflectance_WhiteLineFabric = file(:,2);
%wall = dlmread('LightBlueWall04092018.txt','',1,0);
%Reflectance_wall = wall(:,2);

%spectrolon = dlmread('Spectrolon.txt','',1,0);
%Ref_spec = spectrolon(:,2);

%{
RF = dlmread('RedFeltMean.mn.txt', '', 42, 0);
RF = RF(:,2);
GF = dlmread('GrayFeltWashed.txt','', 1,0);
GF = GF(:,2);
WP = dlmread('PolyMean.mn.txt', '', 42,0);
WP = WP(:,2);
BC = dlmread('blackCotnMean.mn.txt', '', 42,0);
BC = BC(:,2);
GRNF = dlmread('GreenFeltMean.mn.txt','', 42,0);
GRNF = GRNF(:,2);
J = dlmread('JeansMean.mn.txt','',42,0);
J = J(:,2);
WC = dlmread('WhiteCotnMean.txt',',',42,0);
WC = WC(:,2);
BF = dlmread('BlackFeltMean.mn.txt','',42,0);
BF = BF(:,2);
W = dlmread('WOODMean_i.txt',' ',0,0);
W = W(:,7);
%}

%%
%{
figure();
ylim([0 1.2]); xlim([350 1000]);hold on;grid on;
plot(350:2500, Reflectance_WhitePanel)
plot(350:2500, Reflectance_BlackPanel)
plot(350:2500, RF)
plot(350:2500, GF)
plot(350:2500, WP);
plot(350:2500, BC)
plot(350:2500, GRNF)
plot(350:2500, J)
plot(350:2500, WC);
plot(350:2500, BF);
plot(350:2500, W)
legend('White Panel','Black Panel','White Line fabric', 'RF','GF','WP','BC','GRNF','J','WC','BF','W')%;%,'Wall');%'Jeans without ink','Jeans with ink')
title('Cal. Targets Reflectance Ground Truth');
xlabel('Wavelength(nm)');ylabel('Reflectance')
%}
%%


%extract Black sand paper calibration panel
%each panel select four points. Double click the last point to end the
%selection
figure();imshow(I,[]);
disp('Please select calibration black panel and white panel (double click adds a final point. Press Return or Enter ends the selection without adding a final point. Pressing Backspace or Delete removes the previously selected point.):');
[Black_Panel_x, Black_Panel_y]=getpts
[White_Panel_x, White_Panel_y]=getpts
%[WhiteLineFabric_x, WhiteLineFabric_y]=getpts
%[wall_upper_x, wall_upper_y]=getpts
%[wall_lower_x, wall_lower_y]=getpts

ROI_BlackPanel = roipoly(I, Black_Panel_x, Black_Panel_y);
ROI_WhitePanel = roipoly(I, White_Panel_x, White_Panel_y);
%ROI_WhiteLineFabric = roipoly(I, WhiteLineFabric_x, WhiteLineFabric_y);
%ROI_wall_upper = roipoly(I,wall_upper_x, wall_upper_y);
%ROI_wall_lower = roipoly(I, wall_lower_x, wall_lower_y);

figure(); imshow(ROI_BlackPanel+ROI_WhitePanel);%+ROI_WhiteLineFabric+ROI_wall_upper+ROI_wall_lower,[]);

%%

%image segmentation calibration
%ROI_BlackPaint = dlmread('ROI_BlackPaint.txt','',1,0);
%ROI_WhitePaint = dlmread('ROI_WhitePaint.txt','',1,0);
Im_ref = zeros(2748, 3840);
slope = zeros(25,1);
intercept = zeros(25,1);
angle_unCal = [];
for angle_lowLimit=0:24
    %determine the CWL based on spectral shift
    CWL = Radial_CWL(path, IF_NO, angle_lowLimit);
    Reflectance_BlackPanel_CWL = mean(Reflectance_BlackPanel(CWL-5-350+1:CWL+5-350+1));
    Reflectance_WhitePanel_CWL = mean(Reflectance_WhitePanel(CWL-5-350+1:CWL+5-350+1));
    %Reflectance_WhiteLineFabric_CWL = mean(Reflectance_WhiteLineFabric(CWL-5-350+1:CWL+5-350+1));
    %Reflectance_wall_CWL = mean(Reflectance_wall(CWL-5-350+1:CWL+5-350+1));
    %extract ROI based on the radial angle
    [Radial_Cut_I, Cut] = Radial_Cut(angle_lowLimit, double(I));
    
    %figure();imshow(Radial_Cut_I,[]);title(strcat({'Angle'},{' '},{int2str(angle_lowLimit)},{' '}, 'degree to',{' '},{int2str(angle_lowLimit+1)},{' '},'degree'));
    
    %extract ROI of black panel and white panel
    ROI_BlackPanel_cut = Radial_Cut_I.*ROI_BlackPanel;
    ROI_WhitePanel_cut = Radial_Cut_I.*ROI_WhitePanel;
    %ROI_WhiteLineFabric_cut = Radial_Cut_I.*ROI_WhiteLineFabric;
    %ROI_wall_cut = Radial_Cut_I.*ROI_wall;
    %ROI_wall_lower_cut = Radial_Cut_I.*ROI_wall_lower;
    
    %figure();imshow(ROI_BlackPanel_cut + ROI_WhitePanel_cut + ROI_WhiteLineFabric_cut+ROI_wall_cut+ROI_wall_lower,[])
   
    
    if isempty(nonzeros(ROI_BlackPanel_cut))|| isempty(nonzeros(ROI_WhitePanel_cut))
        angle_unCal = [angle_unCal, angle_lowLimit];
        %error('No Black panel or white panel calibration points selected! ');
        
    else
        %calculate the 0.2 quantile of array
        %calculate the 0.8 quantile of array
        ROI_BlackPanel_cut = nonzeros(ROI_BlackPanel_cut);
        ROI_WhitePanel_cut = nonzeros(ROI_WhitePanel_cut);
        %ROI_WhiteLineFabric_cut = nonzeros(ROI_WhiteLineFabric_cut);
        %ROI_wall_cut = nonzeros(ROI_wall_cut);
        %ROI_wall_lower_cut = nonzeros(ROI_wall_lower_cut);
        
        idx_B = find(ROI_BlackPanel_cut>= quantile(ROI_BlackPanel_cut,0.2) & ROI_BlackPanel_cut <= quantile(ROI_BlackPanel_cut,0.8));
        ROI_BlackPanel_cut = ROI_BlackPanel_cut(idx_B);
        idx_W = find(ROI_WhitePanel_cut>= quantile(ROI_WhitePanel_cut,0.2) & ROI_WhitePanel_cut <= quantile(ROI_WhitePanel_cut,0.8));
        ROI_WhitePanel_cut = ROI_WhitePanel_cut(idx_W);
        %idx_C = find(ROI_WhiteLineFabric_cut>= quantile(ROI_WhiteLineFabric_cut,0.2) & ROI_WhiteLineFabric_cut <= quantile(ROI_WhiteLineFabric_cut,0.8));
        %ROI_WhiteLineFabric_cut = ROI_WhiteLineFabric_cut(idx_C);
        %idx_D = find(ROI_wall_cut>= quantile(ROI_wall_cut,0.2) & ROI_wall_cut <= quantile(ROI_wall_cut,0.8));
        %ROI_wall_cut = ROI_wall_cut(idx_D);
        %idx_E = find(ROI_wall_lower_cut>= quantile(ROI_wall_lower_cut,0.2) & ROI_wall_lower_cut <= quantile(ROI_wall_lower_cut,0.8));
        %ROI_wall_lower_cut = ROI_wall_lower_cut(idx_E);
        %{
        figure();hold on;
        plot(Reflectance_WhiteLineFabric_CWL*ones(length(ROI_WhiteLineFabric_cut),1), ROI_WhiteLineFabric_cut,'b*');
        plot(Reflectance_WhitePanel_CWL*ones(length(ROI_WhitePanel_cut),1), ROI_WhitePanel_cut,'r*');
        plot(Reflectance_BlackPanel_CWL*ones(length(ROI_BlackPanel_cut),1), ROI_BlackPanel_cut,'g*');
        plot(Reflectance_wall_CWL*ones(length(ROI_wall_cut),1), ROI_wall_cut,'m*');
        plot(Reflectance_wall_CWL*ones(length(ROI_wall_lower_cut),1), ROI_wall_lower_cut,'c*');

        legend('White line fabric','white panel','black panel','upper Wall','lower diagonal walls')
        %}
        betaHat = ELM(double(ROI_BlackPanel_cut), double(ROI_WhitePanel_cut), Reflectance_BlackPanel_CWL, Reflectance_WhitePanel_CWL)
        slope(angle_lowLimit+1) = betaHat(2);
        intercept(angle_lowLimit+1) = betaHat(1);
        % elseif length(nonzeros(ROI_WhitePanel_cut))>1000 && length(nonzeros(ROI_WhitePanel_cut))<=1000
     %    ROI_WhitePanel_cut = randsample(nonzeros(ROI_WhitePanel_cut(:)), round(length(nonzeros(ROI_WhitePanel_cut))/10));
    %     betaHat = ELM(double(nonzeros(ROI_BlackPanel_cut)), double(nonzeros(ROI_WhitePanel_cut)), Reflectance_BlackPanel_CWL, Reflectance_WhitePanel_CWL)
    %else
   %      betaHat = ELM(double(nonzeros(ROI_BlackPanel_cut)), double(nonzeros(ROI_WhitePanel_cut)), Reflectance_BlackPanel_CWL, Reflectance_WhitePanel_CWL)
   
   I_ref_cut = (double(Radial_Cut_I)- betaHat(1))./betaHat(2);
    Im_cut = I_ref_cut.*Cut;
    Im_ref = Im_ref + Im_cut;
    
    end
    
   
   
    %ROI_BlackPaint_cut = double(nonzeros(I(ROI_BlackPaint(angle_lowLimit+1,2):ROI_BlackPaint(angle_lowLimit+1,3), ROI_BlackPaint(angle_lowLimit+1,4):ROI_BlackPaint(angle_lowLimit+1,5))));
    %ROI_WhitePaint_cut = double(nonzeros(I(ROI_WhitePaint(angle_lowLimit+1,2):ROI_WhitePaint(angle_lowLimit+1,3), ROI_WhitePaint(angle_lowLimit+1,4):ROI_WhitePaint(angle_lowLimit+1,5))));
end



figure();imshow(Im_ref,[]);colorbar;title(strcat({'IF'},{IF_NO},{' '}, {'nm'},{' '},{'Calibrated Reflectance Image'}));

%{
save('ELMslope_04162018_IF850_correct_noFilter.mat','slope');%IF690slope is wrong!
save('ELMintercept_04162018_IF850_correct_noFilter.mat','intercept')
save('04162018_IF850_correct_noFilter_ref.mat','Im_ref')
imwrite(Im_ref, '04152018_IF550_2_correct_ref.bmp')

figure();plot(0:24, slope,'k*');
hold on; plot(0:24, intercept,'*','Color',[0.5 0.5 0.5])
legend('Slope','Intercept')
grid on
xlabel('Half AoV (degrees)')
ylabel('Arbitrary unit')
title(strcat({'IF'},{IF_NO},{' '},{'ELM Variation as a function of Half AoV'}));
%}

 
%imwrite(Im_ref, strcat(name(1:14), '_NonUnifrimityCorrect_RefCal_ChromAbr.bmp'));

%savefig(strcat('IF',IF_NO, '_ref'));
%savefig(strcat(name, '_NonUnifrimityCorrect_RefCal.fig'));



end



