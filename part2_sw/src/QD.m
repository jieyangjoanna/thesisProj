% Quadratic detector algorithm visualization

[m0,n0,k0]=size(I0);
multiIm =  zeros(m0,n0,k0);
multiIm(:,:,1)=double(ROI_GF).*double(I0(:,:,1));
multiIm(:,:,2)=double(ROI_GF).*double(I0(:,:,2));
multiIm(:,:,3)=double(ROI_GF).*double(I0(:,:,3));
multiIm = double(reshape(multiIm,[m0*n0,k0]));

Blood_and_non_blood = ROI_GF; % on the whole image scale
Blood = ROI_GF_bloodFullPixel; % on the whole image scale
non_blood = ROI_GF_substrate;
figure,imshow(non_blood,[]);title('non-blood') % on the whole image scale

idx_blood = find(Blood>0);
%[m,n,k]=size(ROI_GF);
%I = reshape(ROI_GF,[m*n,k]);
% selected ROI on image.
I_blood = double(multiIm(idx_blood,:));

idx_nonblood = find(non_blood>0);
I_nonblood = double(multiIm(idx_nonblood,:));



%% 3d
figure, scatter3(I_blood(:,1),I_blood(:,2), I_blood(:,3),40,'r+');
hold on;
scatter3(I_nonblood(:,1), I_nonblood(:,2), I_nonblood(:,3),20, 'ko');
grid on;
xlabel('690nm');ylabel('550nm');zlabel('850nm')

mu = mean(I_nonblood,1)'; %1-by-spectral_no

S = cov(I_nonblood);% spectral_no-by-spectral_no
I_nonblood_muSub = I_nonblood - ones(size(I_nonblood,1),1)*mu'; %

QD_background_score = zeros(size(I_nonblood,1),1);
for i = 1:size(I_nonblood,1)
    QD_background_score(i) = I_nonblood_muSub(i,:) / S * I_nonblood_muSub(i,:)';
end

figure,plot(QD_background_score,'*')


%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  non-blood QD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 2d: 690nm - 850nm

figure, scatter(I_blood(:,1),I_blood(:,3),40,'r+');
hold on;
scatter(I_nonblood(:,1), I_nonblood(:,3),20, 'ko');
grid on;
xlabel('690nm');ylabel('850nm');%zlabel('850nm')

% contour plot for 690nm and 850nm
I_nonblood_2d = I_nonblood(:,1:2:3);

mu_2d = mean(I_nonblood_2d,1)'; %1-by-spectral_no
S_2d = cov(I_nonblood_2d);% spectral_no-by-spectral_no
I_nonblood_2d_muSub = I_nonblood_2d - ones(size(I_nonblood_2d,1),1)*mu_2d'; %
S_2d_reciprocal = 1./S_2d;


%S_2d_inv = inv(S_2d); this is wrong
x = 0:255;
y = 0:255;
[X,Y]=meshgrid(x,y);

%Z_Sinv = (X-mu_2d(1)).^2*S_2d_inv(1,1)+(Y-mu_2d(2)).^2*S_2d_inv(2,1)+(X-mu_2d(1)).^2*S_2d_inv(1,2)+(Y-mu_2d(2)).^2*S_2d_inv(2,2);
Z_Sreciprocal = (X-mu_2d(1)).^2*S_2d_reciprocal(1,1)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,1)+(X-mu_2d(1)).^2*S_2d_reciprocal(1,2)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,2);
%Z_Sreciprocal_noCrossTerm = (X-mu_2d(1)).^2*S_2d_reciprocal(1,1)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,2);
hold on;[M,c]=contour(Z_Sreciprocal, [0, 5, 25, 50, 100, 200, 300,  500, 1000],'ShowText','on');
c.LineWidth=2; 
%hold on;[M,c]=contour(Z_Sreciprocal_noCrossTerm, [0,5,10,15, 50,100],'ShowText','on')
%c.LineWidth=2;grid on
xlim([120 200]);ylim([50 255])
legend('Blood','Substrate')
saveas(gcf,'GF_blood_and_pureSubstrate_QuadraticDetector_contour_BACKGROUND_690nm_850nm.png')


%% 2d: 690nm - 550nm
figure, scatter(I_blood(:,1),I_blood(:,2),40,'r+');
hold on;
scatter(I_nonblood(:,1), I_nonblood(:,2),20, 'ko');
grid on;
xlabel('690nm');ylabel('550nm');%zlabel('850nm')

% contour plot for 690nm and 550nm
I_nonblood_2d = I_nonblood(:,1:1:2);

mu_2d = mean(I_nonblood_2d,1)'; %1-by-spectral_no
S_2d = cov(I_nonblood_2d);% spectral_no-by-spectral_no
I_nonblood_2d_muSub = I_nonblood_2d - ones(size(I_nonblood_2d,1),1)*mu_2d'; %
S_2d_reciprocal = 1./S_2d;

