% Jie Yang
% 08192018
AUC_RBD = [AUC_RF AUC_GF AUC_WP AUC_BC AUC_GRNF AUC_J AUC_WC AUC_W AUC_BF];
xlabels = {'RF','GF','WP','BC','GRNF','J','WC','W','BF'};
bar(AUC,'FaceColor',[0.6 0.6 0.6])
set(gca,'xticklabel',xlabels);
grid on
title('AUC by RBD')

figure;
AUC_LocalRX = [AUC_LocalRX_RF AUC_LocaLRX_GF AUC_LocalRX_WP AUC_LocaLRX_BC AUC_LocaLRX_GRNF AUC_LocaLRX_J AUC_LocaLRX_WC AUC_LocaLRX_W AUC_LocaLRX_BF];
xlabels = {'RF','GF','WP','BC','GRNF','J','WC','W','BF'};
bar(AUC,'FaceColor',[0.6 0.6 0.6])
set(gca,'xticklabel',xlabels);
grid on
title('AUC by LocalRX')

figure;
AUC_TAD = [AUC_TAD_RF AUC_TAD_GF AUC_TAD_WP AUC_TAD_BC AUC_TAD_GRNF AUC_TAD_J AUC_TAD_WC AUC_TAD_W AUC_TAD_BF];
xlabels = {'RF','GF','WP','BC','GRNF','J','WC','W','BF'};
bar(AUC,'FaceColor',[0.6 0.6 0.6])
set(gca,'xticklabel',xlabels);
grid on
title('AUC by TAD')

figure;
bar([AUC_RBD', AUC_LocalRX', AUC_TAD'])
set(gca,'xticklabel',xlabels);
grid on
%title('AUC by TAD')
ylabel('AUC')
legend('RBD','LocalRX','TAD')