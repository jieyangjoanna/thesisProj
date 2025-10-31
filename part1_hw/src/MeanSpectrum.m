function [ spectrum_av ] = MeanSpectrum()
%MeanSpectrum derives the mean spectrum for white cotton spectrum

%   Because the single 0~9 white cotton spectra were not averaged by ASD,
%   while other spectra were averaged by ASD, therefore, the only spectrum
%   that needs to be derived was the white cotton spectrum.

myDir = 'C:/Users/yangj/Desktop/20171024_Jie_blood';
myFiles = dir(fullfile(myDir,'test spectra','single text spectrum','white cotn*.txt'));
spectrum = zeros(2151,1);
for k=1:length(myFiles)
    fileName = myFiles(k).name;
    fullFileName = fullfile('test spectra','single text spectrum', fileName);
    spectrum = spectrum + dlmread(fullFileName,'',42,1);
end

spectrum_av = spectrum./10;

%check if the function works correctly

%{
filename = fullfile('test spectra','single text spectrum','white cotn00009.asd.txt');
spectrum = dlmread(filename,'',42,1);

figure();hold on;
plot(350:2500, spectrum);
plot(350:2500, ans);
%}
%This function works correctly
end

