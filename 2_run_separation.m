%% Identify number of images in each run

% .tif files
paths_tif_1_5 = ["D:\luci\run220613\run1\","D:\luci\run220613\run2\","D:\luci\run220613\run3\","D:\luci\run220613\run4\","D:\luci\run220613\run5\"];
runs_1_5_size = [];

% find the number of images in each run for runs 1-5
for i = 1:length(paths_tif_1_5)
    path = paths_tif_1_5(i);
    files = dir(strcat(path,'*.tif'));
    runs_1_5_size = [runs_1_5_size, length(files)];
end
save("runs_1_5_size.mat", "runs_1_5_size",'-v7.3')

% .avi files
% run 6
paths_avi_6 = "D:\luci\run220613\run6\";
runs_6_size = 0;
total_frames = 0;
files = dir(strcat(paths_avi_6,'*.avi'));
for k = 1:length(files)
    Vptr = VideoReader(strcat(paths_avi_6,files(k).name));
    num_frames = round(Vptr.FrameRate*Vptr.Duration);
end
total_frames = total_frames + num_frames;
runs_6_size = total_frames;
save("run_6_size.mat", "runs_6_size",'-v7.3')

% runs 7-12
paths_avi_7_12 = ["D:\luci\run220613\run7\","D:\luci\run220613\run8\","D:\luci\run220613\run9\","D:\luci\run220613\run10\","D:\luci\run220613\run11\","D:\luci\run220613\run12\"];
runs_7_12_size = [];
total_frames = 0;
for j = 1:length(paths_avi_7_12)
    path = paths_avi_7_12(j);
    files = dir(strcat(path,'*.avi'));
    for k = 1:length(files)
        Vptr = VideoReader(strcat(paths_avi_7_12(j),files(k).name));
        num_frames = round(Vptr.FrameRate*Vptr.Duration);
        total_frames = total_frames + num_frames;
    end
    runs_7_12_size =[runs_7_12_size, total_frames];
end
save("runs_7_12_size.mat", "runs_7_12_size",'-v7.3')

% runs 13-18
paths_avi_13_18 = ["D:\luci\run220613\run13\","D:\luci\run220613\run14\","D:\luci\run220613\run15\","D:\luci\run220613\run16\","D:\luci\run220613\run17\","D:\luci\run220613\run18\"];
runs_13_18_size = [];
total_frames = 0;
for j = 1:length(paths_avi_13_18)
    path = paths_avi_13_18(j);
    files = dir(strcat(path,'*.avi'));
    for k = 1:length(files)
        Vptr = VideoReader(strcat(paths_avi_13_18(j),files(k).name));
        num_frames = round(Vptr.FrameRate*Vptr.Duration);
        total_frames = total_frames + num_frames;
    end
    runs_13_18_size =[runs_13_18_size, total_frames];
end
save("runs_13_18_size.mat", "runs_13_18_size",'-v7.3')

%% Separate large files into individual runs
clear; clc;

runs_1_5_file = load('runs1_5.mat');
run_6_file = load('run6.mat');
runs_7_12_file = load('runs7_12.mat');
runs_13_18_file = load('runs13_18.mat');

runs_1_5_size = load('runs_1_5_size.mat');
runs_7_12_size = load('runs_7_12_size.mat');
runs_13_18_size = load('runs_13_18_size.mat');

run_1_file = runs_1_5_file(1:2168,1:runs_1_5_size(1));
run_2_file = runs_1_5_file(1:2168,runs_1_5_size(1)+1:runs1_5_size(2));
run_3_file = runs_1_5_file(1:2168,runs_1_5_size(2)+1:runs1_5_size(3));
run_4_file = runs_1_5_file(1:2168,runs_1_5_size(3)+1:runs1_5_size(4));
run_5_file = runs_1_5_file(1:2168,runs_1_5_size(4)+1:runs1_5_size(5));

run_7_file = runs_7_12_file(1:2168,1:runs_7_12_size(1));
run_8_file = runs_7_12_file(1:2168,runs_7_12_size(1)+1:runs_7_12_size(2));
run_9_file = runs_7_12_file(1:2168,runs_7_12_size(2)+1:runs_7_12_size(3));
run_10_file = runs_7_12_file(1:2168,runs_7_12_size(3)+1:runs_7_12_size(4));
run_11_file = runs_7_12_file(1:2168,runs_7_12_size(4)+1:runs_7_12_size(5));
run_12_file = runs_7_12_file(1:2168,runs_7_12_size(5)+1:runs_7_12_size(6));

run_13_file = runs_13_18_file(1:2168,1:runs_13_18_size(1));
run_14_file = runs_13_18_file(1:2168,runs_13_18_size(1)+1:runs_13_18_size(2));
run_15_file = runs_13_18_file(1:2168,runs_13_18_size(2)+1:runs_13_18_size(3));
run_16_file = runs_13_18_file(1:2168,runs_13_18_size(3)+1:runs_13_18_size(4));
run_17_file = runs_13_18_file(1:2168,runs_13_18_size(4)+1:runs_13_18_size(5));
run_18_file = runs_13_18_file(1:2168,runs_13_18_size(5)+1:runs_13_18_size(6));


