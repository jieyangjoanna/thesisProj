function [Mahalanobis_dist_squared] = Chi_square_test(I)
%Chi_SQUARE_TEST is used to test if the variable under test follows
%multivariate normal distribution.

%  The chi-square distribution with k degrees of freedom is the
%  distribution of a sum of the squares of k independent standard normal
%  random variables.

% Input variable I has a pixel_number-by-spectral_number dimension.

mu = mean(I,1)'; %1-by-spectral_no

I_muSub = I - ones(size(I,1),1)*mu'; % size of I, pix_no-by-spectral_no
S = cov(I_muSub);
%I_muSub_inv = I_muSub'; % size is the transpose of I's size
Mahalanobis_dist_squared = sum(I_muSub / S .* I_muSub, 2);



end