%S_2d_inv = inv(S_2d); this is wrong
x = 0:255;
y = 0:255;
[X,Y]=meshgrid(x,y);
Z_Sreciprocal = (X-mu_2d(1)).^2*S_2d_reciprocal(1,1)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,1)+(X-mu_2d(1)).^2*S_2d_reciprocal(1,2)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,2);
hold on;[M,c]=contour(Z_Sreciprocal, [0,5, 25, 50, 100, 200, 300,  500, 1000, 1500, 2000, 2500],'ShowText','on');
c.LineWidth=2; 
xlim([100 200]);ylim([40 170])
legend('Blood','Substrate')
saveas(gcf,'GF_blood_and_pureSubstrate_QuadraticDetector_contour_BACKGROUND_690nm_550nm.png')
%%  2d: 550nm - 850nm
figure, scatter(I_blood(:,2),I_blood(:,3),40,'r+');
hold on;
scatter(I_nonblood(:,2), I_nonblood(:,3),20, 'ko');
grid on;
xlabel('550nm');ylabel('850nm');%zlabel('850nm')

% contour plot for 550nm and 850nm
I_nonblood_2d = I_nonblood(:,2:1:3);

mu_2d = mean(I_nonblood_2d,1)'; %1-by-spectral_no
S_2d = cov(I_nonblood_2d);% spectral_no-by-spectral_no
I_nonblood_2d_muSub = I_nonblood_2d - ones(size(I_nonblood_2d,1),1)*mu_2d'; %
S_2d_reciprocal = 1./S_2d;

%S_2d_inv = inv(S_2d); this is wrong
x = 0:255;
y = 0:255;
[X,Y]=meshgrid(x,y);
Z_Sreciprocal = (X-mu_2d(1)).^2*S_2d_reciprocal(1,1)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,1)+(X-mu_2d(1)).^2*S_2d_reciprocal(1,2)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,2);
hold on;[M,c]=contour(Z_Sreciprocal, [0,5, 25, 50, 100, 200, 300,  500, 1000, 1500, 2000, 2500, 3000, 3500],'ShowText','on');
c.LineWidth=2; 
xlim([30 180]);ylim([50 200])
legend('Blood','Substrate')
saveas(gcf,'GF_blood_and_pureSubstrate_QuadraticDetector_contour_BACKGROUND_550nm_850nm.png')
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% blood QD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 2d: 690nm - 850nm

figure, scatter(I_blood(:,1),I_blood(:,3),40,'r+');
hold on;
scatter(I_nonblood(:,1), I_nonblood(:,3),20, 'ko');
grid on;
xlabel('690nm');ylabel('850nm');%zlabel('850nm')

% contour plot for 690nm and 850nm
I_blood_2d = I_blood(:,1:2:3);

mu_2d = mean(I_blood_2d,1)'; %1-by-spectral_no
S_2d = cov(I_blood_2d);% spectral_no-by-spectral_no
I_blood_2d_muSub = I_blood_2d - ones(size(I_blood_2d,1),1)*mu_2d'; %
S_2d_reciprocal = 1./S_2d;

%S_2d_inv = inv(S_2d); this is wrong
x = 0:255;
y = 0:255;
[X,Y]=meshgrid(x,y);
Z_Sreciprocal = (X-mu_2d(1)).^2*S_2d_reciprocal(1,1)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,1)+(X-mu_2d(1)).^2*S_2d_reciprocal(1,2)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,2);
hold on;[M,c]=contour(Z_Sreciprocal, [0,5, 25, 50, 100, 200, 300,  500, 1000, 1500, 2000, 2500, 3000, 3500],'ShowText','on');
c.LineWidth=2; 
xlim([120 180]);ylim([50 200])
legend('Blood','Substrate')
saveas(gcf,'GF_blood_and_pureSubstrate_QuadraticDetector_contour_BLOOD_690nm_850nm.png')

%% 2d: 690nm - 550nm
figure, scatter(I_blood(:,1),I_blood(:,2),40,'r+');
hold on;
scatter(I_nonblood(:,1), I_nonblood(:,2),20, 'ko');
grid on;
xlabel('690nm');ylabel('550nm');%zlabel('850nm')

% contour plot for 690nm and 550nm
I_blood_2d = I_blood(:,1:1:2);

mu_2d = mean(I_blood_2d,1)'; %1-by-spectral_no
S_2d = cov(I_blood_2d);% spectral_no-by-spectral_no
I_blood_2d_muSub = I_blood_2d - ones(size(I_blood_2d,1),1)*mu_2d'; %
S_2d_reciprocal = 1./S_2d;

