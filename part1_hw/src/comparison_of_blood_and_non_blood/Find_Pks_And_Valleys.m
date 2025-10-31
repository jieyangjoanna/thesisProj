function [pks, pks_locs, valleys, valy_locs] = Find_Pks_And_Valleys( filename, wavelength_begin, wavelength_end )
%FIND_PKS_AND_VALLEYS Function gives the Peaks Value and its location and Valleys Value and its locations.
%Pks is the Peak value of part of the spectrum, pks_locs is the Peak's
%location in the spectrum, namely wavelength. valleys is the valley value,
%the reflectance (is the spectrum is reflectance). valy_locs is the
%location of the spectrum, namely wavelength (nm). 

%   The spectrum we used here are reflectance, blood and confusors'
%   spectrum. wavelength range is [350 2500]nm. 

%   The input file is often the integrated averaged spectrum.
%   wavelength_begin and wavelength_end defines the wavelength range we
%   want to search the peaks and valleys.

%   

spectrum = dlmread(filename, '', 0, 0);
[pks, max_locs] = findpeaks(spectrum((wavelength_begin - 350+1):(wavelength_end-350+1)));

pks_locs = wavelength_begin + max_locs - 1;


if length(pks_locs) > 1
    if length(pks) == 1
        pks_locs = round(mean(pks_locs));
       % pks = pks;
    else if length(pks) > 1
            pks_locs = pks_locs(find(max(pks)==pks));
            pks = max(pks);
        end
    end
    
end

%% if the max pks have two in common
if length(pks_locs) > 1
pks_locs = round(mean(pks_locs));
end




valleys = min(spectrum( (wavelength_begin - 350+1):(wavelength_end-350+1)));

min_locs = find(spectrum( (wavelength_begin - 350+1):(wavelength_end-350+1)) == valleys);

valy_locs = wavelength_begin + min_locs - 1;


if length(valy_locs) > 1
    if length(valleys) == 1
        valy_locs = round(mean(valy_locs));
        %valleys = valleys;
    else if length(valleys) > 1
            valy_locs = valy_locs(find(min(valleys)==valleys));
            valleys = min(valleys);
        end
    end
    
end

%% if the min valleys have two in common
if length(valy_locs) > 1
valy_locs = round(mean(valy_locs));
end

% in the matlab command line, you have to enter [pks, pks_locs, valleys,
% valy_locs] = Find_Pks_And_Valleys('4BLD_PETIR_av_i.txt', 600, 800) so
% that it outputs all output variables. If you enter
% Find_Pks_And_Valleys('4BLD_PETIR_av_i.txt', 600, 800) it just output the
% first output variable.




end

