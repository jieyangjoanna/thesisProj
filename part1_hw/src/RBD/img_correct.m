function [ Im_correct ] = img_correct()
% IM_CORRECT corrects the input image non-uniformity, dark subtraction, and
% lens vignetting. 
%   This function does not calibrate the image into reflectance or
%   radiance.
%   The input image is Im, and corresponding dark image is Im_dark

path = '../../data/20180416_cal_panel/';
file = dir(fullfile(path,'04162018_IF850.bmp'));
I = imread(fullfile(path,file.name));

I = double(I);
[m,n,d] = size(I);
if d == 1
    I = I;
elseif d == 3
    I = I(:,:,1);
else 
    print('Wrong input image dimension!');
    Im_correct = 0;
end
   
% path = 'C:\AcademicProjects\CRISIS_Camra\MSI image processing\MSI images\03302018\04162018CalPanel';
file = dir(fullfile(path,'04162018_IF850_dark.bmp'));
Im_dark = imread(fullfile(path,file.name));

Dark = double(Im_dark);

[m,n,d] = size(Dark);
if d == 1
    Dark = Dark;
elseif d == 3
    Dark = Dark(:,:,1);
else 
    print('Wrong input image dimension!');
    Im_correct = 0;
end

I_dark_subtr = I - Dark;
I_dark_subtr = max(0,I_dark_subtr); %set negative pixel values to zero

% CMOS sensor Non-uniformity correction
% use integrated Radiance and normalized by radiance value
path_data = '../../data/';
FPNGain_IntR = dlmread(strcat(path_data, 'FPNGain_IntegratedRadianceNormalize.csv'),',',0,0);
FPNGain_IntR_Mean = mean(mean(FPNGain_IntR,2),1);
FPNReadNoise_IntR = dlmread(strcat(path_data, 'FPNReadNoise_IntegrateRadianceNormalize.csv'),',',0,0);
I_dark_subtr_CMOSNonUniCor= (I_dark_subtr (1:2744, 1:3840) - FPNReadNoise_IntR)./FPNGain_IntR*FPNGain_IntR_Mean;
I_dark_subtr_CMOSNonUniCor = vertcat( I_dark_subtr_CMOSNonUniCor, I_dark_subtr(2745:2748, :));
I_dark_subtr_CMOSNonUniCor = max(0, I_dark_subtr_CMOSNonUniCor);%set negative pixel values to zero

% lens fall off correction
I_dark_subtr_CMOSNonUniCor_LensCor = Lens_Cor(I_dark_subtr_CMOSNonUniCor);

%I = uint8(I_dark_subtr_CMOSNonUniCor_LensCor);
%h=ones(3,3)/9;
%I = imfilter(I_dark_subtr_CMOSNonUniCor_LensCor,h, 'replicate');

Im_correct = I_dark_subtr_CMOSNonUniCor_LensCor;

Im_correct = uint8(Im_correct);

end


%i = find('03302018_IF850_alignedto690.bmp' == '.');   
% imwrite(Im_correct, strcat(Im(1:i-1), '_correct.bmp'));
