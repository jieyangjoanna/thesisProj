function [ ] = MSI_Sensitivity()
% MSI_Sensitivity function plots the sensitivity of the 3 spectral filters
% and the sensivity of the CMOS sensor
%   The 3-spectral filters are CWL of 550nm, 690nm, and 850 nm.

% Other filters that widen the bandpass of the 3-spectral filters can be
% added

path = './data/responsivity/';
IF1 = strcat(path, 'IF_T_550nm');
load(IF1);
IF_550 = Vq;

IF2 = strcat(path, 'IF_T_690nm');
load(IF2);
IF_690 = Vq;

IF3 = strcat(path, 'IF_T_850nm');
load(IF3);
IF_850 = Vq;

R = Responsivity();

colorRGB = {[100/255, 175/255, 200/255],[110/255,59/255,49/255], [180/255,106/255,130/255],[202/255,179/255,232/255]};

fig=figure();
left_color = colorRGB{1};
right_color = colorRGB{2};
set(fig, 'defaultAxesColorOrder',[left_color; right_color]);
grid on;
hold on;

yyaxis left
ylim([0 0.6])
plot(R(:,1), R(:,2),'-', 'lineWidth',2);
ylabel('CMOS Responsitivity (A/W)');
yyaxis right
ylim([0 0.6])

plot(400:1000,IF_850(:,1), '-', 'color', colorRGB{2}, 'LineWidth',2);
plot(400:1000,IF_690(:,1), '-.', 'color',colorRGB{2}, 'LineWidth',2);
plot(400:1000,IF_550(:,1), '--', 'color', colorRGB{2},  'LineWidth',2);

plot(400:1000,IF_850(:,99),'-','color', colorRGB{3}, 'LineWidth',2);
plot(400:1000,IF_690(:,99), '-.','color', colorRGB{3}, 'LineWidth',2);
plot(400:1000,IF_550(:,99),'--','color', colorRGB{3}, 'LineWidth',2);

plot(400:1000,IF_850(:,249),'-', 'color', colorRGB{4},'LineWidth',2);
plot(400:1000,IF_690(:,249), '-.','color', colorRGB{4}, 'LineWidth',2);
plot(400:1000,IF_550(:,249),'--', 'color', colorRGB{4},'LineWidth',2);

ylabel('IF normal incidence transmittance')
title('CMOS Sensor Responsivity and IF Normal Incidence Tranmittance')
xlabel('Wavelength (nm)');

legend('CMOS sensor responsivity','IF850nm 0°','IF690nm 0°','IF550nm 0°','IF850nm 10°', 'IF690nm 10°', 'IF550nm 10°', 'IF850nm 24.9°', 'IF690nm 24.9°', 'IF550nm 24.9°')
legend boxoff

figure();grid on;
hold on;
yyaxis left
ylim([0 0.6])
plot(R(:,1), R(:,2),'-', 'lineWidth',2);
ylabel('CMOS Responsitivity (A/W)');
yyaxis right
ylim([0 0.6])
plot(400:1000,IF_850(:,99),'-','color', colorRGB{2}, 'LineWidth',2);
plot(400:1000,IF_690(:,99), '-.','color', colorRGB{2}, 'LineWidth',2);
plot(400:1000,IF_550(:,99),'--','color', colorRGB{2}, 'LineWidth',2);
ylabel('IF transmittance at 10°')
title('CMOS Sensor Responsivity and IF 10° Incidence Tranmittance')
xlabel('Wavelength (nm)');


figure();grid on;
hold on;
yyaxis left
ylim([0 0.6])
plot(R(:,1), R(:,2),'-', 'lineWidth',2);
ylabel('CMOS Responsitivity (A/W)');
yyaxis right
ylim([0 0.6])
plot(400:1000,IF_850(:,249),'-', 'color', colorRGB{3},'LineWidth',2);
plot(400:1000,IF_690(:,249), '-.','color', colorRGB{3}, 'LineWidth',2);
plot(400:1000,IF_550(:,249),'--', 'color', colorRGB{3},'LineWidth',2);
ylabel('IF transmittance at 24.9°')
title('CMOS Sensor Responsivity and IF 24.9° Incidence Tranmittance')
xlabel('Wavelength (nm)');



end



% excute the function

%MSI_Sensitivity('IF_T_550nm.mat', 'IF_T_690nm.mat', 'IF_T_850nm.mat')