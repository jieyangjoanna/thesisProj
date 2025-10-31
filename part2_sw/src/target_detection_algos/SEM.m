function [idx_bckgrd]= SEM()


%% I0
clear all; close all;clc;
path = 'C:\Users\jieyang\OneDrive - Lenovo\202403JieThesis\02122018\image processing2';
addpath(path)
%fileIm = dir(fullfile(path,'I_GF.bmp'));
fileIm = dir(fullfile(path,'02122018_correct_R690G550B850_FalseColorWithChromAbr_com.bmp'));
I0 = fullfile(path,fileIm.name);
I0 = imread(I0);figure();imshow(I0,[]);title('Original Image')

%% ROI 
print("Please choose ROI!")
path = 'C:\Users\jieyang\OneDrive - Lenovo\202403JieThesis\TargetDecPackage\data';
addpath(path)
load('WC.mat');%GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, 
figure,imshow(ROI,[0,1]);

idx_ROI = find(ROI>0);
[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);
% selected ROI on image.
I_ROI = double(I(idx_ROI,:));

%% SEM
class_substance = 6; %(non-blood substance + blood, except background)
class_total = 7;

pixel_total=length(idx_ROI);
pixel_GF_bld = int64(0.02*pixel_total);
pixel_GF_sub = int64(0.01*pixel_total);
%pixel_GF_bld = 1274; GF blood pixel number
%pixel_GF_sub = 635;GF substance pixel number

%pixel_one_sub = 600; % one substance contains approximately 600 pixels
pixel_bckgrd = pixel_total - (class_substance-1)*pixel_GF_sub - pixel_GF_bld;
pixel_substance = (class_substance-1)*pixel_GF_sub + pixel_GF_bld;

% priori class probability
%p_substance = pixel_one_sub/pixel_total;
%p_bakgrd = (pixel_total - class_substance*pixel_one_sub)/pixel_total;

% randomly choose pixels from all pixels in the ROI
idx_all = randperm(pixel_total)';
pixel_pool = (1:pixel_total)';
idx_substance = pixel_pool(idx_all(1:pixel_substance));

% assuming no pixel number difference between blood and other substances
randomi_substance = randi(class_substance,pixel_substance,1); %create an random integer class from 1 to 7 for each pixel
%randomi_1 = randi(class_total,total_pixel,1); % every initialization is different
p_substance_of_i = zeros(1,class_substance);
%p_of_i = [1/class_num, 1/class_num, 1/class_num, 1/class_num, 1/class_num, 1/class_num, 1/class_num]; % p(i)=1/class_num at initialization

% step=1

I_ROI_norm = I_ROI;%./255;



mean_substance_of_i = zeros(class_substance,k);
S_substance_of_i = cell(1,class_substance);
for i = 1:6
    p_substance_of_i(i) = sum(randomi_substance==i)/pixel_total; % p(i)
    mean_substance_of_i(i,:) = mean(I_ROI_norm(idx_substance(find(randomi_substance==i)),:),1); % class mean
    I_i_muSub = I_ROI_norm(idx_substance(find(randomi_substance==i)),:) - ones(length(nonzeros(randomi_substance==i)),1)*mean_substance_of_i(i,:);
    S_substance_of_i{i} = cov(I_i_muSub);
end

idx_bckgrd = idx_all(pixel_substance+1:pixel_total);
p_bckgrd = length(idx_bckgrd)/pixel_total;
mean_bckgrd = mean(I_ROI_norm(idx_bckgrd,:),1);
I_bckgrd_muSub = I_ROI_norm(idx_bckgrd,:) - ones(length(idx_bckgrd),1)*mean_bckgrd;
S_bckgrd = cov(I_bckgrd_muSub);

p_of_i = [p_substance_of_i,p_bckgrd];
mean_of_i = [mean_substance_of_i;mean_bckgrd];
S_of_i = cell(1,class_total);
for i = 1:class_total
    if i<=6
        S_of_i{i} = S_substance_of_i{i};
    else if i>6
            S_of_i{i} = S_bckgrd;
    end
    end
end

S_of_i_reciprocal = cell(1,class_total);
for i = 1:class_total
    S_of_i_reciprocal{i} = 1./S_of_i{i};
end


