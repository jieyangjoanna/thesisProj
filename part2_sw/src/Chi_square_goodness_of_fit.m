function [] = Chi_square_goodness_of_fit()
%Chi_square_goodness_of_fit() uses the GF (gray felt) as an example
%substrate to compare the distribution between background with blood and
%non-blood substance, and the background without blood or non-blood
%substance, namely uniform background. The uniform background is supposed
%to have normal distribution, which shows a good goodness_of_fit, however,
%with blood pixels and non-blood substance pixels contaiminated, it does
%not follow normal distribution, so the goodness_of_fit criteria shows a
%big misalignment between the normal distribution.

% clear all; close all; clc;
% I0 image path
path_img = '../data/20180212/image processing2/';
addpath(path_img);
%fileIm = dir(fullfile(path,'I_GF.bmp'));
fileIm = dir(fullfile(path_img, '02122018_correct_R690G550B850_FalseColorWithChromAbr_com.bmp'));
I0 = fullfile(path_img, fileIm.name);
I0 = imread(I0);figure();imshow(I0,[]);title('Original Image')


I0_cut = I0(445:820,1100:1465,:);
figure,imshow(I0_cut, [])

%% Subset of image
path_data = '../data/';
addpath(path_data);
load('GF.mat') %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, 
figure,imshow(ROI,[0,1]);
idx_ROI = find(ROI>0);

[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);

% selected ROI on image.
I_ROI = double(I(idx_ROI,:));

[Mahalanobis_dist_squared_GF] = Chi_square_test(I_ROI);
 % Define the percentiles
percentiles = 0:1:100;


% Compute the quantiles
Mahalanobis_dist_quantiles_GF = prctile(Mahalanobis_dist_squared_GF, percentiles);

% this is the chi-square quantiles with 3 degrees of freedom
% chi2inv(p,3): "p" is the probability value for which you want to find
% the quantile.
% y_ = chi2inv(probabilities, 3);

%  To find the chi-square quantiles with 3 degrees of freedom in MATLAB, use the chi2inv function, 
%  specifying the desired probability levels and the degrees of freedom as 3: chi2inv(p, 3); 
%  where "p" is the vector of probability levels you want to find the quantiles for.
Chi_quantiles_GF = chi2inv(percentiles/100, 3);

figure, plot(Chi_quantiles_GF, Mahalanobis_dist_quantiles_GF,  'b*-', 'linewidth', 2);
hold on; grid on
plot(Chi_quantiles_GF, Chi_quantiles_GF, 'k-.', 'linewidth', 2)
xlabel('Chi-squared distribution quantiles');ylabel('Squared Mahalonobis distance quantiles')
legend('data distribution','ideal normal distribution')
% the cumulative distribution function of Mahalanobis_dist_squared, evaluated at values in x.
% this is the x-value of the Q-Q plot
%  probabilities = cdf(Mahalanobis_dist_squared, step);  



%% show the image of GF ROI, and the image of the uniform region of GF ROI
ROI_GF_R = double(ROI(445:820,1100:1465,:)).*double(I0_cut(:,:,1));
ROI_GF_G = double(ROI(445:820,1100:1465,:)).*double(I0_cut(:,:,2));
ROI_GF_B = double(ROI(445:820,1100:1465,:)).*double(I0_cut(:,:,3));

ROI_GF(:,:,1) = ROI_GF_R;
ROI_GF(:,:,2) = ROI_GF_G;
ROI_GF(:,:,3) = ROI_GF_B;

figure,imshow(uint8(ROI_GF),[])


% for paper figure purpose
% first find the uniform square on the ROI GF region, then find the
% coordinates on the I0 image
figure, imshow(uint8(ROI_GF),[])
line([130, 130], [260, 320])
line([250, 250], [260, 320])
line([130, 250], [260, 260])
line([130, 250], [320, 320])

ROI_GF_uniform_R = double(ROI(445+260:445+320,1100+130:1100+250,:)).*double(I0(445+260:445+320,1100+130:1100+250,1));
ROI_GF_uniform_G = double(ROI(445+260:445+320,1100+130:1100+250,:)).*double(I0(445+260:445+320,1100+130:1100+250,2));
ROI_GF_uniform_B = double(ROI(445+260:445+320,1100+130:1100+250,:)).*double(I0(445+260:445+320,1100+130:1100+250,3));


ROI_GF_uniform(:,:,1) = ROI_GF_uniform_R;
ROI_GF_uniform(:,:,2) = ROI_GF_uniform_G;
ROI_GF_uniform(:,:,3) = ROI_GF_uniform_B;

figure,imshow(uint8(ROI_GF_uniform),[])


%% plot a uniform square Q-Q plot
% 1100 + 130 = 1230
% 1100 + 250 = 1350
% 445 + 260 = 705
% 445 + 320 = 765
GF_uniform_x = [1230; 1350; 1350; 1230; 1230];
GF_uniform_y = [705; 705; 765; 765; 705];
GF_uniform_region = roipoly(I0, GF_uniform_x, GF_uniform_y);
% GF_uniform_region = I0(705:765,1230:1350,:);
figure, imshow(GF_uniform_region,[])
idx_ROI_GF_uniform_region = find(GF_uniform_region>0);
I_ROI_GF_uniform_region = double(I(idx_ROI_GF_uniform_region,:));

Mahalanobis_dist_squared_GF_uniform = Chi_square_test(I_ROI_GF_uniform_region);

Mahalanobis_dist_squared_quantiles_GF_uniform = prctile(Mahalanobis_dist_squared_GF_uniform, percentiles);
Chi_quantiles_GF_uniform = chi2inv(percentiles/100, 3);

figure,plot(Chi_quantiles_GF_uniform, Mahalanobis_dist_squared_quantiles_GF_uniform, 'b*-', 'linewidth', 2);
hold on; grid on;
plot(Chi_quantiles_GF_uniform, Chi_quantiles_GF_uniform, 'k-.', 'linewidth', 2);
xlabel('Chi-squared distribution quantiles');ylabel('Squared Mahalonobis distance quantiles')
legend('data distribution','ideal normal distribution')

%% extract background pixels on the GF
idx_bckgrd = TargetDet_background_pixels_detection('GF');
idx_bckgrd_im = idx_ROI(idx_bckgrd);

%% Chi-square goodness of fit for background extracted

I_ROI_background_extracted = double(I(idx_bckgrd_im,:));
[Mahalanobis_dist_squared_GF_background_extracted] = Chi_square_test(I_ROI_background_extracted);
 % Define the percentiles
percentiles = 0:1:100;


% Compute the quantiles
Mahalanobis_dist_quantiles_GF_background_extracted = prctile(Mahalanobis_dist_squared_GF_background_extracted, percentiles);

%  To find the chi-square quantiles with 3 degrees of freedom in MATLAB, use the chi2inv function, 
%  specifying the desired probability levels and the degrees of freedom as 3: chi2inv(p, 3); 
%  where "p" is the vector of probability levels you want to find the quantiles for.
Chi_quantiles_GF = chi2inv(percentiles/100, 3);

figure, plot(Chi_quantiles_GF, Mahalanobis_dist_quantiles_GF_background_extracted,  'b*-', 'linewidth', 2);
hold on; grid on
plot(Chi_quantiles_GF, Chi_quantiles_GF, 'k-.', 'linewidth', 2)
xlabel('Chi-squared distribution quantiles');ylabel('Squared Mahalonobis distance quantiles')
legend('data distribution','ideal normal distribution')



end