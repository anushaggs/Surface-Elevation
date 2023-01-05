%% Surface Elevation Data Analysis - Wave Statistics

% you only want to run this section once (it takes the longest, so I
% sectioned this part out)
% load all data
run_1 = struct2array(load('run_1_dewarped.mat'));
run_2 = struct2array(load('run_2_dewarped.mat'));
run_3 = struct2array(load('run_3_dewarped.mat'));
run_4 = struct2array(load('run_4_dewarped.mat'));
run_5 = struct2array(load('run_5_dewarped.mat'));
run_6 = struct2array(load('run_6_dewarped.mat'));
run_7 = struct2array(load('run_7_dewarped.mat'));
run_8 = struct2array(load('run_8_dewarped.mat'));
run_9 = struct2array(load('run_9_dewarped.mat'));
run_10 = struct2array(load('run_10_dewarped.mat'));
run_11 = struct2array(load('run_11_dewarped.mat'));
run_12 = struct2array(load('run_12_dewarped.mat'));
run_13 = struct2array(load('run_13_dewarped.mat'));
run_14 = struct2array(load('run_14_dewarped.mat'));
run_15 = struct2array(load('run_15_dewarped.mat'));
run_16 = struct2array(load('run_16_dewarped.mat'));
run_17 = struct2array(load('run_17_dewarped.mat'));
run_18 = struct2array(load('run_18_dewarped.mat'));

%%
% pick a pixel position for all analysis (1 to 2168)
pixel = 200;

% Plot Surface Elevation vs. Time

% creating time vector #of images in a run/30=total seconds
time1 = linspace(1,length(run_1)/30,length(run_1))';
time2 = linspace(1,length(run_2)/30,length(run_2))';
time3 = linspace(1,length(run_3)/30,length(run_3))';
time4 = linspace(1,length(run_4)/30,length(run_4))';
time5 = linspace(1,length(run_5)/30,length(run_5))';
time6 = linspace(1,length(run_6)/30,length(run_6))';
time7 = linspace(1,length(run_7)/30,length(run_7))';
time8 = linspace(1,length(run_8)/30,length(run_8))';
time9 = linspace(1,length(run_9)/30,length(run_9))';
time10 = linspace(1,length(run_10)/30,length(run_10))';
time11 = linspace(1,length(run_11)/30,length(run_11))';
time12 = linspace(1,length(run_12)/30,length(run_12))';
time13 = linspace(1,length(run_13)/30,length(run_13))';
time14 = linspace(1,length(run_14)/30,length(run_14))';
time15 = linspace(1,length(run_15)/30,length(run_15))';
time16 = linspace(1,length(run_16)/30,length(run_16))';
time17 = linspace(1,length(run_17)/30,length(run_17))';
time18 = linspace(1,length(run_18)/30,length(run_18))';

run1 = run_1(pixel,:)';
run2 = run_2(pixel,:)';
run3 = run_3(pixel,:)';
run4 = run_4(pixel,:)';
run5 = run_5(pixel,:)';
run6 = run_6(pixel,:)';
run7 = run_7(pixel,:)';
run8 = run_8(pixel,:)';
run9 = run_9(pixel,:)';
run10 = run_10(pixel,:)';
run11 = run_11(pixel,:)';
run12 = run_12(pixel,:)';
run13 = run_13(pixel,:)';
run14 = run_14(pixel,:)';
run15 = run_15(pixel,:)';
run16 = run_16(pixel,:)';
run17 = run_17(pixel,:)';
run18 = run_18(pixel,:)';

