function [ Radial_Cut_I, Cut ] = Radial_Cut( angle_lowLimit, Im)
%RADIAL_CUT cut a rectangular image 'Im' into radial AOV circular image,
%which will be used for reflectance calibration from digital number image.
%   angular resolution is set to 1 degree

%input angle_lowLimit is the low limit angle from 0, 1, ..., to 20 degree
%if BS first edition is used. Im is the lens corrected, FPN corrected, dark
%subtracted digital number image.

% each radial_cut image is calibrated separately

i=1:1:249;
circle_Pixel_diag_no = round((tan(0.1*i*pi/180)-tan(0.1*(i-1)*pi/180))*8.5/1.67*1000);
circle_Pixel_diag_no(249) = round(sqrt(1374^2+1920^2))-sum(circle_Pixel_diag_no(1:248));

[rr,cc]=meshgrid(1:3840);
angle_upLimit = angle_lowLimit+1;

if angle_lowLimit ==0
    C_angle_lowLimit = zeros(3840,3840);
else 
    C_angle_lowLimit = sqrt((rr-1920).^2+(cc-1920).^2)<=sum(circle_Pixel_diag_no(1:10*(angle_lowLimit)));
end

if angle_lowLimit <= 23
    C_angle_upLimit = sqrt((rr-1920).^2+(cc-1920).^2)<=sum(circle_Pixel_diag_no(1:10*(angle_upLimit)));
end
if angle_lowLimit == 24
        C_angle_upLimit = sqrt((rr-1920).^2+(cc-1920).^2)<=sum(circle_Pixel_diag_no(1:249));
end

C = C_angle_upLimit-C_angle_lowLimit;
Radial_Cut_I = C(547:3294,1:3840).*Im; 

Cut  = C(547:3294,1:3840);

end

