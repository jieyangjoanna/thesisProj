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


figure();hold on
for i = 1:10:250
    plot(400:1000, IF_550(:,i))
end
hold off
xlim([520 570])
grid on

%% plot IF_550 graph and label only 0.0 degree and 24.9 degree angles

figure();hold on
for i = 1:10:250
    plot(400:1000, IF_550(:,i))
end
hold off
xlim([520 570])
grid on
angle_labels = [[0.0], [0.9:1.0:24.9]];
for i = [1, 250]
    if i == 1
        idx = 1;
    else
        idx = i/10 + 1; % index for angle labels
    end

    
    % Only add label for selected curves
    % Find the peak within the xlim range [810 870]
    x_range = 520:570;
    y_data = IF_550(x_range-399, i);  % Adjust index based on your data
    [peak_val, peak_idx] = max(y_data);
    peak_x = x_range(peak_idx);
    
    % Add text label at the peak
    text(peak_x, peak_val, sprintf('%.1f°', angle_labels(idx)), ...
        'FontSize', 8, 'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'bottom');
end
xlabel("Wavelength (nm)")
ylabel("Transmittance")
print(gcf, 'IF550_3_300dpi.png', '-dpng', '-r300');
%}
%% plot IF_550 graph and label customized angles

%{
% Add text labels at the peak of each curve
angle_labels = [[0.0], [0.9:1.0:24.9]];  % Array of angles: 0, 0.9, 1.9, 2.9, ..., 24.9
for i = [1, [70, 90, 110:10:250]] % for grapgh clarity, only plot selected angles. If plotting all angles, use: i = [1, [10:10:250]]
    if i == 1
        idx = 1;
    else
        idx = i/10 + 1; % index for angle labels
    end

    
    % Find the peak within the xlim range [520 570]
    x_range = 520:570;
    y_data = IF_550(x_range-399, i);  % Adjust index based on your data
    [peak_val, peak_idx] = max(y_data);
    peak_x = x_range(peak_idx);
    
    % Add text label at the peak
    text(peak_x, peak_val, sprintf('%.1f°', angle_labels(idx)), ...
        'FontSize', 8, 'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'bottom');
end
xlabel("Wavelength (nm)")
ylabel("Transmittance")
%}



IF2 = strcat(path, 'IF_T_690nm');
load(IF2);
IF_690 = Vq;

figure();hold on
for i = 1:10:250
    plot(400:1000, IF_690(:,i))
end
hold off
xlim([655 715])
grid on

%% plot IF_690 graph and label only 0.0 degree and 24.9 degree angles
%{
figure();hold on
for i = 1:10:250
    plot(400:1000, IF_690(:,i))
end
hold off
xlim([655 715])
grid on
angle_labels = [[0.0], [0.9:1.0:24.9]];
for i = [1, 250]
    if i == 1
        idx = 1;
    else
        idx = i/10 + 1; % index for angle labels
    end

    
    % Only add label for selected curves
    % Find the peak within the xlim range [810 870]
    x_range = 655:715;
    y_data = IF_690(x_range-399, i);  % Adjust index based on your data
    [peak_val, peak_idx] = max(y_data);
    peak_x = x_range(peak_idx);
    
    % Add text label at the peak
    text(peak_x, peak_val, sprintf('%.1f°', angle_labels(idx)), ...
        'FontSize', 8, 'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'bottom');
end
xlabel("Wavelength (nm)")
ylabel("Transmittance")
print(gcf, 'IF690_3_300dpi.png', '-dpng', '-r300');
%}
%% plot IF_690 graph and label customized angles
%{
% Add text labels at the peak of each curve
angle_labels = [[0.0], [0.9:1.0:24.9]];  % Array of angles: 0, 0.9, 1.9, 2.9, ..., 24.9
label_interval = 3;  % Label every 2nd curve
for i = [1, [80:10:250]]
    if i == 1
        idx = 1;
    else
        idx = i/10 + 1; % index for angle labels
    end

    if i < 230
        % Only add label for selected curves
        if mod(idx-1, label_interval) == 0
            % Find the peak within the xlim range [655 715]
            x_range = 655:715;
            y_data = IF_690(x_range-399, i);  % Adjust index based on your data
            [peak_val, peak_idx] = max(y_data);
            peak_x = x_range(peak_idx);
            
            % Add text label at the peak
            text(peak_x, peak_val, sprintf('%.1f°', angle_labels(idx)), ...
                'FontSize', 8, 'HorizontalAlignment', 'center', ...
                'VerticalAlignment', 'bottom');
        end
    end
end
% (i >= 230)
for i = 230:20:250
    idx = i/10 + 1; % index for angle labels
    %if idx == 250/10 + 1 % i = 250, plots the 24.9 degree angle
    x_range = 655:715;
    y_data = IF_690(x_range-399, i);  % Adjust index based on your data
    [peak_val, peak_idx] = max(y_data);
    peak_x = x_range(peak_idx);
    
    % Add text label at the peak
    text(peak_x, peak_val, sprintf('%.1f°', angle_labels(idx)), ...
        'FontSize', 8, 'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'bottom');
   % end
end
xlabel("Wavelength (nm)")
ylabel("Transmittance")
%}

IF3 = strcat(path, 'IF_T_850nm');
load(IF3);
IF_850 = Vq;

%% plot IF_850 graph and label only 0.0 degree and 24.9 degree angles
%{ 
figure();hold on
for i = 1:10:250
    plot(400:1000, IF_850(:,i))
end
hold off
xlim([810 870])
grid on
angle_labels = [[0.0], [0.9:1.0:24.9]];
for i = [1, 250]
    if i == 1
        idx = 1;
    else
        idx = i/10 + 1; % index for angle labels
    end

    
    % Only add label for selected curves
    % Find the peak within the xlim range [810 870]
    x_range = 810:870;
    y_data = IF_850(x_range-399, i);  % Adjust index based on your data
    [peak_val, peak_idx] = max(y_data);
    peak_x = x_range(peak_idx);
    
    % Add text label at the peak
    text(peak_x, peak_val, sprintf('%.1f°', angle_labels(idx)), ...
        'FontSize', 8, 'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'bottom');
end
xlabel("Wavelength (nm)")
ylabel("Transmittance")
print(gcf, 'IF850_3_300dpi.png', '-dpng', '-r300');
%}
%% plot IF_850 graph and label customized angles
%{
% Add text labels at the peak of each curve
angle_labels = [[0.0], [0.9:1.0:24.9]];  % Array of angles: 0, 0.9, 1.9, 2.9, ..., 24.9
label_interval = 3;  % Label every 2nd curve
for i = [1, [80:10:250]]
    if i == 1
        idx = 1;
    else
        idx = i/10 + 1; % index for angle labels
    end

    if i < 230
        % Only add label for selected curves
        if mod(idx-1, label_interval) == 0
            % Find the peak within the xlim range [810 870]
            x_range = 810:870;
            y_data = IF_850(x_range-399, i);  % Adjust index based on your data
            [peak_val, peak_idx] = max(y_data);
            peak_x = x_range(peak_idx);
            
            % Add text label at the peak
            text(peak_x, peak_val, sprintf('%.1f°', angle_labels(idx)), ...
                'FontSize', 8, 'HorizontalAlignment', 'center', ...
                'VerticalAlignment', 'bottom');
        end
    end
end
% (i >= 230)
for i = 230:20:250
    idx = i/10 + 1; % index for angle labels
    %if idx == 250/10 + 1 % i = 250, plots the 24.9 degree angle
    x_range = 810:870;
    y_data = IF_850(x_range-399, i);  % Adjust index based on your data
    [peak_val, peak_idx] = max(y_data);
    peak_x = x_range(peak_idx);
    
    % Add text label at the peak
    text(peak_x, peak_val, sprintf('%.1f°', angle_labels(idx)), ...
        'FontSize', 8, 'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'bottom');
   % end
end
xlabel("Wavelength (nm)")
ylabel("Transmittance")
%}

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