% surface elevation plots for every run
figure;
t = tiledlayout(6,3);
nexttile
plot(time1,run1)
nexttile
plot(time2,run2)
nexttile
plot(time3,run3)
nexttile
plot(time4,run4)
nexttile
plot(time5,run5)
nexttile
plot(time6,run6)
nexttile
plot(time7,run7)
nexttile
plot(time8,run8)
nexttile
plot(time9,run9)
nexttile
plot(time10,run10)
nexttile
plot(time11,run11)
nexttile
plot(time12,run12)
nexttile
plot(time13,run13)
nexttile
plot(time14,run14)
nexttile
plot(time15,run15)
nexttile
plot(time16,run16)
nexttile
plot(time17,run17)
nexttile
plot(time18,run18)
t.Title.String = 'Surface Elevation vs. Time for 18 Runs';
t.XLabel.String = 'time (s)';
t.YLabel.String = 'surface elevation (m)';

% Wave Spectrum Plots

% wave spectrum via fourier transform
[E_run1,f_run1] = get_spectrum(run1 - mean(run1),30);
[E_run2,f_run2] = get_spectrum(run2 - mean(run2),30);
[E_run3,f_run3] = get_spectrum(run3 - mean(run3),30);
[E_run4,f_run4] = get_spectrum(run4 - mean(run4),30);
[E_run5,f_run5] = get_spectrum(run5 - mean(run5),30);
[E_run6,f_run6] = get_spectrum(run6 - mean(run6),30);
[E_run7,f_run7] = get_spectrum(run7 - mean(run7),30);
[E_run8,f_run8] = get_spectrum(run8 - mean(run8),30);
[E_run9,f_run9] = get_spectrum(run9 - mean(run9),30);
[E_run10,f_run10] = get_spectrum(run10 - mean(run10),30);
[E_run11,f_run11] = get_spectrum(run11 - mean(run11),30);
[E_run12,f_run12] = get_spectrum(run12 - mean(run12),30);
[E_run13,f_run13] = get_spectrum(run13 - mean(run13),30);
[E_run14,f_run14] = get_spectrum(run14 - mean(run14),30);
[E_run15,f_run15] = get_spectrum(run15 - mean(run15),30);
[E_run16,f_run16] = get_spectrum(run16 - mean(run16),30);
[E_run17,f_run17] = get_spectrum(run17 - mean(run17),30);
[E_run18,f_run18] = get_spectrum(run18 - mean(run18),30);

% wave spectrum plots for each particle under different wind speeds

% n4 particle
figure;
plot(f_run7,E_run7,f_run1,E_run1)
title('Wave spectrum for n4 particle under different wind speeds');
legend('12 m/s', '16 m/s');
xlabel('Frequency (Hz)');
ylabel('Energy');
% to zoom in on the spectrum
% xlim([0.5 3])

% r10 particle
figure;
plot(f_run8,E_run8,f_run2,E_run2)
title('Wave spectrum for r10 particle under different wind speeds');
legend('12 m/s', '16 m/s');
xlabel('Frequency (Hz)');
ylabel('Energy')

% r20 particle
figure;
plot(f_run9,E_run9,f_run3,E_run3)
title('Wave spectrum for r20 particle under different wind speeds');
legend('12 m/s', '16 m/s');
xlabel('Frequency (Hz)');
ylabel('Energy');

% d5 particle
figure;
plot(f_run10,E_run10,f_run4,E_run4)
title('Wave spectrum for d5 particle under different wind speeds');
legend('12 m/s', '16 m/s');
xlabel('Frequency (Hz)');
ylabel('Energy')

% d7 particle
figure;
plot(f_run11,E_run11,f_run5,E_run5)
title('Wave spectrum for d7 particle under different wind speeds');
legend('12 m/s', '16 m/s');
xlabel('Frequency (Hz)');
ylabel('Energy');

% d10 particle
figure;
plot(f_run12,E_run12,f_run6,E_run6)
title('Wave spectrum for d10 particle under different wind speeds');
legend('12 m/s', '16 m/s');
xlabel('Frequency (Hz)');
ylabel('Energy')

% n3 particle
figure;
plot(f_run14,E_run14,f_run13,E_run13)
title('Wave spectrum for n3 particle under different wind speeds');
legend('12 m/s', '16 m/s');
xlabel('Frequency (Hz)');
ylabel('Energy');

