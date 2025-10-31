%% this is the execute script of RBD method
% J. Yang
% 7/9/2018

clear all;close all;clc
%% input image
path_input = '../../data/inputImages/';
file = dir(fullfile(path_input,'\06152018\06152018_IF690_LWO_RWO_AutoD_CeilLOff.bmp'));
Im = imread(fullfile(strcat(path_input,'\06152018'),file.name));

[~, name, ~]=fileparts(file.name);
IF_NO = name(12:14);% has to be named according to the naming regulation

% display image
figure;imshow(Im,[]);title('Input single band raw image');colorbar

file = dir(fullfile(path_input,'\06152018\06152018_IF690_dark.bmp'));
Im_dark = imread(fullfile(strcat(path_input,'\06152018\'),file.name));


%% dark subtraction and lens vignetting correction
Im_correct = img_correct(Im, Im_dark);
figure;imshow(Im_correct,[]);colorbar;title('Single band image after dark subtract and lens vignetting correction')

path_correct = '../../data/correctedImg/';
path_reg = '../../data/imageRegister/';
imgFile = fullfile(path_correct, strcat(name, '_corrected.mat'));
save(strcat(path_correct, name,'_corrected.mat'),'Im_correct');
%imwrite(Im_correct, imgFile);
%% image registration
file = dir(fullfile(path_correct, '\06152018_IF690_LWO_RWO_AutoD_CeilLOff_corrected.mat'));% this image should not be changed no mater what input image band
base = load(fullfile(path_correct, file.name));
base = base.Im_correct;

file = dir(fullfile(path_correct, '\06152018_IF850_LWO_RWO_AutoD_CeilLOff_corrected.mat'));% this image should not be changed no mater what input image band
move = load(fullfile(path_correct, file.name));
move = move.Im_correct;

[~, name, ~]=fileparts(file.name);
%move = imread(fullfile(strcat(path,'\correctedImg\'), file.name));

% only for 550 nm images
[optimizer, metric] = imregconfig('monomodal')
optimizer.MaximumIterations = 300;
movReg = imregister(move,  base, 'affine', optimizer, metric);

% only for 850 nm images
[optimizer, metric] = imregconfig('multimodal')
optimizer.MaximumIterations = 1000;
optimizer.InitialRadius = 0.009;
optimizer.Epsilon = 2e-4;
optimizer.GrowthFactor = 5;
movReg = imregister(move,  base, 'affine', optimizer, metric,'DisplayOptimization',true);

figure,imshowpair(base, movReg,'Scaling','joint')
save(strcat(path_reg, name,'_registered.mat'),'movReg');
%imwrite(movReg, imgFile)
%{
file = dir(fullfile(path_reg, '\04162018_IF690_noCalPanel_correct.bmp'));% this image should not be changed no mater what input image band
fixedIm = imread(fullfile(path_reg, file.name));

% load movingPoints, fixedPoints manually selected from ImRegistration
% function
file = dir(fullfile(path_reg,strcat('movingPoints_', name,'*.mat')));
movingPoints = cell2mat(struct2cell(load(fullfile(path_reg, file.name))));

file = dir(fullfile(path_reg,strcat('fixedPoints_', name,'*.mat')));
fixedPoints = cell2mat(struct2cell(load(fullfile(path_reg, file.name))));

% save image
%regIm = ImRegistration(Im_correct, fixedIm, movingPoints, fixedPoints);
%imgFile = fullfile(path_correct, strcat(name,'_corrected_registered.mat'));

save(strcat(path_reg, name,'_corrected_registered.mat'),'regIm');
imwrite(regIm, imgFile)
%}
%% reflectance calibration
path_spectra = '../../data/ASDspectra/';
file = dir(fullfile(path_spectra, '\BlackSandPaper04092018.txt'));
blackSandPaper = dlmread(fullfile(path_spectra, file.name), '', 1,0);
Reflectance_BlackPanel = blackSandPaper(:,2);

file = dir(fullfile(path_spectra, '\WhiteSandPaper04092018.txt'));
whiteSandPaper04092018 = dlmread(fullfile(path_spectra, file.name), '', 1,0);
Reflectance_WhitePanel = whiteSandPaper04092018(:,2);

[Black_Panel_x, Black_Panel_y, White_Panel_x, White_Panel_y, Im_ref, CWL, angle_unCal] = Reflectance_Cal2(Reflectance_BlackPanel, Reflectance_WhitePanel, regIm, IF_NO, path);

% save files
path_ref = '../../data/refImages/';
matfile = fullfile(path_ref,strcat(name, '_NoLensCor_Ref_Registered_update.mat'));
save(strcat(path_ref, matfile), 'Im_ref');
path_refEval = '../../data/refEvaluation/';
matfile = fullfile(path_refEval, strcat(name, '_Black_Panel_x_update'));
save(strcat(path_ref, matfile), 'Black_Panel_x');
matfile = fullfile(path_refEval, strcat(name, '_Black_Panel_y_update'));
save(strcat(path_refEval, matfile), 'Black_Panel_y');
matfile = fullfile(path_refEval, strcat(name, '_White_Panel_x_update'));
save(strcat(path_refEval, matfile), 'White_Panel_x');
matfile = fullfile(path_refEval, strcat(name, '_White_Panel_y_update'));
save(strcat(path_refEval, matfile), 'White_Panel_y');
matfile = fullfile(path_refEval, strcat(name, '_CWL_update'));
save(strcat(path_refEval, matfile), 'CWL');
%% RBD

file = dir(fullfile(path_correct, '\06152018_IF690_LWO_RWO_ManualD_CeilLOff_corrected.mat'));% this image should not be changed no mater what input image band
Ref690 = load(fullfile(path_correct, file.name));
Ref690 = double(Ref690.Im_correct)/255;

file = dir(fullfile(path_reg, '\06152018_IF550_LWO_RWO_ManualD_CeilLOff_corrected_registered.mat'));% this image should not be changed no mater what input image band
Ref550 = load(fullfile(path_reg, file.name));
Ref550 = double(Ref550.movReg)/255;

file = dir(fullfile(path_reg, '\06152018_IF850_LWO_RWO_ManualD_CeilLOff_corrected_registered.mat'));% this image should not be changed no mater what input image band
Ref850 = load(fullfile(path_reg, file.name));
Ref850 = double(Ref850.movReg)/255;


%{
file = dir(fullfile(path_ref, '\04162018_IF550_NoLensCor_Ref_Registered_update.mat'));
Ref550 = cell2mat(struct2cell(load(fullfile(path_ref, file.name))));

file = dir(fullfile(path_ref, '\04162018_IF690_NoLensCor_Ref_Registered.mat'));
Ref690 = cell2mat(struct2cell(load(fullfile(path_ref, file.name))));

file = dir(fullfile(path_ref, '\04162018_IF850_NoLensCor_Ref_Registered_update.mat'));
Ref850 = cell2mat(struct2cell(load(fullfile(path_ref, file.name))));
%}
RBD_value = General_RBD(Ref550, Ref690, Ref850);
figure;imshow(RBD_value,[-0.2 0.8])

path_result = '../../results/RBDresult/';
matfile = fullfile(path_result,'RBD_NoLensCor.mat');
save(strcat(path_result, matfile), 'RBD_value');
