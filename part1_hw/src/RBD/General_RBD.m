function [ RBD_value_Index8 ] = General_RBD()
%GENERAL_RBD calculates the RBD value for the 3-spectral band multispectral imaging system. 
%   The input of the function are three images taken at wavelengths of 550
%   nm, 690nm, and 850nm. I1 is taken at 550 nm, I0 is taken at 690nm, I2 is taken at 850 nm. These are reflectance calibrated images. 

%path = 'C:\AcademicProjects\CRISIS_Camra\MSI image processing\MSI images\03302018';
%file = dir(fullfile(path,'01212018_correct_ref_R690G550B850_FalseColorChromAbr.bmp'));
%I = imread(fullfile(path,file.name));
path_cal_panel = '../../data/20180416_cal_panel/';
addpath(path_cal_panel);
load 04162018_IF550_2_correct_alignedto690_ref_RegTo_04162018_IF690_noCalPanel_correct
%load 04162018_IF550_2_correct_noFilter_ref_RegTo_04162018_IF690_noCalPanel_correct
Ref550 = Recovered;

[m,n]=size(Ref550);
load 04162018_IF690_correct_ref_RegTo_04162018_IF690_noCalPanel_correct
%load 04162018_IF690_correct_noFilter_ref_RegTo_04162018_IF690_noCalPanel_correct
Ref690 = Recovered;

load 04162018_IF850_correct_alignedto690_ref_RegTo_04162018_IF690_noCalPanel_correct
%load 04162018_IF850_correct_noFilter_ref_RegTo_04162018_IF690_noCalPanel_correct
Ref850 = Recovered;
%% scale RBD 
% this method does not make sense, even though it has better result, so it
% should not be used.
%{
idx = Ref550<=0;
Ref550(idx)=0.01;
idx = Ref550>2;% since ref. cal. cound be greater than 1
Ref550(idx) = max(reshape(Ref550(~idx),[m*n,1]));

idx = Ref690<=0;
Ref690(idx)=0.01;
idx = Ref690>2;% since ref. cal. cound be greater than 1
Ref690(idx) = max(reshape(Ref690(~idx),[m*n,1]));

idx = Ref850<=0;
Ref850(idx)=0.01;
idx = Ref850>2;% since ref. cal. cound be greater than 1
Ref850(idx) = max(reshape(Ref850(~idx),[m*n,1]));

save('04162018_IF550_2_correct_alignedto690_ref_RegTo_04162018_IF690_noCalPanel_correct_scaled.mat','Ref550')
save('04162018_IF690_correct_ref_RegTo_04162018_IF690_noCalPanel_correct_scaled.mat','Ref690');
save('04162018_IF850_correct_alignedto690_ref_RegTo_04162018_IF690_noCalPanel_correct_scaled.mat','Ref850');
%}
%% Ref scale
figure();histogram(Ref550);title('550 nm Image Histogram');xlim([-0.4 1.2])
figure();histogram(Ref690);title('690 nm Image Histogram');xlim([-0.4 1.2])
figure();histogram(Ref850);title('850 nm Image Histogram');xlim([-0.4 1.2])
% the zeros and values below -0.2 are caused by image mis-alignment
Ref550 = Ref550(7:2744, 1:3700);
Ref690 = Ref690(7:2744, 1:3700);
Ref850 = Ref850(7:2744, 1:3700);
figure();histogram(Ref550);title('550 nm Image Histogram')
figure();histogram(Ref690);title('690 nm Image Histogram')
figure();histogram(Ref850);title('850 nm Image Histogram')

%% scale Ref. so that the three ref. range fall into one range, because we are using relative value (RBD) betweent the three ref.
% therefore, we can normalize the ref.

%% determine if Ref. should be normalized

% 550nm, 690nm, the highest ref. are cal. panel, or Whiteline Fabric, or
% White cotton/white poly. But 850nm, including the above materials, wood
% is also bright.