% n2 particle
figure;
plot(f_run16,E_run16,f_run15,E_run15)
title('Wave spectrum for n2 particle under different wind speeds');
legend('12 m/s', '16 m/s');
xlabel('Frequency (Hz)');
ylabel('Energy')

% shred particle
figure;
plot(f_run18,E_run18,f_run17,E_run17)
title('Wave spectrum for shred particle under different wind speeds');
legend('12 m/s', '16 m/s');
xlabel('Frequency (Hz)');
ylabel('Energy')

% Wave Statistics

% significant wave height = equal to the average of the highest one-third of the waves
sort1 = sort(run1-mean(run1));
SWH1 = mean(sort1((2*length(run1)/3):length(run1)));

sort2 = sort(run2-mean(run2));
SWH2 = mean(sort2((2*length(run2)/3):length(run2)));

sort3 = sort(run3-mean(run3));
SWH3 = mean(sort3((2*length(run3)/3):length(run3)));

sort4 = sort(run4-mean(run4));
SWH4 = mean(sort4((2*length(run4)/3):length(run4)));

sort5 = sort(run5-mean(run5));
SWH5 = mean(sort5((2*length(run5)/3):length(run5)));

sort6 = sort(run6-mean(run6));
SWH6 = mean(sort6((2*length(run6)/3):length(run6)));

sort7 = sort(run7-mean(run7));
SWH7 = mean(sort7((2*length(run7)/3):length(run7)));

sort8 = sort(run8-mean(run8));
SWH8 = mean(sort8((2*length(run8)/3):length(run8)));

sort9 = sort(run9-mean(run9));
SWH9 = mean(sort9((2*length(run9)/3):length(run9)));

sort10 = sort(run10-mean(run10));
SWH10 = mean(sort1((2*length(run10)/3):length(run10)));

sort11 = sort(run11-mean(run11));
SWH11 = mean(sort11((2*length(run11)/3):length(run11)));

sort12 = sort(run12-mean(run12));
SWH12 = mean(sort12((2*length(run12)/3):length(run12)));

sort13 = sort(run13-mean(run13));
SWH13 = mean(sort13((2*length(run13)/3):length(run13)));

sort14 = sort(run14-mean(run14));
SWH14 = mean(sort14((2*length(run14)/3):length(run14)));

sort15 = sort(run15-mean(run15));
SWH15 = mean(sort15((2*length(run15)/3):length(run15)));

sort16 = sort(run16-mean(run16));
SWH16 = mean(sort16((2*length(run16)/3):length(run16)));

sort17 = sort(run17-mean(run17));
SWH17 = mean(sort17((2*length(run17)/3):length(run17)));

sort18 = sort(run18-mean(run18));
SWH18 = mean(sort18((2*length(run18)/3):length(run18)));

% plot wind speed vs. significant wave height for each particle type
wind_speed = [12, 16];
n4_SWH = [SWH7,SWH1];
r10_SWH = [SWH8,SWH2];
r20_SWH = [SWH9,SWH3];
d5_SWH = [SWH10,SWH4];
d7_SWH = [SWH11,SWH5];
d10_SWH = [SWH12,SWH6];
n3_SWH = [SWH14,SWH13];
n2_SWH = [SWH16,SWH15];
shred_SWH = [SWH18,SWH17];

% nurdles
figure;
plot(wind_speed,n2_SWH, '-o', wind_speed,n3_SWH, '-o', wind_speed,n4_SWH, '-o')
title('Wind Speed vs. Significant Wave Height for Nurdles');
legend('n2', 'n3', 'n4');
xlabel('Wind Speed (m/s)');
ylabel('Significant Wave Height (m)')

% rods
figure;
plot(wind_speed,r10_SWH, '-o', wind_speed,r20_SWH, '-o')
title('Wind Speed vs. Significant Wave Height for Rods');
legend('r10', 'r20');
xlabel('Wind Speed (m/s)');
ylabel('Significant Wave Height (m)')

