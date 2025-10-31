function [outputArg1,outputArg2] = TargetDet_background_pixels_detection_advanced(substrate)
%TargetDet_background_pixels_detection_advanced() is the advanced version
%of the func TargetDet_background_pixels_detection().


%   Even though this advanced method is more complicated, the result does
%   not have much difference compared to
%   TargetDet_background_pixels_detection() func, therefore the
%   TargetDet_background_pixels_detection() is used in the end.

% I0 image path
path_img = '../data/20180212/image processing2/';
addpath(path_img);
%fileIm = dir(fullfile(path,'I_GF.bmp'));
fileIm = dir(fullfile(path_img, '02122018_correct_R690G550B850_FalseColorWithChromAbr_com.bmp'));
I0 = fullfile(path_img, fileIm.name);
I0 = imread(I0);figure();imshow(I0,[]);title('Original Image')

% I0_cut = I0(445:820,1100:1465,:);
% figure,imshow(I0_cut, [])
%% Subset of image
path_data = '../data/';
addpath(path_data);
load(strcat(substrate, '.mat')) %GF.mat,BF.mat, BCInner.mat, BCmid.mat, BCOutter.mat, BF.mat, WP.mat, 
figure,imshow(ROI,[0,1]);
idx_ROI = find(ROI>0);

[m,n,k]=size(I0);
I = reshape(I0,[m*n,k]);

% selected ROI on image.
I_ROI = double(I(idx_ROI,:));

figure,histogram(I_ROI(:,1),"BinWidth",1 ), title("1st channel");ylim([0 100])
figure,histogram(I_ROI(:,2),"BinWidth",1 ), title("2nd channel");ylim([0 100])
figure,histogram(I_ROI(:,3),"BinWidth",1 ), title("3rd channel");ylim([0 100])

%% SEM classification

class_substance = 6; %(non-blood substance + blood, except background)
class_total = 7;

%pixel_GF_bld = 1274; % GF blood pixel number
pixel_GF_bld = 786; % RF blood pixel number
pixel_GF_sub = 635;
pixel_total=length(idx_ROI);
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
        mahalanobis_distance(j,i) = (I_ROI_norm(j) - mean_of_i(i,:))/S_of_i{i}*(I_ROI_norm(j)-mean_of_i(i,:))';
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



%{
% do not allow one class of no pixels
% check the distribution of pos_p_x_ln, to see if a criteria exists to
% assign every pixel into a category but still retains class ratio
for i=1:7
    figure, plot(1:length(I_ROI), pos_p_x(:,i), "*");title(strcat('pos\_p\_x\_ ',int2str(i)));
end

for i=1:6
    figure, plot(1:length(I_ROI), abs(pos_p_x(:,i+1) - pos_p_x(:,i)), "*");title(strcat('delta pos\_p\_x\_ ',int2str(i)));
end

% separate background
for i = 1:length(I_ROI)
    pos_p_delta_max_bckgrd_and_substance(i) = pos_p_x(i,7) - max(pos_p_x(i,1:6));
end
figure,plot(1:length(I_ROI), pos_p_delta_max_bckgrd_and_substance,"*");title('delta of 7 to max of 1to6')
%}



class_assign = zeros(size(I_ROI_norm,1),7);
sorted_pos_p = zeros(size(I_ROI_norm,1),7);
for j = 1: size(I_ROI_norm,1)
    [sorted_pos_p(j,:), idx_substance] = sort(pos_p_x_ln(j,:),'descend');
    class_assign(j,:) = idx_substance;
    %[~,idx] = max(pos_p_substance(j,1:6));
    %class_assign(j) = idx;
end

% if condition does not meet, error message will be displayed
assert(sum(class_assign(:,1)==7), size(I_ROI_norm,1),'not all pixels are assigned to background class,7')


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

save('idx_bckgrd_GRNF.mat', 'idx_bckgrd')


%% use the probability distance as the criteria to assign pixel classes. The bigger the probability distance between the substance and background, the chance of assigning 
% the pixel to that class is higher.
%
pos_p_delta_max_bckgrd_and_substance_idx = zeros(length(I_ROI),1);
for i = 1:length(I_ROI)
    [~,idx]=max(pos_p_x(i,1:6));
    pos_p_delta_max_bckgrd_and_substance_idx(i) = idx;
end

