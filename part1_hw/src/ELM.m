function [betaHat] = ELM(ROI_BlackPanel, ROI_WhitePanel, Reflectance_BlackPanel_CWL, Reflectance_WhitePanel_CWL)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here


input = zeros(length(ROI_BlackPanel)+length(ROI_WhitePanel),2);
input(:,1) = vertcat(ones(length(ROI_BlackPanel),1).*Reflectance_BlackPanel_CWL,ones(length(ROI_WhitePanel),1).*Reflectance_WhitePanel_CWL);
input(:,2) = vertcat(ROI_BlackPanel,ROI_WhitePanel);

m=length(input);
X = [ones(m,1), input(:,1)]; 
y = input(:,2);
betaHat = (X' * X) \ (X' * y);   
disp(betaHat);
%Error = sqrt(sum((y-(X*betaHat)).^2)/(m-1))

xx = linspace(0,1,10);
yy = betaHat(1) + betaHat(2)*xx;
%{
figure();
plot(xx,yy)
hold on;grid on
plot(input(:,1), input(:,2),'or');ylim([0 255]);
hold off
title('ELM')
xlabel('Reflectance');ylabel('Digital Number');
%}
end