% disks
figure;
plot(wind_speed,d5_SWH, '-o', wind_speed,d7_SWH, '-o', wind_speed,d10_SWH, '-o')
title('Wind Speed vs. Significant Wave Height for Disks');
legend('d5', 'd7', 'd10');
xlabel('Wind Speed (m/s)');
ylabel('Significant Wave Height (m)')

% shreds
figure;
plot(wind_speed,shred_SWH, '-o')
title('Wind Speed vs. Significant Wave Height for Shreds');
xlabel('Wind Speed (m/s)');
ylabel('Significant Wave Height (m)')

% calculate peak wave period in seconds
[p1,l1] = findpeaks(E_run1);
index1 = find(E_run1==max(p1));
peak_pd1 = 1/f_run1(index1);

[p2,l2] = findpeaks(E_run2);
index2 = find(E_run2==max(p2));
peak_pd2 = 1/f_run2(index2);

[p3,l3] = findpeaks(E_run3);
index3 = find(E_run3==max(p3));
peak_pd3 = 1/f_run3(index3);

[p4,l4] = findpeaks(E_run4);
index4 = find(E_run4==max(p4));
peak_pd4 = 1/f_run4(index4);

[p5,l5] = findpeaks(E_run5);
index5 = find(E_run5==max(p5));
peak_pd5 = 1/f_run5(index5);

[p6,l6] = findpeaks(E_run6);
index6 = find(E_run6==max(p6));
peak_pd6 = 1/f_run7(index6);

[p7,l7] = findpeaks(E_run7);
index7 = find(E_run7==max(p7));
peak_pd7 = 1/f_run7(index7);

[p8,l8] = findpeaks(E_run8);
index8 = find(E_run8==max(p8));
peak_pd8 = 1/f_run8(index8);

[p9,l9] = findpeaks(E_run9);
index9 = find(E_run9==max(p9));
peak_pd9 = 1/f_run9(index9);

[p10,l10] = findpeaks(E_run10);
index10 = find(E_run10==max(p10));
peak_pd10 = 1/f_run10(index10);

[p11,l11] = findpeaks(E_run11);
index11 = find(E_run11==max(p11));
peak_pd11 = 1/f_run11(index11);

[p12,l12] = findpeaks(E_run12);
index12 = find(E_run12==max(p12));
peak_pd12 = 1/f_run12(index12);

[p13,l13] = findpeaks(E_run13);
index13 = find(E_run13==max(p13));
peak_pd13 = 1/f_run13(index13);

[p14,l14] = findpeaks(E_run14);
index14 = find(E_run14==max(p14));
peak_pd14 = 1/f_run14(index14);

[p15,l15] = findpeaks(E_run15);
index15 = find(E_run15==max(p15));
peak_pd15 = 1/f_run15(index15);

[p16,l16] = findpeaks(E_run16);
index16 = find(E_run16==max(p16));
peak_pd16 = 1/f_run16(index16);

[p17,l17] = findpeaks(E_run17);
index17 = find(E_run17==max(p17));
peak_pd17 = 1/f_run17(index17);

[p18,l18] = findpeaks(E_run18);
index18 = find(E_run18==max(p18));
peak_pd18 = 1/f_run18(index18);

n4_PWP = [peak_pd7,peak_pd1];
r10_PWP = [peak_pd8,peak_pd2];
r20_PWP = [peak_pd9,peak_pd3];
d5_PWP = [peak_pd10,peak_pd4];
d7_PWP = [peak_pd11,peak_pd5];
d10_PWP = [peak_pd12,peak_pd6];
n3_PWP = [peak_pd14,peak_pd13];
n2_PWP = [peak_pd16,peak_pd15];
shred_PWP = [peak_pd18,peak_pd17];

% wind speed vs. peak wave period plots for each particle type