figure,plot(1:length(I_ROI), pos_p_delta_max_bckgrd_and_substance_idx, "*"); title('idx of max of 1to6');

% get the pixels that have the biggest distance between background and
% substance cluster
[pos_p_delta_max_bckgrd_and_substance_sort,idx_sort] = sort(pos_p_delta_max_bckgrd_and_substance_idx,'descend');
idx_bckgrd = idx_sort(1:pixel_total-pixel_substance);
idx_substance = idx_sort(pixel_total - pixel_substance +1:end);



%check how many pixels are assigned to class 1 to 6
%
class_num = struct('class_1',0, 'class_2',0, 'class_3',0, 'class_4',0, 'class_5',0, 'class_6',0);

class_num.class_1 = sum(class_assign(idx_substance,2) ==1);
class_num.class_2 = sum(class_assign(idx_substance,2) ==2);
class_num.class_3 = sum(class_assign(idx_substance,2) ==3);
class_num.class_4 = sum(class_assign(idx_substance,2) ==4);
class_num.class_5 = sum(class_assign(idx_substance,2) ==5);
class_num.class_6 = sum(class_assign(idx_substance,2) ==6);

assert(class_num.class_1 + class_num.class_2 + class_num.class_3 + class_num.class_4 + class_num.class_5 + class_num.class_6 == length(idx_substance), 'there are pixels that are assigned wrong!')
%eval(strcat('class_num.class_', int2str(i))) = sum(class_assign(:,2) ==i);
%sum_sub += size()

% the result is that all pixels are assigned to class_3. This marks that
% this method is not applicable.

%% use 100 iterations to assign pixel classes
% randomly assign pixels to each substance
idx_bckgrd_100 = zeros(length(idx_bckgrd),100);
for iter = 1:100
    randomi_substance = randi(class_substance,pixel_substance,1); %create an random integer class from 1 to 7 for each pixel
    
    %%%%%%%%%%%%%%%%%% iter 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%% repeat 100 times, then vote to get the background pixels
    %%%%%%%%% %%%%%%%%%%
    p_substance_of_i = zeros(1,class_substance);
    
    %I_ROI_norm = I_ROI;%./255;
    
    mean_substance_of_i = zeros(class_substance,k);
    S_substance_of_i = cell(1,class_substance);
    for i = 1:6
        p_substance_of_i(i) = sum(randomi_substance==i)/pixel_total; % p(i)
        mean_substance_of_i(i,:) = mean(I_ROI_norm(idx_substance(find(randomi_substance==i)),:),1); % class mean
        I_i_muSub = I_ROI_norm(idx_substance(find(randomi_substance==i)),:) - ones(length(nonzeros(randomi_substance==i)),1)*mean_substance_of_i(i,:);
        S_substance_of_i{i} = cov(I_i_muSub);
    end
    
    %idx_bckgrd = idx_all(pixel_substance+1:pixel_total);
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

    pos_p_x = zeros(size(I_ROI_norm,1),class_total);
    pos_p_x_ln = zeros(size(I_ROI_norm,1),class_total);
    mahalanobis_distance = zeros(size(I_ROI_norm,1),class_total);
    for j =1: size(I_ROI_norm,1)
        for i = 1:7
            mahalanobis_distance(j,i) = (I_ROI_norm(j) - mean_of_i(i,:))/S_of_i{i}*(I_ROI_norm(j)-mean_of_i(i,:))';
            % pos_p_x and pos_p_x_ln have the same vote result
            pos_p_x(j,i) = p_of_i(i)*(2*pi)^(-l/2)*(det(S_of_i{i}))^(-0.5)*exp(-0.5*mahalanobis_distance(j,i)); % increase monotonically
            pos_p_x_ln(j,i) = (log(p_of_i(i)) - l/2*log(2*pi) - 1/2*log(abs(det(S_of_i{i})))- 1/2*mahalanobis_distance(j,i));% increase monotonically
        end
    end

    class_assign = zeros(size(I_ROI_norm,1),7);
    sorted_pos_p = zeros(size(I_ROI_norm,1),7);
    for j = 1: size(I_ROI_norm,1)
        [sorted_pos_p(j,:), idx_substance] = sort(pos_p_x(j,:),'descend');
        class_assign(j,:) = idx_substance;
        %[~,idx] = max(pos_p_substance(j,1:6));
        %class_assign(j) = idx;
    end

    % if condition does not meet, error message will be displayed
    % assert(sum(class_assign(:,1)==7), size(I_ROI_norm,1),'not all pixels are assigned to background class,7')
    
    [~,idx_all] = sort(sorted_pos_p(:,1),'descend');
    idx_bckgrd = idx_all(1:pixel_total-pixel_substance);
    idx_substance = idx_all(pixel_total - pixel_substance +1:end);

    idx_bckgrd_100(:,iter) = idx_bckgrd';

    class_num = struct('class_1',0, 'class_2',0, 'class_3',0, 'class_4',0, 'class_5',0, 'class_6',0);

    class_num.class_1 = sum(class_assign(idx_substance,2) ==1);
    class_num.class_2 = sum(class_assign(idx_substance,2) ==2);
    class_num.class_3 = sum(class_assign(idx_substance,2) ==3);
    class_num.class_4 = sum(class_assign(idx_substance,2) ==4);
    class_num.class_5 = sum(class_assign(idx_substance,2) ==5);
    class_num.class_6 = sum(class_assign(idx_substance,2) ==6);
    
    assert(class_num.class_1 + class_num.class_2 + class_num.class_3 + class_num.class_4 + class_num.class_5 + class_num.class_6 == length(idx_substance), 'there are pixels that are assigned wrong!')