% the a posteriori probability of each pixel x
l=3;
pos_p_x = zeros(size(I_ROI_norm,1),class_total);
pos_p_x_ln = zeros(size(I_ROI_norm,1),class_total);
mahalanobis_distance = zeros(size(I_ROI_norm,1),class_total);
for j =1: size(I_ROI_norm,1)
    for i = 1:7
        mahalanobis_distance(j,i) = (I_ROI_norm(j) - mean_of_i(i,:))*S_of_i_reciprocal{i}*(I_ROI_norm(j)-mean_of_i(i,:))';
        % pos_p_x and pos_p_x_ln have the same vote result
        pos_p_x(j,i) = p_of_i(i)*(2*pi)^(-l/2)*(det(S_of_i{i}))^(-0.5)*exp(-0.5*mahalanobis_distance(j,i)); % increase monotonically
        pos_p_x_ln(j,i) = (log(p_of_i(i)) - l/2*log(2*pi) - 1/2*log(abs(det(S_of_i{i})))- 1/2*mahalanobis_distance(j,i));% increase monotonically
        %if i < 7
        %    mahalanobis_distance(j,i) = (I_ROI_norm(j) - mean_substance_of_i(i,:))*S_substance_of_i{i}*(I_ROI_norm(j)-mean_substance_of_i(i,:))';
            %HIS_x = 
        %    pos_p_x(j,i) = p_substance_of_i(i)*(det(S_substance_of_i{i}))^(-0.5)*exp(-0.5*mahalanobis_distance(j,i));
        %    pos_p_x_ln(j,i) = log(p_substance_of_i(i)) - l/2*log(2*pi) - 1/2*log(abs(det(S_substance_of_i{i})))- 1/2*mahalanobis_distance(j,i);%
        %elseif i == 7
        %    mahalanobis_distance(j,i) = (I_ROI_norm(j) - mean_bckgrd)*S_bckgrd*(I_ROI_norm(j)-mean_bckgrd)';
            %HIS_x = 
       %     pos_p_x(j,i) = p_bckgrd*(det(S_bckgrd))^(-0.5)*exp(-0.5*mahalanobis_distance(j,i));
       %     pos_p_x_ln(j,i) = -(log(p_bckgrd) - l/2*log(2*pi) - 1/2*log(abs(det(S_bckgrd)))- 1/2*mahalanobis_distance(j,i));%
       % end
    end
end



class_assign = zeros(size(I_ROI_norm,1),7);
sorted_pos_p = zeros(size(I_ROI_norm,1),7);
for j = 1: size(I_ROI_norm,1)
    [sorted_pos_p(j,:), idx_substance] = sort(pos_p_x_ln(j,:),'descend');
    class_assign(j,:) = idx_substance;
    %[~,idx] = max(pos_p_substance(j,1:6));
    %class_assign(j) = idx;
end

% if condition does not meet, error message will be displayed
% assert(sum(class_assign(:,1)==1), size(I_ROI_norm,1),'not all pixels are assigned to background class,7')


[~,idx_all] = sort(sorted_pos_p(:,1),'descend');
idx_bckgrd = idx_all(1:pixel_total-pixel_substance);
idx_substance = idx_all(pixel_total - pixel_substance +1:end);

%figure,scatter(1:length(idx_substance), class_assign, "*")


idx_bckgrd_im = idx_ROI(idx_bckgrd);
imgSize = [m,n];
[row, col]=ind2sub(imgSize, idx_bckgrd_im);


%ROI_GF_less_bckgrd_R = double(ROI_GF_less_bckgrd).*double(I0(:,:,1));
%figure,imshow(uint8(ROI_GF_less_bckgrd_R),[])


ROI_GF_less_bckgrd_R = double(ROI).*double(I0(:,:,1));
figure,imshow(uint8(ROI_GF_less_bckgrd_R),[]);title('ROI Red channel')


pixels = ROI_GF_less_bckgrd_R(sub2ind(imgSize, row, col));
figure, imshow(ROI_GF_less_bckgrd_R);
hold on;
plot(col, row, 'b*');
hold off

save('idx_bckgrd_WC.mat', 'idx_bckgrd') % issues with RF, BCmid, BCoutter, J, GRNF 
% GRNF, RF, BCinner, BCmid, BCOutter: all pixels are background
% RF: 
end