% nurdles
figure;
plot(wind_speed,n2_PWP, '-o', wind_speed,n3_PWP, '-o', wind_speed,n4_PWP, '-o')
title('Wind Speed vs. Peak Wave Period for Nurdles');
legend('n2', 'n3', 'n4');
xlabel('Wind Speed (m/s)');
ylabel('Peak Wave Period (s)')

% rods
figure;
plot(wind_speed,r10_PWP, '-o', wind_speed,r20_PWP, '-o')
title('Wind Speed vs. Peak Wave Period for Rods');
legend('r10', 'r20');
xlabel('Wind Speed (m/s)');
ylabel('Peak Wave Period (s)')

% disks
figure;
plot(wind_speed,d5_PWP, '-o', wind_speed,d7_PWP, '-o', wind_speed,d10_PWP, '-o')
title('Wind Speed vs. Peak Wave Period for Disks');
legend('d5', 'd7', 'd10');
xlabel('Wind Speed (m/s)');
ylabel('Peak Wave Period (s)')

% shreds
figure;
plot(wind_speed,shred_PWP, '-o')
title('Wind Speed vs. Peak Wave Period for Shreds');
xlabel('Wind Speed (m/s)');
ylabel('Peak Wave Period (s)')

% calculate mean wave period in seconds
mean_pd1 = mean(1./f_run1(l1));

mean_pd2 = mean(1./f_run2(l2));

mean_pd3 = mean(1./f_run3(l3));

mean_pd4 = mean(1./f_run4(l4));

mean_pd5 = mean(1./f_run5(l5));

mean_pd6 = mean(1./f_run6(l6));

mean_pd7 = mean(1./f_run7(l7));

mean_pd8 = mean(1./f_run8(l8));

mean_pd9 = mean(1./f_run9(l9));

mean_pd10 = mean(1./f_run10(l10));

mean_pd11 = mean(1./f_run11(l11));

mean_pd12 = mean(1./f_run12(l12));

mean_pd13 = mean(1./f_run13(l13));

mean_pd14 = mean(1./f_run14(l14));

mean_pd15 = mean(1./f_run15(l15));

mean_pd16 = mean(1./f_run16(l16));

mean_pd17 = mean(1./f_run17(l17));

mean_pd18 = mean(1./f_run18(l18));

n4_MWP = [mean_pd7,mean_pd1];
r10_MWP = [mean_pd8,mean_pd2];
r20_MWP = [mean_pd9,mean_pd3];
d5_MWP = [mean_pd10,mean_pd4];
d7_MWP = [mean_pd11,mean_pd5];
d10_MWP = [mean_pd12,mean_pd6];
n3_MWP = [mean_pd14,mean_pd13];
n2_MWP = [mean_pd16,mean_pd15];
shred_MWP = [mean_pd18,mean_pd17];

% wind speed vs. mean wave period plots for each particle type

% nurdles
figure;
plot(wind_speed,n2_MWP, '-o', wind_speed,n3_MWP, '-o', wind_speed,n4_MWP, '-o')
title('Wind Speed vs. Mean Wave Period for Nurdles');
legend('n2', 'n3', 'n4');
xlabel('Wind Speed (m/s)');
ylabel('Mean Wave Period (s)')

% rods
figure;
plot(wind_speed,r10_MWP, '-o', wind_speed,r20_MWP, '-o')
title('Wind Speed vs. Mean Wave Period for Rods');
legend('r10', 'r20');
xlabel('Wind Speed (m/s)');
ylabel('Mean Wave Period (s)')

% disks
figure;
plot(wind_speed,d5_MWP, '-o', wind_speed,d7_MWP, '-o', wind_speed,d10_MWP, '-o')
title('Wind Speed vs. Mean Wave Period for Disks');
legend('d5', 'd7', 'd10');
xlabel('Wind Speed (m/s)');
ylabel('Mean Wave Period (s)')

% shreds
figure;
plot(wind_speed,shred_MWP, '-o')
title('Wind Speed vs. Mean Wave Period for Shreds');
xlabel('Wind Speed (m/s)');
ylabel('Mean Wave Period (s)')
