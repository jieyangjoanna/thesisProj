function [] = TargetDet_ROI_cut_for_paper()
clear all; close all;clc;

% I0 image path
path_img = '../data/20180212/image processing2/';
addpath(path_img);
%fileIm = dir(fullfile(path,'I_GF.bmp'));
fileIm = dir(fullfile(path_img, '02122018_correct_R690G550B850_FalseColorWithChromAbr_com.bmp'));
I0 = fullfile(path_img, fileIm.name);
I0 = imread(I0);figure();imshow(I0,[]);title('Original Image')

I0_cut = I0(445:820,1100:1465,:);
%% Subset of image
path_data = '../data/';
addpath(path_data);
load('GF.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, 

ROI_cut = ROI(445:820,1100:1465);

figure,imshow(ROI_cut,[0,1]);
idx_ROI = find(ROI_cut>0);

[m,n,k]=size(I0_cut);
I = reshape(I0_cut,[m*n,k]);

% selected ROI on image.
I_ROI = double(I(idx_ROI,:));

figure,histogram(I_ROI(:,1),"BinWidth",1 ), title("1st channel");ylim([0 100])
figure,histogram(I_ROI(:,2),"BinWidth",1 ), title("2nd channel");ylim([0 100])
figure,histogram(I_ROI(:,3),"BinWidth",1 ), title("3rd channel");ylim([0 100])


%% 
% for paper writing, only cut the Grey Felt
% X, Y coordinates
upper_left_point = [1100, 445];
upper_right_point = [1465, 445];
lower_left_point = [1100, 820];
lower_right_point = [1465, 820];

paper_ROI_GF_less_bckgrd_R = double(ROI(445:820,1100:1465)).*double(I0(445:820,1100:1465,1));
figure,imshow(uint8(paper_ROI_GF_less_bckgrd_R),[]);title('ROI Red channel')
paper_ROI_GF_less_bckgrd_G = double(ROI(445:820,1100:1465)).*double(I0(445:820,1100:1465,2));
figure,imshow(uint8(paper_ROI_GF_less_bckgrd_G),[]);title('ROI Green channel')
paper_ROI_GF_less_bckgrd_B = double(ROI(445:820,1100:1465)).*double(I0(445:820,1100:1465,3));
figure,imshow(uint8(paper_ROI_GF_less_bckgrd_B),[]);title('ROI Blue channel')
end

