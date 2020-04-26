% Ali Altaf Salemwala
% 21500413
%
% Source code and script to the answer of question 4

dir = 'Part_4/';
for_station(strcat(dir, 'station/'));
for_copier(strcat(dir, 'copyMachine/'));

function for_station(dir)
frames = get_frames(dir);

show_n_save(frames{1}, strcat(dir, "Station Background Frame.png"));

station_frame_2(frames{1}, frames{2}, dir);
station_frame_3(frames{1}, frames{3}, dir);
station_frame_4(frames{1}, frames{4}, dir);
end

function station_frame_2(bg_frame, frame, dir)
dir = setup_dir(dir, 'frame_1/');

% setup the binary image using background subtraction and thresholding
[dark, ~] = setup_binary(bg_frame, frame, 50, 0, dir);

% morphologically operate
image = remove_small_connected_components(dark, 500);
show_n_save(image, strcat(dir, '3. Morphological Operations Result.png'));

% make connected componenets labels
connected_components_label(image, dir);
end

function station_frame_3(bg_frame, frame, dir)
dir = setup_dir(dir, 'frame_2/');

% setup the binary image using background subtraction and thresholding
[dark, light] = setup_binary(bg_frame, frame, 50, 5, dir);

% morphologically operate
dark = remove_small_connected_components(dark, 10);
light = remove_small_connected_components(light, 10);
image = dark | light;
image = close(image, ones(3));
image = remove_small_connected_components(image, 1500);
show_n_save(image, strcat(dir, '3. Morphological Operations Result.png'));

% make connected componenets labels
connected_components_label(image, dir);
end

function station_frame_4(bg_frame, frame, dir)
dir = setup_dir(dir, 'frame_3/');

% setup the binary image using background subtraction and thresholding
[dark, light] = setup_binary(bg_frame, frame, 20, 20, dir);

% morphologically operate
image = dark | light;
image = close(image, ones(3));
image = remove_small_connected_components(image, 150);
se = [1,1,1,1,1;
    0,0,0,0,0;
    0,0,0,0,0;
    0,0,0,0,0;
    1,1,1,1,1];
image = dilation(image, se);
image = open(image, ones(5));
show_n_save(image, strcat(dir, '3. Morphological Operations Result.png'));

% make connected componenets labels
connected_components_label(image, dir);
end


function for_copier(dir)
frames = get_frames(dir);

show_n_save(frames{1}, strcat(dir, "Copy Machine Background Frame.png"));

copy_machine_frame_2(frames{1}, frames{2}, dir);
copy_machine_frame_3(frames{1}, frames{3}, dir);
copy_machine_frame_4(frames{1}, frames{4}, dir);
end

function copy_machine_frame_2(bg_frame, frame, dir)
dir = setup_dir(dir, 'frame_1/');

% setup the binary image using background subtraction and thresholding
[dark, light] = setup_binary(bg_frame, frame, 50, 10, dir);

% morphologically operate
dark = remove_small_connected_components(dark, 20);
light = remove_small_connected_components(light, 200);
image = dark | light;
holder = erosion(image, ones(2));
se = [1; 1; 1;];
image = close(image, se);
image = remove_small_connected_components(image + holder, 180);
show_n_save(image, strcat(dir, '3. Morphological Operations Result.png'));

% make connected componenets labels
connected_components_label(image, dir);
end

function copy_machine_frame_3(bg_frame, frame, dir)
dir = setup_dir(dir, 'frame_2/');

% setup the binary image using background subtraction and thresholding
[dark, light] = setup_binary(bg_frame, frame, 40, 10, dir);

% morphologically operate
dark = remove_small_connected_components(dark, 10);
light = remove_small_connected_components(light, 10);
image = dark | light;
image = remove_small_connected_components(image, 60);
image = dilation(image, ones(11));
show_n_save(image, strcat(dir, '3. Morphological Operations Result.png'));

% make connected componenets labels
connected_components_label(image, dir);
end

function copy_machine_frame_4(bg_frame, frame, dir)
dir = setup_dir(dir, 'frame_3/');

% setup the binary image using background subtraction and thresholding
[dark, light] = setup_binary(bg_frame, frame, 50, 40, dir);

% morphologically operate
dark = remove_small_connected_components(dark, 10);
light = remove_small_connected_components(light, 10);
image = dark | light;
image = close(image, ones(4));
image = remove_small_connected_components(image, 500);
show_n_save(image, strcat(dir, '3. Morphological Operations Result.png'));

% make connected componenets labels
connected_components_label(image, dir);
end


function frames = get_frames(dir)
frame_1 = rgb2gray(imread(strcat(dir, "0.png")));
frame_2 = rgb2gray(imread(strcat(dir, "1.png")));
frame_3 = rgb2gray(imread(strcat(dir, "2.png")));
frame_4 = rgb2gray(imread(strcat(dir, "3.png")));

frames = [{frame_1}; {frame_2}; {frame_3}; {frame_4}];
end

function dir = setup_dir(path, name)
dir = strcat(path, name);
mkdir(dir);
end

function [dark, light] = background_subtract(bg_frame, frame, dir)
dark = abs (bg_frame - frame);
light = abs (frame - bg_frame);
show_n_save(dark + light, strcat(dir, '1. Background Subtraction Result.png'));
end

function [dark, light] = threshold(dark, d_thresh, light, l_thresh, dir)
dark = dark > d_thresh;
light = light > l_thresh;
show_n_save(dark + light, strcat(dir, '2. Thresholding Result.png'));
end

function [dark, light] = setup_binary(bg_frame, frame, d_thresh, l_thresh, dir)
% background subtract
[dark, light] = background_subtract(bg_frame, frame, dir);

% threshold
[dark, light] = threshold(dark, d_thresh, light, l_thresh, dir);
end

function connected_components_label(image, dir)
[L,~] = bwlabel(image);
show_n_save(label2rgb(L, 'jet', 'white', 'shuffle'), strcat(dir, '4. Connected Components Result.png'));
end

function image = remove_small_connected_components(image, limit)
CC = bwconncomp(image);
list = CC.PixelIdxList;

for i = 1 : size(list, 2)
    if (size (list{i}, 1) < limit)
        image(list{i}) = 0;
    end
end
end