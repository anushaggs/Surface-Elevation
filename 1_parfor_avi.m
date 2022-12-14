%% Getting surface elevation data for .avi files

% read in images for any runs in runs 6-18
all_paths = ["D:\luci\run220613\run6\"];
one_run = [];
run_6 = [];

% go through each of the runs
parfor j = 1:length(all_paths)
    path = all_paths(j);
    files = dir(strcat(path,'*.avi'));
    one_run = [];
    
    % go through each of the video files in a run
    for k = 1:length(files)
        % read in a video
        Vptr = VideoReader(strcat(all_paths(j),files(k).name));
        % find the number of frames in a video
        num_frames = round(Vptr.FrameRate*Vptr.Duration);
        free_surface = zeros(2168,num_frames);
        
        % go through each of the frames in a video
        for i = 1:num_frames
            % check which camera the image was taken from
            if (contains(files(k).name,"mA")) == true
                img = cam_aviread(Vptr,i,true);
                letter = 'A';
            elseif (contains(files(k).name,"mB")) == true
                img = cam_aviread(Vptr,i,false);
                letter = 'B';
            elseif (contains(files(k).name,"mC")) == true
                img = cam_aviread(Vptr,i,true);
                letter = 'C';
            elseif (contains(files(k).name,"mD")) == true
                img = cam_aviread(Vptr,i,false);
                letter = 'D';
            end
        
            % if the previous image was taken from the same camera the current
            % image is taken from, mask some of the current image
            if i > 1
                min_val = min(free_surface(:,(i-1)));
                if min_val > 45
                    mask = 45;
                else
                    mask = 20;
                end
            else
                mask = 20;
            end
            % get the surface elevation from the image with the appropriate
            % masking factor
            free_surface(:,i) = get_surf_elev(img,mask);
        end
        % add the surface elevation to the matrix that will later be saved
        one_run = [one_run, free_surface];
    end
    run_6 = [run_6,one_run];
end

% save the matrix with the surface elevations from the specified run(s)
save("run6.mat", "run_6",'-v7.3')

%% Free Surface Detection Function
function z_freesurf_array = get_surf_elev(img,mask)
    % binarize the image
    T = adaptthresh(img, 0.67);
    BW = imbinarize(img,T);
    
    % erode and dilate the image
    se = strel('line',4,4);
    BW = imerode(BW,se);
    BW = imdilate(BW,se);
    
    % fill in anny holes in the images
    BW = imfill(BW,"holes");
    
    % mask the image
    BW(4096-mask:4096,1:2168) = 1;
    
    % invert the binarized image to isolate the correct surface elevation
    % contours
    BW = not(BW);
    
    % find boundaries of the black and white; the contours
    [B,~] = bwboundaries(flipud(BW),'noholes');
    
    % find the largest contour in the collection of contours
    [nrows,~] = cellfun(@size,B);
    [~,I] = max(nrows);
    boundary = B{I};
    
    % sort the (nx,nz) value pairs and keep the smallest nx value
    boundary_sort = sortrows(boundary,[2,1],"descend");
    [~,idx] = unique(boundary_sort(:,2),"rows");
    boundary_fin = boundary_sort(idx,:);

    nx_data = boundary_fin(:,2);
    nz_data = boundary_fin(:,1);
    
    % smooth out the curve
    nz_smooth_data = smooth(nx_data,nz_data,0.01,'rloess');
    
    % remove duplicate data points
    orig_data = [nx_data, nz_smooth_data];
    clean_data = unique(orig_data,'rows');

    % assign data to new vector pixel by pixel
    z_freesurf = zeros(2168,1);

    for i = 1:size(clean_data)
        px = clean_data(i,1);
        z_freesurf(px) = clean_data(i,2);
    end
    
    need_idx = find(z_freesurf == 0);

    % add NaNs to undetected contour measurements
    for i = 1:size(need_idx)
        index = need_idx(i);
        z_freesurf(index) = NaN;
    end
    
    z_freesurf_array = z_freesurf;
end