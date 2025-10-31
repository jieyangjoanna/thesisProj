% In-scene target spectra
% 6/3/2018
% use file "In-scene target.txt"
%% setup environment
path_img = '../data/20180212/image processing2/';
addpath(path_img);
path_targetDetction = '../data/20180212/image processing2/target detection';
addpath(path_targetDetction);
I = imread('02122018_correct_R690G550B850_FalseColorWithChromAbr.bmp');

t_WP = I(1070,731,:);
t_GF = I(641, 1291,:);
t_RF = I(759, 1961,:);
t_BCInner = I(1400, 2023,:);
t_BCMid = I(1079, 2547,:);
t_BCOutter = I(868,2949,:);
t_GRNF = I(1816, 1880,:);
t_J = I(1762, 1338,:);
t_WC = I(1666,853,:);
t_W = I(1685,470,:);

figure;hold on;grid on;
plot([550;690;850],[t_WP(2);t_WP(1);t_WP(3)],'s-','MarkerSize',10,'MarkerFaceColor','k','Color','k')
plot([550;690;850],[t_GF(2);t_GF(1);t_GF(3)],'s:','MarkerSize',10,'MarkerFaceColor','k','Color','k')
plot([550;690;850],[t_RF(2);t_RF(1);t_RF(3)],'s--','MarkerSize',10,'MarkerFaceColor','k','Color','k')
plot([550;690;850],[t_BCInner(2);t_BCInner(1);t_BCInner(3)],'s-.','MarkerSize',10,'MarkerFaceColor','k','Color','k')
plot([550;690;850],[t_BCMid(2);t_BCMid(1);t_BCMid(3)],'s-','MarkerSize',10,'MarkerFaceColor',[0.5 0.5 0.5],'Color',[0.5 0.5 0.5])
plot([550;690;850],[t_BCOutter(2);t_BCOutter(1);t_BCOutter(3)],'s:','MarkerSize',10,'MarkerFaceColor',[0.5 0.5 0.5],'Color',[0.5 0.5 0.5])
plot([550;690;850],[t_GRNF(2);t_GRNF(1);t_GRNF(3)],'s--','MarkerSize',10,'MarkerFaceColor',[0.5 0.5 0.5],'Color',[0.5 0.5 0.5])
plot([550;690;850],[t_J(2);t_J(1);t_J(3)],'s-.','MarkerSize',10,'MarkerFaceColor',[0.5 0.5 0.5],'Color',[0.5 0.5 0.5])
plot([550;690;850],[t_WC(2);t_WC(1);t_WC(3)],'s-','MarkerSize',10,'MarkerFaceColor',[0.8 0.8 0.8],'Color',[0.8 0.8 0.8])
plot([550;690;850],[t_W(2);t_W(1);t_W(3)],'s:','MarkerSize',10,'MarkerFaceColor',[0.8 0.8 0.8],'Color',[0.8 0.8 0.8])
legend('WP','GF','RF','BCInner','BCMid','BCOutter','GRNF','J','WC','W')
xlabel('Wavelength(nm)');
ylabel('In-scene target digital count');
title('Single In-scene Target Spectra')