%S_2d_inv = inv(S_2d); this is wrong
x = 0:255;
y = 0:255;
[X,Y]=meshgrid(x,y);
Z_Sreciprocal = (X-mu_2d(1)).^2*S_2d_reciprocal(1,1)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,1)+(X-mu_2d(1)).^2*S_2d_reciprocal(1,2)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,2);
hold on;[M,c]=contour(Z_Sreciprocal, [0,5, 25, 50, 100, 200, 300,  500, 1000, 1500, 2000, 3000, 5000, 10000],'ShowText','on');
c.LineWidth=2; 
xlim([130 170]);ylim([30 165])
legend('Blood','Substrate')
saveas(gcf,'GF_blood_and_pureSubstrate_QuadraticDetector_contour_BLOOD_690nm_550nm.png')
%%  2d: 550nm - 850nm
figure, scatter(I_blood(:,2),I_blood(:,3),40,'r+');
hold on;
scatter(I_nonblood(:,2), I_nonblood(:,3),20, 'ko');
grid on;
xlabel('550nm');ylabel('850nm');%zlabel('850nm')

% contour plot for 550nm and 850nm
I_blood_2d = I_blood(:,2:1:3);

mu_2d = mean(I_blood_2d,1)'; %1-by-spectral_no
S_2d = cov(I_blood_2d);% spectral_no-by-spectral_no
I_blood_2d_muSub = I_blood_2d - ones(size(I_blood_2d,1),1)*mu_2d'; %
S_2d_reciprocal = 1./S_2d;

%S_2d_inv = inv(S_2d); this is wrong
x = 0:255;
y = 0:255;
[X,Y]=meshgrid(x,y);
Z_Sreciprocal = (X-mu_2d(1)).^2*S_2d_reciprocal(1,1)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,1)+(X-mu_2d(1)).^2*S_2d_reciprocal(1,2)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,2);
hold on;[M,c]=contour(Z_Sreciprocal, [0,5, 25, 50, 100, 200, 300,  500, 1000, 1500, 2000, 2500, 3000, 3500],'ShowText','on');
c.LineWidth=2; 
xlim([30 180]);ylim([50 200])
legend('Blood','Substrate')
saveas(gcf,'GF_blood_and_pureSubstrate_QuadraticDetector_contour_BLOOD_550nm_850nm.png')

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% blood - non-blood QD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 2d: 690nm - 850nm

figure, scatter(I_blood(:,1),I_blood(:,3),40,'r+');
hold on;
scatter(I_nonblood(:,1), I_nonblood(:,3),20, 'ko');
grid on;
scatter(mean(I_blood(:,1),1), mean(I_blood(:,3),1),100,'r+','LineWidth',2)
scatter(mean(I_nonblood(:,1),1), mean(I_nonblood(:,3),1),50,'ko','LineWidth',2)
xlabel('690nm');ylabel('850nm');%zlabel('850nm')

% contour plot for 690nm and 850nm
I_blood_2d = I_blood(:,1:2:3);

mu_2d = mean(I_blood_2d,1)'; %1-by-spectral_no
S_2d = cov(I_blood_2d);% spectral_no-by-spectral_no
%I_blood_2d_muSub = I_blood_2d - ones(size(I_blood_2d,1),1)*mu_2d'; %
S_2d_reciprocal = 1./S_2d;

I_nonblood_2d = I_nonblood(:,1:2:3);

mu_2d_nonblood = mean(I_nonblood_2d,1)'; %1-by-spectral_no
S_2d_nonblood = cov(I_nonblood_2d);% spectral_no-by-spectral_no
%I_blood_2d_muSub = I_nonblood_2d - ones(size(I_nonblood_2d,1),1)*mu_2d_nonblood'; %
S_2d_reciprocal_nonblood = 1./S_2d_nonblood;


%S_2d_inv = inv(S_2d); this is wrong
x = 0:255;
y = 0:255;
[X,Y]=meshgrid(x,y);
Z_Sreciprocal_blood = (X-mu_2d(1)).^2*S_2d_reciprocal(1,1)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,1)+(X-mu_2d(1)).^2*S_2d_reciprocal(1,2)+(Y-mu_2d(2)).^2*S_2d_reciprocal(2,2);
Z_Sreciprocal_nonblood = (X-mu_2d_nonblood(1)).^2*S_2d_reciprocal_nonblood(1,1)+(Y-mu_2d_nonblood(2)).^2*S_2d_reciprocal_nonblood(2,1)+(X-mu_2d_nonblood(1)).^2*S_2d_reciprocal_nonblood(1,2)+(Y-mu_2d_nonblood(2)).^2*S_2d_reciprocal_nonblood(2,2);
hold on;[M,c]=contour(Z_Sreciprocal_blood - Z_Sreciprocal_nonblood, [-1000, -500, -300, -200, -100,  0, 100, 200, 300,  500, 1000, 1500, 2000, 2500, 3000, 3500],'ShowText','on');
c.LineWidth=2; 
xlim([120 170]);ylim([50 200])
legend('Blood','Substrate')
saveas(gcf,'GF_blood_and_pureSubstrate_QuadraticDetector_contour_BLOODminusBACKGROUND_690nm_850nm.png')