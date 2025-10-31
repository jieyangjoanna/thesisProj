function [ R ] = Responsivity( )
%R means camera responsivity, QE mean quantum efficiency
%   R functoin converts camera QE data into Responsivity data
path = './data/responsivity/CameraQE/';
% file = fullfile('CameraQE','QE.txt');
QE = dlmread(strcat(path, 'QE.txt'), ',', 1, 0); %wavelength and QE

Response = QE(:,1).*QE(:,2)/1240.8;% only responsivity, based on QE=R/lambda*1240.8


%since interp1 only suits for unique values being interpolated, no
%duplicated values or values that are too close
[R_wavelength, idx] = unique(QE(:,1));
R_responsivity = Response(idx);

Response = interp1(R_wavelength, R_responsivity, 400:1:1000, 'linear', 'extrap');

R = zeros(601,2);
R(:,1) = (400:1:1000)';%wavelength
R(:,2) = Response';%responsivity

figure();
%scatter(R(:,1),R(:,2),70, 'filled', 'Marker', 'o');
plot(R(:,1), R(:,2),'-', 'lineWidth',3);
ax=gca;
ax.FontSize =14;
ax.YLim = [0 0.2];
xlabel('Wavelength (nm)');ylabel('Responsivity (A/W)'); title('Camera Spectral Responsivity');

end

