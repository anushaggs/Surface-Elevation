%% Dewarping runs 1-18

% calibrate each of the cameras
load('calib_data_A.mat')
I_A = I;
W_A = W;
rectify_A = calibrate_camera(I_A,W_A,2);

load('calib_data_B.mat')
I_B = I;
W_B = W;
rectify_B = calibrate_camera(I_B,W_B,2);

load('calib_data_C.mat')
I_C = I;
W_C = W;
rectify_C = calibrate_camera(I_C,W_C,2);

load('calib_data_D.mat')
I_D = I;
W_D = W;
rectify_D = calibrate_camera(I_D,W_D,2);

% use resulting rectify function to convert image coordinates to physical
% coordinates
x = [1:2168]';
for k = 1:18
    % get run data
    name_data = sprintf('run_%i_interp_extrap.mat',k);
    run_data = struct2array(load(name_data));
    
    % get camera letter data for each image in a run
    name_letters = sprintf('run_%i_letters.mat',k);
    run_letters = struct2array(load(name_letters));

    col = length(run_data);
    run_dewarp = zeros(2168,col);
    
    % go through elevation data in each image
    for i = 1:col
        points_px = [x,run_data(:,i)];
        % rectify according to the camera the image was taken from
        if run_letters(i) == "A"
            points_m = rectify_A(points_px);
        elseif run_letters(i) == "B"
            points_m = rectify_B(points_px);
        elseif run_letters(i) == "C"
            points_m = rectify_C(points_px);
        else
            points_m = rectify_D(points_px);
        end
        run_dewarp(:,i) = points_m(:,2);
    end
    % save rectified data
    save_name = sprintf('run_%i_dewarped.mat',k);
    save(save_name, 'run_dewarp','-v7.3')
end