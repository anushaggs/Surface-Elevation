# Surface-Elevation

We wanted to collect surface elevation data of the waves being produced in the wave tank to better understand its behavior and quantify its shape. We used image processing techniques in MATLAB to calculate the surface elevation of the water from 18 runs worth of images. Each run contains around 50,000 images that capture a 2D projection of a 3D water surface. We want to calculate the minimum water elevation in that projection.

1_parfor_tif and 2_parfor_tif read .tif/.avi files and collect the surface elevation data.

2_run_separation breaks down the surface elevation data into manageable bits (runs 1-18).

3_smoothing smooths the data with a moving average filter.

4_interpolating_extrapolating fills in the data gaps (parts of the water surface that weren't detected by the program).

5_dewarping converts the image coordinates to physical coordinates.

6_other_info is a misc. file that gathers more information about the pictures (which camera was used to take the picture, etc...).

7_wave_statistics does preliminary analysis on the surface elevation data.