end



pos_p_substance = pos_p_x(idx_substance,1:6);

% in the substances, find the assignment based on the largest poster
% probability

class_assign = zeros(size(idx_substance,2),6);
for j = 1: size(idx_substance,2)
    [sorted_substance, idx_substance] = sort(pos_p_substance(j,:),'descend');
    class_assign(j,:) = idx_substance;
    %[~,idx] = max(pos_p_substance(j,1:6));
    %class_assign(j) = idx;
end

figure,scatter(1:length(idx_substance), class_assign, "*")
% if the result is that all the rest pixels are assigned to the same
% cluster
assert(class_assign)

sum_sub = 0;
for i = 1:6
    eval(strcat('class_',int2str(i),'_num')) = find(pos_p_delta_max_bckgrd_and_substance_idx ==i);
    %sum_sub += size()
end

assert(size(class_6_num,1) + size(class_4_num,1) + size(class_3_num,1) == size(idx_substance,2), 'all pixels are clustered')

class_assign = zeros(size(I_ROI_norm,1),1);
for j = 1: size(I_ROI_norm,1)
    [~,idx] = max(pos_p_x(j,1:6));
    class_assign(j) = idx;
end

figure,scatter(1:length(I_ROI), class_assign, "*")
%figure,hist(class_assign)

p_of_i = zeros(1,class_total);
mean_of_i = zeros(class_total,k);
S_of_i = cell(1,class_total);
mahalanobis_distance = zeros(size(I_ROI_norm,1),class_total);
pos_p_x = zeros(size(I_ROI_norm,1),class_total);
pos_p_x_ln = zeros(size(I_ROI_norm,1),class_total);
iter = 10;

for kk = 1:iter
    figure,scatter(1:length(I_ROI), class_assign, "*")
    
    randomi = class_assign;

    for i = 1:7
        p_of_i(i) = sum(randomi==i)/pixel_total; % p(i)
        mean_of_i(i,:) = mean(I_ROI_norm(find(randomi==i),:),1); % class mean
        I_i_muSub = I_ROI_norm(find(randomi==i),:) - ones(length(nonzeros(randomi==i)),1)*mean_of_i(i,:);
        S_of_i{i} = cov(I_i_muSub);
    end
    for j =1: size(I_ROI_norm,1)
        for i = 1:7
            mahalanobis_distance(j,i) = (I_ROI_norm(j) - mean_of_i(i,:))/S_of_i{i}*(I_ROI_norm(j)-mean_of_i(i,:))';
            %HIS_x = 
            pos_p_x(j,i) = p_of_i(i)*(det(S_of_i{i}))^(-0.5)*exp(-0.5*mahalanobis_distance(j,i));
            pos_p_x_ln(j,i) = (log(p_of_i(i)) - l/2*log(2*pi) - 1/2*log(abs(det(S_of_i{i})))- 1/2*mahalanobis_distance(j,i));%
        end
    end

    %class_assign = zeros(size(I_ROI_norm,1),1);
    for j = 1: size(I_ROI_norm,1)
        [~,idx] = max(pos_p_x_ln(j,:));
        class_assign(j) = idx;
    end
end
    


end