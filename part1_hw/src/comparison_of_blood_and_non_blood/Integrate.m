function [ spec_av_i ] = Integrate( filename )
%INTEGRATE FUNCTION integrates 5nm wavelengths
%   The input wavelength gap is 1 nm, it is the spectrum of blood or none blood samples. The output
%   of the function averages the spectrum by the neighbourhood of 5nm. For
%   example, the output spectrum (reflectance or radiance) of 500nm is
%   averaged by 498nm, 499nm, 500nm, 501nm, 502nm spectrum (reflectance or
%   radiance).

spec_av = dlmread(filename, '');

spec_av_u1 = [spec_av(2:end); spec_av(end)];
spec_av_u2 = [spec_av_u1(2:end); spec_av_u1(end)];
spec_av_d1 = [spec_av(1); spec_av(1:end-1)];
spec_av_d2 = [spec_av_d1(1); spec_av_d1(1:end-1)];
spec_av_i = mean([spec_av_u1 spec_av_u2 spec_av spec_av_d1 spec_av_d2],2);

filenameNew = strcat(filename(1:end-4), '_i', '.txt');

fileID = fopen(filenameNew, 'w');
fprintf(fileID, '%12.4f\n', spec_av_i);
fclose(fileID);


end

