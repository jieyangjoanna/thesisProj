function [ Im_out ] = Lens_Cor( Im_in )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

m = 2748;n=3840;
f = 8.5;%mm focal length of lens
pix = 1.67*10^(-3); %um
x = cat(2, n/2:-1:1,1:1:n/2);
y = cat(2, m/2:-1:1,1:1:m/2);
y = y';
[X,Y]=meshgrid(x,y);
tan_theta = ((X*pix/f).^2 + (Y*pix/f).^2).^(0.5);
theta = atan(tan_theta);%radians
nn=2.7; % lens falloff cos (theta)^n
lens_falloff = cos(theta).^(nn);

Im_out = Im_in./lens_falloff;
end

