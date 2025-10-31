function [ d_uniq, chi2_uniq, deviation] = MVN(I)
% MVN ANALYSIS THE NORMALITY OF IMAGE I

% MVN: multi-variate normal distribution

%   This function analysis the normlaity of image I using Chi square
%   distrition
%   Input image I has the 2D dimension pixel-number-by-spectral-band

I = double(I);

%% d_i
mu = mean(I,1);
I_muSub = I - ones(m*n,1)*mu;
S = cov(I_muSub);
I_muSub_inv = I_muSub';
for i = 1: m*n
    d(i) = I_muSub(i,:) / S * I_muSub_inv(:,i);
end
d= d';
d = sort(d,'ascend');
[d_uniq, d_idx] = unique(d);
alpha = zeros(length(d_uniq),1);
for i = 1: length(d_uniq)-1
    alpha(i) = (d_idx(i+1)-d_idx(1))/(m*n);
end
alpha(end) = alpha(end-1);

%% inverse chi-square 
df =3; % degree of fredom, this can be the number of spectral band
chi2_uniq = chi2inv(alpha, df); 

%% Q-Q plot(quantile - quantile plot)
figure();hold on; grid on;
plot(chi2_uniq, d_uniq, 'b+');
plot(0:0.01:min(max(d_uniq), max(chi2_uniq)), 0:0.01:min(max(d_uniq), max(chi2_uniq)), 'k-.', 'linewidth', 1.5);
title('Q-Q plot of White Poly Data');xlabel('Chi-squared distribution quantiles');ylabel('Squared Mahalanobis distance');
hold off;

%% Quantify deviation from y=x line
deviation = sum((d_uniq - chi2_uniq).^2)/(length(d_uniq)-1);% 88.15

end

