%% Getting surface elevation data for .tif images

% read in images for runs 1-5
paths = ["D:\luci\run220613\run1\","D:\luci\run220613\run2\","D:\luci\run220613\run3\","D:\luci\run220613\run4\","D:\luci\run220613\run5\"];
runs_1_5 = [];

% go through each of the runs
parfor j = 1:length(paths)
    paths = ["D:\luci\run220613\run1\","D:\luci\run220613\run2\","D:\luci\run220613\run3\","D:\luci\run220613\run4\","D:\luci\run220613\run5\"];
    path = paths(j);
    files = dir(strcat(path,'*.tif'));
    free_surface = zeros(2168,length(files));
    
    % go through each of the image files in a run
    for i = 1:length(files)
        % check which camera the image was taken from
        if (contains(files(i).name,"mA")) == true
            tf = true;
            letter = 'A';
        elseif (contains(files(i).name,"mB")) == true
            tf = false;
            letter = 'B';
        elseif (contains(files(i).name,"mC")) == true
            tf = true;
            letter = 'C';
        elseif (contains(files(i).name,"mD")) == true
            tf = false;
            letter = 'D';
        end
        % read in the image
        img = cam_imread(strcat(path,files(i).name),tf);
        
        % if the previous image was taken from the same camera the current
        % image is taken from, mask some of the current image 
        if (i > 1) && contains(files(i-1).name,letter) == true
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
    runs_1_5 = [runs_1_5, free_surface];
end

% save the matrix with the surface elevations from runs 1-5
save("runs1_5.mat", "runs_1_5",'-v7.3')

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