% since we captured image with full dynamic range, and the cal. panel is
% not the brightest object, so we should consider all the bright object.
% The calibrated ref. dynamic range should be consistent with the dynamic
% range of the image.
e = 0;
lambda = 350:2500;
path_spectra = '../../data/Integrated Spectra/';
addpath(path_spectra);
figure();hold on;
filename = fullfile('Integrated Spectra','BloodOnWoodMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
plot(350:2500, spectrum);
xlim([350 1000]);
filename = fullfile('Integrated Spectra','ColaOnWoodMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','CoffeeOnWoodMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','KetchupOnWoodMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','OrangeJuiceOnWoodMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','RedWineOnWoodMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','TeaOnWoodMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','WOODMean_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
hold off
title('Ref. of Bloodstain and confusors on wood');
grid on

% since 690 nm, and 850 nm the highest ref. on wood >1; and 690 and 850nm
% are different, so we should not set the ref. of the three ref. images at
% the same range. (namely normalize them)

% white poly
figure();hold on;
filename = fullfile('Integrated Spectra','BloodOnWhitePolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
plot(350:2500, spectrum);
xlim([350 1000]);
filename = fullfile('Integrated Spectra','ColaOnWhitePolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','CoffeeOnPolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','KetchupOnWhitePolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','OrangeJuiceOnWhitePolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','RedWineOnPolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','TeaOnWhitePolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','PolyMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
hold off
title('Ref. of Bloodstain and confusors on WP');
grid on

% WP highest ref. at 550, 690, and 850nm <0.8, which is less than cal. panel, so WP does not
% count as the brightest material
figure();hold on
filename = fullfile('Integrated Spectra','BloodOnWhiteCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '', 0, 0);%noise incorporated reflectance spectrum
plot(350:2500, spectrum);
xlim([350 1000]);
filename = fullfile('Integrated Spectra','ColaOnWhiteCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','CoffeeOnWhiteCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','KetchupOnWhiteCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','OrangeJuiceOnWhiteCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','RedWineOnWhiteCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','TeaOnWhiteCotnMean.mn_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
filename = fullfile('Integrated Spectra','WhiteCotnMean_i.txt');
spectrum = (1+e*randn(length(lambda),1)).*dlmread(filename, '');
plot(350:2500, spectrum);
hold off
title('Ref. of Bloodstain and confusors on WC');
grid on

% WP highest ref. at 550nm and 690nm, 850nm <0.8, which is less than cal. panel, so WP does not
% count as the brightest material

% conclusion for ref. scaling: 850nm have the highest ref. due to wood. So
% the overall ref. distribution of 850nm at high end should be more
% donminated than 550nm, and 690nm

Ref550 = Ref550 - min(Ref550(:));
Ref550 = Ref550./max(Ref550(:));

Ref690 = Ref690 - min(Ref690(:));
Ref690 = Ref690./max(Ref690(:));

Ref850 = Ref850 - min(Ref850(:));
Ref850 = Ref850./max(Ref850(:));

%% The following code is only used for RBD calculation
% Ref850 should not have zero value ref.
[zeroPix_x, zeroPix_y] = find(Ref850==0);
if ~isempty(zeroPix_x)
    print('non empty');
    for i = 1:length(zeroPix_x)
        %use average value of periphery four pixels
        Ref850(zeroPix_x(i), zeroPix_y(i))= 1/4*(Ref850(zeroPix_x(i), zeroPix_y(i)+1) + Ref850(zeroPix_x(i), zeroPix_y(i)-1) + Ref850(zeroPix_x(i)+1, zeroPix_y(i)) + Ref850(zeroPix_x(i)-1, zeroPix_y(i)) );
    end
end
figure(); histogram(Ref550);title('550 nm Image Histogram after Normalization')
figure();histogram(Ref690);title('690 nm Image Histogram after Normalization')
figure();histogram(Ref850);title('850 nm Image Histogram after Normalization')



%% 
RBD_value_Index8 = -[((Ref850 - Ref550).*(690-550)./(850-550) + Ref550 - Ref690)./(Ref850)];
RBD_value_Index8 = round(100.*RBD_value_Index8)./100;

save('04162018_correct_RegTo_04162018_IF690_noCalPanel_scaled_RBD.mat','RBD_value_Index8')

end

% figure();imshow(RBD_value_Index8,[0 1])

% imwrite(RBD_value_Index8, '01212018_correct_ref_ChromAbr_RBD.bmp');




