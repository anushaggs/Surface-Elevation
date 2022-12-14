%% Identify number of images in each run

% runs 1-5
paths_tif_1_5 = ["D:\luci\run220613\run1\","D:\luci\run220613\run2\","D:\luci\run220613\run3\","D:\luci\run220613\run4\","D:\luci\run220613\run5\"];
runs_1_5_size = [];

for i = 1:length(paths_tif_1_5)
    path = paths_tif_1_5(i);
    files = dir(strcat(path,'*.tif'));
    runs_1_5_size = [runs_1_5_size, length(files)];
end
save("runs_1_5_size.mat", "runs_1_5_size",'-v7.3')

% run 6
paths_avi_6 = "D:\luci\run220613\run6\";
runs_6_size = [];
total_frames = 0;
files = dir(strcat(paths_avi_6,'*.avi'));
for k = 1:length(files)
    Vptr = VideoReader(strcat(paths_avi_6,files(k).name));
    num_frames = round(Vptr.FrameRate*Vptr.Duration);
    total_frames = total_frames + num_frames;
    runs_6_size = [runs_6_size, total_frames];
end
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

load('runs1_5.mat');
load('runs7_12.mat');
load('runs13_18.mat');

load('runs_1_5_size.mat');
load('runs_7_12_size.mat');
load('runs_13_18_size.mat');

runs_1_5_size = cumsum(runs_1_5_size);

run_1_file = runs_1_5(1:2168,1:runs_1_5_size(1));
run_2_file = runs_1_5(1:2168,runs_1_5_size(1)+1:runs_1_5_size(2));
run_3_file = runs_1_5(1:2168,runs_1_5_size(2)+1:runs_1_5_size(3));
run_4_file = runs_1_5(1:2168,runs_1_5_size(3)+1:runs_1_5_size(4));
run_5_file = runs_1_5(1:2168,runs_1_5_size(4)+1:runs_1_5_size(5));

run_7_file = runs_7_12(1:2168,1:runs_7_12_size(1));
run_8_file = runs_7_12(1:2168,runs_7_12_size(1)+1:runs_7_12_size(2));
run_9_file = runs_7_12(1:2168,runs_7_12_size(2)+1:runs_7_12_size(3));
run_10_file = runs_7_12(1:2168,runs_7_12_size(3)+1:runs_7_12_size(4));
run_11_file = runs_7_12(1:2168,runs_7_12_size(4)+1:runs_7_12_size(5));
run_12_file = runs_7_12(1:2168,runs_7_12_size(5)+1:runs_7_12_size(6));

run_13_file = runs_13_18(1:2168,1:runs_13_18_size(1));
run_14_file = runs_13_18(1:2168,runs_13_18_size(1)+1:runs_13_18_size(2));
run_15_file = runs_13_18(1:2168,runs_13_18_size(2)+1:runs_13_18_size(3));
run_16_file = runs_13_18(1:2168,runs_13_18_size(3)+1:runs_13_18_size(4));
run_17_file = runs_13_18(1:2168,runs_13_18_size(4)+1:runs_13_18_size(5));
run_18_file = runs_13_18(1:2168,runs_13_18_size(5)+1:runs_13_18_size(6));

save("run1.mat", "run_1_file",'-v7.3')
save("run2.mat", "run_2_file",'-v7.3')
save("run3.mat", "run_3_file",'-v7.3')
save("run4.mat", "run_4_file",'-v7.3')
save("run5.mat", "run_5_file",'-v7.3')
save("run7.mat", "run_7_file",'-v7.3')
save("run8.mat", "run_8_file",'-v7.3')
save("run9.mat", "run_9_file",'-v7.3')
save("run10.mat", "run_10_file",'-v7.3')
save("run11.mat", "run_11_file",'-v7.3')
save("run12.mat", "run_12_file",'-v7.3')
save("run13.mat", "run_13_file",'-v7.3')
save("run14.mat", "run_14_file",'-v7.3')
save("run15.mat", "run_15_file",'-v7.3')
save("run16.mat", "run_16_file",'-v7.3')
save("run17.mat", "run_17_file",'-v7.3')
save("run18.mat", "run_18_file",'-v7.3')

%% Getting camera letters for runs 1-18

% run 6
load('run_6_size.mat')

run_6_letters = strings(1,53988);
run_6_letters(1:runs_6_size(4)) = "A";
run_6_letters(runs_6_size(4)+1:runs_6_size(8)) = "B";
run_6_letters(runs_6_size(8)+1:runs_6_size(12)) = "C";
run_6_letters(runs_6_size(12)+1:runs_6_size(16)) = "D";

save("run_6_letters.mat", "run_6_letters",'-v7.3')

% runs 7-18
runs_18_size = [];
path = "D:\luci\run220613\run18\";
files = dir(strcat(path,'*.avi'));
total_frames = 0;
for k = 1:length(files)
    Vptr = VideoReader(strcat(path,files(k).name));
    num_frames = round(Vptr.FrameRate*Vptr.Duration);
    total_frames = total_frames + num_frames;
    runs_18_size = [runs_18_size, total_frames];
end
save("run_18_size.mat", "runs_18_size",'-v7.3')

run_18_letters = strings(1,15140);
run_18_letters(1:runs_18_size(1)) = "A";
run_18_letters(runs_18_size(1)+1:runs_18_size(2)) = "B";
run_18_letters(runs_18_size(2)+1:runs_18_size(3)) = "C";
run_18_letters(runs_18_size(3)+1:runs_18_size(4)) = "D";

save("run_18_letters.mat", "run_18_letters",'-v7.3')
clear; clc;

% runs 1-5
paths = ["D:\luci\run220613\run1\","D:\luci\run220613\run2\","D:\luci\run220613\run3\","D:\luci\run220613\run4\","D:\luci\run220613\run5\"];
runs_1_5_letters = strings(1,245524);

count = 0;
for j = 1:length(paths)
    path = paths(j);
    files = dir(strcat(path,'*.tif'));
    for i = 1:length(files)
        if (contains(files(i).name,"mA")) == true
            count = count + 1;
            runs_1_5_letters(count) = "A";
        elseif (contains(files(i).name,"mB")) == true
            count = count + 1;
            runs_1_5_letters(count) = "B";
        elseif (contains(files(i).name,"mC")) == true
            count = count + 1;
            runs_1_5_letters(count) = "C";
        elseif (contains(files(i).name,"mD")) == true
            count = count + 1;
            runs_1_5_letters(count) = "D";
        end
    end
end
load('runs_1_5_size.mat');
runs_1_5_size = cumsum(runs_1_5_size);

run_1_letters = runs_1_5_letters(1,1:runs_1_5_size(1));
run_2_letters = runs_1_5_letters(1,runs_1_5_size(1)+1:runs_1_5_size(2));
run_3_letters = runs_1_5_letters(1,runs_1_5_size(2)+1:runs_1_5_size(3));
run_4_letters = runs_1_5_letters(1,runs_1_5_size(3)+1:runs_1_5_size(4));
run_5_letters = runs_1_5_letters(1,runs_1_5_size(4)+1:runs_1_5_size(5));

save("run_1_letters.mat", "run_1_letters",'-v7.3')
save("run_2_letters.mat", "run_2_letters",'-v7.3')
save("run_3_letters.mat", "run_3_letters",'-v7.3')
save("run_4_letters.mat", "run_4_letters",'-v7.3')
save("run_5_letters.mat", "run_5_letters",'-v7.3')
%% Gathering image name information for runs 1-5

% run1
files1 = dir(strcat("D:\luci\run220613\run1\",'*.tif'));
run_1_img_names = strings(length(files1));

for i = 1:length(files1)
    run_1_img_names(i) = files1(i).name;
end
save("run_1_img_names.mat", "run_1_img_names",'-v7.3')

% run2
files2 = dir(strcat("D:\luci\run220613\run2\",'*.tif'));
run_2_img_names = strings(length(files2));

for i = 1:length(files2)
    run_2_img_names(i) = files2(i).name;
end
save("run_2_img_names.mat", "run_2_img_names",'-v7.3')

% run3
files3 = dir(strcat("D:\luci\run220613\run3\",'*.tif'));
run_3_img_names = strings(length(files3));

for i = 1:length(files3)
    run_3_img_names(i) = files3(i).name;
end
save("run_3_img_names.mat", "run_3_img_names",'-v7.3')

% run4
files4 = dir(strcat("D:\luci\run220613\run4\",'*.tif'));
run_4_img_names = strings(length(files4));

for i = 1:length(files4)
    run_4_img_names(i) = files4(i).name;
end
save("run_4_img_names.mat", "run_4_img_names",'-v7.3')

% run5
files5 = dir(strcat("D:\luci\run220613\run5\",'*.tif'));
run_5_img_names = strings(length(files5));

for i = 1:length(files5)
    run_5_img_names(i) = files5(i).name;
end
save("run_5_img_names.mat", "run_5_img_names",'-v7.3')

%% Get binary matrix for NaNs for runs 1-18

for k = 1:18
    name = sprintf('run_%i_smooth.mat',k);
    run_raw = struct2array(load(name));
    run_binary = ones(2168,length(run_raw));
    col = length(run_raw);

    for i = 1:col
        vector = run_raw(:,i);
        if any(isnan(vector)) %there are nans
                not_nan = ~isnan(vector);
                run_binary(:,i) = not_nan;
        end
    end
    save_name = sprintf('run_%i_binary_nans.mat',k);
    save(save_name, 'run_binary','-v7.3')
end