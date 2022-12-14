%% Interpolate and extrapolate in time

% go through each of the runs, runs 1-18
for k = 1:18
    name = sprintf('run_%i_smooth.mat',k);
    run_raw = struct2array(load(name));
    run_interp_extrap = run_raw;
    col = length(run_raw);
    
    % go through each of the pixels in every image in a run
    for i = 1:2168
        vector = run_raw(i,:);
        % if there are any nans
        if any(isnan(vector))
                % find the nans, their indices, the non nans, their indices
                not_nan = ~isnan(vector);
                not_nan_values = vector(not_nan);
                ind_not_nan = find(not_nan == 1);
                ind_nan = find(not_nan == 0);
            % if there are nans on the ends, do extrapolation, and add the
            % new data to the final matrix
            if isnan(vector(1)) || isnan(vector(col))
                vals = interp1(ind_not_nan,not_nan_values,ind_nan,"nearest","extrap");
                run_interp_extrap(i,ind_nan) = vals;
            % if there are nans in the middle, do interpolation, and add
            % the new data to the final matrix
            else
                vals = interp1(ind_not_nan,not_nan_values,ind_nan,"pchip");
                run_interp_extrap(i,ind_nan) = vals;
            end
        % if there are no nans, then just add the raw data to the final
        % matrix
        else
            run_interp_extrap(i,:) = run_raw(i,:);
        end
    end

    % save the final matrix with the interpolated and extrapolated data
    save_name = sprintf('run_%i_interp_extrap.mat',k);
    save(save_name, 'run_interp_extrap','-v7.3')
end

%% Some tests to check interpolation/extrapolation
img = cam_imread('D:\luci\run220613\run1\CamB-0123.tif',false);
figure
imshow(flipud(img))
x = 1:2168;
y2 = run_raw(:,11035);
hold on
plot(x, y2, 'g', 'LineWidth', 2)

%
img = cam_imread('D:\luci\run220613\run1\CamB-0123.tif',false);
figure
imshow(flipud(img))
x = 1:2168;
y = run_interp_extrap(:,11035);
hold on
plot(x, y, 'g', 'LineWidth', 2)

%% Get binary matrix for NaNs
% go through each of the runs, runs 1-18
for k = 1:18
    name = sprintf('run_%i_smooth.mat',k);
    run_raw = struct2array(load(name));
    run_binary = ones(2168,length(run_raw));
    col = length(run_raw);
    
    % go through each of the images in a run
    for i = 1:col
        vector = run_raw(:,i);
        % check if there are any nans, and indicate them with 0s in a
        % binary matrix (0 = nans; 1= not nans)
        if any(isnan(vector))
                not_nan = ~isnan(vector);
                run_binary(:,i) = not_nan;
        end
    end

    % save the final, binary matrix
    save_name = sprintf('run_%i_binary_nans.mat',k);
    save(save_name, 'run_binary','-v7.3')
end

