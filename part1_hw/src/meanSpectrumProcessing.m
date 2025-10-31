%% mean spectrum processing
spectrum_path = './data/201804_cal_samples/';
addpath(spectrum_path);
spec1 = dlmread('180413_1042_R079_T088.sig','',25,0);
m_int = interp1(spec1(:,1), spec1(:,4), 350:2500);
file = fopen(strcat(spectrum_path, 'Spectrolon.txt'),'w');
fprintf(file, '%20s%20s\r\n','Wavelength(nm)','Reflectance');
fprintf(file, '%10.4f%10.4f\r\n',[350:2500;m_int/100]);
fclose(file)

spec1 = dlmread('180409_0923_R065_T072.sig','',25,0);
m_int = interp1(spec1(:,1), spec1(:,4), 350:2500);
file = fopen(strcat(spectrum_path, 'Tyvec2layers04092018.txt'),'w');
fprintf(file, '%20s%20s\r\n','Wavelength(nm)','Reflectance');
fprintf(file, '%10.4f%10.4f\r\n',[350:2500;m_int/100]);
fclose(file)

spec1 = dlmread('180409_0921_R065_T067.sig','',25,0);
spec2 = dlmread('180409_0921_R065_T068.sig','',25,0);
spec3 = dlmread('180409_0922_R065_T069.sig','',25,0);
spec4 = dlmread('180409_0922_R065_T070.sig','',25,0);
m = (spec1(:,4)+spec2(:,4)+spec3(:,4)+spec4(:,4))/4;
m_int = interp1(spec1(:,1), m, 350:2500);
file = fopen(strcat(spectrum_path, 'WhiteSandpaper04092018.txt'),'w');
fprintf(file, '%20s%20s\r\n','Wavelength(nm)','Reflectance');
fprintf(file, '%10.4f%10.4f\r\n',[350:2500;m_int/100]);
fclose(file)

spec1 = dlmread('180409_0917_R058_T060.sig','',25,0);
spec2 = dlmread('180409_0918_R058_T061.sig','',25,0);
spec3 = dlmread('180409_0918_R058_T062.sig','',25,0);
spec4 = dlmread('180409_0919_R058_T063.sig','',25,0);
m = (spec1(:,4)+spec2(:,4)+spec3(:,4)+spec4(:,4))/4;
m_int = interp1(spec1(:,1), m, 350:2500);
file = fopen(strcat(spectrum_path, 'BlackSandPaper04092018.txt'),'w');
fprintf(file, '%20s%20s\r\n','Wavelength(nm)','Reflectance');
fprintf(file, '%10.4f%10.4f\r\n',[350:2500;m_int/100]);
fclose(file)

spec1 = dlmread('180409_0929_R073_T075.sig','',25,0);
spec2 = dlmread('180409_0929_R073_T076.sig','',25,0);
spec3 = dlmread('180409_0930_R073_T077.sig','',25,0);

m = (spec1(:,4)+spec2(:,4)+spec3(:,4))/3;
m_int = interp1(spec1(:,1), m, 350:2500);
file = fopen(strcat(spectrum_path, 'LightBlueWall04092018.txt'),'w');
fprintf(file, '%20s%20s\r\n','Wavelength(nm)','Reflectance');
fprintf(file, '%10.4f%10.4f\r\n',[350:2500;m_int/100]);
fclose(file)

tyvec = dlmread('Tyvec2layers04092018.txt','',1,0);
whitesand = dlmread('WhiteSandpaper04092018.txt','',1,0);
blacksand = dlmread('BlackSandPaper04092018.txt','',1,0);
wall = dlmread('LightBlueWall04092018.txt','',1,0);

figure();hold on
plot(tyvec(:,1), tyvec(:,2))
plot(whitesand(:,1), whitesand(:,2))
plot(blacksand(:,1), blacksand(:,2))
plot(wall(:,1), wall(:,2))
legend('tyvec','white paper','black paper','wall');
ylim([0 1])
xlim([350 1000])
