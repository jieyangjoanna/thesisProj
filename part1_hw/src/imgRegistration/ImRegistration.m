function [ reCovered] = ImRegistration(movingIm, fixedIm, movingPoints, fixedPoints)
%ImRegistration is used to register images taken by iphone to images taken
%by MSI camera
%   Manytimes, bloodstains on black fabrics is not seen when taking images
%   by the MSI system. But when the images are zoomed in and taken by RGB
%   cell phone cameras, bloodstains can be seen. Therefore, the bloodstain
%   ground truth can be extracted by using the images taken by iphone and
%   register the images to the MSI image




%% control point selection

%cpselect(movingIm, fixedIm);

% open the control points selection tool; 
% movingIm is image taken by iphone; fixedIm is MSI 3D image

% save the control points to the workplace

tform = fitgeotrans(movingPoints,fixedPoints,'nonreflectivesimilarity');
% 'nonreflectivesimilarity' can be changed to 'affine', but compare these
% two results ??

Roriginal = imref2d(size(fixedIm));
reCovered = imwarp(movingIm, tform, 'OutputView',Roriginal);

% compare recovered to original by looking at them side-by-side in a
% montage
%figure, imshowpair(fixedIm, Recovered, 'montage')
%figure;imshow(fixedIm);title('Base')
%figure;imshow(Recovered);title('Recovered')

%imwrite(Recovered,strcat('IF850_noCalPanel_',num2str(i),'DarkSub_registeredto_04162018_IF690_noCalPanel_correct.bmp'))


%% automatic register
%[optimizer, metric] = imregconfig('multimodal')
%Recovered = imregister(movingIm, fixedIm, 'affine', optimizer, metric);

%figure, imshowpair(fixedIm, Recovered, 'montage')


end
%% image pre-processing for data collected on 06/06/2018
%{
%% average dark
Dark=zeros(m,n);Dark_avg=zeros(m,n);
for i = 0:6
    Dark_single = double(imread(strcat('IF850_noCalPanel_dark',num2str(i),'.bmp')));
    Dark_avg = Dark+Dark_single;
end
Dark_avg = Dark_avg./7;
Dark_avg = uint8(Dark_avg);
imwrite(Dark_avg,'IF850_noCalPanel_dark_avg.bmp');
%% dark subtraction
Dark_avg = imread('IF850_noCalPanel_dark_avg.bmp');
for i =1:100;
    Im = imread(strcat('IF850_noCalPanel_', num2str(i),'.bmp'));
    Im_darkSub = Im - Dark_avg;
    %figure;histogram(Im_darkSub);check if there is negative pixels
    imwrite(Im_darkSub,strcat('IF850_noCalPanel_',num2str(i),'darkSub.bmp'));
end

save('movingPoints_850nm','movingPoints_850nm')
save('fixedPoints_690nm','fixedPoints_690nm')

for i =1:100
    Im = imread(strcat('IF690_noCalPanel_', num2str(i),'DarkSub_registeredto_04162018_IF690_noCalPanel_correct.bmp'));
    Im_cor = Lens_Cor(double(Im),2.8);
    imwrite(uint8(Im_cor),strcat('IF690_noCalPanel_',num2str(i),'DarkSub_registeredto_04162018_IF690_noCalPanel_correct_LensCor.bmp'));
end
%}


   