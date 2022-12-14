%% Smooth out the data

% go through each of the runs, runs-18
for k = 1:18
    name = sprintf('run%i.mat',k);
    run_raw = struct2array(load(name));
    run_smooth = NaN(size(run_raw));
    
    % for each of the images in a run
    for i = 1:length(run_raw)
        vector = run_raw(:,i);
        not_nan = ~isnan(vector);
        not_nan_values = vector(not_nan);
        smooth_not_nan_values = smooth(not_nan_values);
        ind = find(not_nan == 1);
        % smooth out the data
        run_smooth(ind,i) = smooth_not_nan_values;
    end
    % save the smoothed out data
    save_name = sprintf('run_%i_smooth.mat',k);
    save(save_name, 'run_smooth','-v7.3')
end