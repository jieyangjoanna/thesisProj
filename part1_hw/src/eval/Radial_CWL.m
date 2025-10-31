function [CWL] = Radial_CWL(path, IF_NO, angle_lowLimit)
%RADIAL_CWL CALCULATES CWL(center wavelength) AT EACH RADIAL AOV
%   Detailed explanation goes here
path = '../../data/';
myFiles = dir(fullfile(path, 'BS_2ndEdition', strcat('*',IF_NO, '_2ndEdition.txt')));
if isempty(myFiles)
    filename = fullfile('BS_2ndEdition','BlueShiftAverage_2ndEdition.txt');
    BS = dlmread(filename,'',1,0);
    CWL= round(str2double(IF_NO)+round(BS(angle_lowLimit*10+1,2)));
else 
    filename = fullfile('BS_2ndEdition',myFiles.name);
    BS = dlmread(filename,'',1,0);%angle_lowLimit corresponds to BS(1,:)
    CWL= round(BS(angle_lowLimit*10+1,2));
end


end

