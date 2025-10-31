function [ output_args ] = IF850BF( )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
path_BS = '../../data/BS_2ndEdition/'; % blue shift data path
addpath(path_BS);
BS_Ave_M = dlmread('BlueShiftAverage_2ndEdition.txt', '', 1,0); % blue shift
path_spectra = '../../data/';
addpath(path_spectra);
filename = fullfile('Integrated Spectra','BloodOnBlackFeltMean.mn_i.txt');
spectrum_BldBF = dlmread(filename, '', 0, 0);
filename = fullfile('Integrated Spectra','BlackFeltMean.mn_i.txt');
spectrum_BF = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','BloodOnJeansMean.mn_i.txt');
spectrum_BldJ = dlmread(filename, '', 0, 0);
filename = fullfile('Integrated Spectra','JeansMean.mn_i.txt');
spectrum_J = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','BloodOnBlackCotnMean.mn_i.txt');
spectrum_BldBC = dlmread(filename, '', 0, 0);
filename = fullfile('Integrated Spectra','blackCotnMean.mn_i.txt');
spectrum_BC = dlmread(filename, '', 0, 0);

filename = fullfile('Integrated Spectra','BloodOnGreenFeltMean.mn_i.txt');
spectrum_BldGRNF = dlmread(filename, '', 0, 0);
filename = fullfile('Integrated Spectra','GreenFeltMean.mn_i.txt');
spectrum_GRNF = dlmread(filename, '', 0, 0);


path_IF = '../../data/IF/T/'; % inteference filters transmittance data path
addpath(path_IF);
load IF_T_850nm
IF_T_850 = Vq;
%{
figure();hold on
for i =1:250
    plot(400:1000, IF_T_850(:,i))
end
hold off
%}

ref_cor_BldBF = spectrum_BldBF(400-350+1:1000-350+1)'*IF_T_850;% half AoV, blood on black felt spectrum
ref_cor_BF = spectrum_BF(400-350+1:1000-350+1)'*IF_T_850;% half AoV, black felt spectrum

ref_cor_BldBC = spectrum_BldBC(400-350+1:1000-350+1)'*IF_T_850;% half AoV, blood on black cotton spectrum
ref_cor_BC = spectrum_BC(400-350+1:1000-350+1)'*IF_T_850;% half AoV, bloack cotton spectrum

ref_cor_BldJ = spectrum_BldJ(400-350+1:1000-350+1)'*IF_T_850;% half AoV, blood on jeans spectrum
ref_cor_J = spectrum_J(400-350+1:1000-350+1)'*IF_T_850;% half AoV, jeans spectrum

ref_cor_BldGRNF = spectrum_BldGRNF(400-350+1:1000-350+1)'*IF_T_850;% half AoV, blood on green felt spectrum
ref_cor_GRNF = spectrum_GRNF(400-350+1:1000-350+1)'*IF_T_850;% half AoV, green felt spectrum 


figure();hold on
plot(1*ones(1,250), ref_cor_BF, 'k^',1*ones(1,250),ref_cor_BldBF,'r^')
plot(2*ones(1,250), ref_cor_BC, 'kx',2*ones(1,250),ref_cor_BldBC,'rx')
plot(3*ones(1,250), ref_cor_J, 'ks',3*ones(1,250),ref_cor_BldJ,'rs')
plot(4*ones(1,250), ref_cor_GRNF, 'ko',4*ones(1,250),ref_cor_BldGRNF,'ro')
legend('BF','Bld on BF', 'BC','Bld on BC','J','Bld on J','GRNF','Bld on GRNF')
grid on;
title('IF850 image pixel value');
xlabel('Sample'); ylabel('reflectance correlated with IF 850 nm IF transmittance')
hold off;

figure();hold on;grid on
plot(400:1000, spectrum_BF(400-350+1:1000-350+1),'k-.'); % black felt spectrum
plot(400:1000, spectrum_BldBF(400-350+1:1000-350+1),'r-.') % blood on black felt spectrum

plot(400:1000, spectrum_BC(400-350+1:1000-350+1),'k--'); % black cotton spectrum
plot(400:1000, spectrum_BldBC(400-350+1:1000-350+1),'r--') % blood on black cotton spectrum

plot(400:1000, spectrum_J(400-350+1:1000-350+1),'k:'); % jeans spectrum
plot(400:1000, spectrum_BldJ(400-350+1:1000-350+1),'r:') % blood on jeans spectrum

plot(400:1000, spectrum_GRNF(400-350+1:1000-350+1),'k-'); % green felt spectrum
plot(400:1000, spectrum_BldGRNF(400-350+1:1000-350+1),'r-') % blood on green felt spectrum

legend('BF','Bld on BF', 'BC','Bld on BC','J','Bld on J','GRNF','Bld on GRNF')
xlabel('Wavelength (nm)');ylabel('Reflectance')
title('Reflctance spectra')
end

