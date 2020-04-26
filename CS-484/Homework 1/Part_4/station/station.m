for_station();
for_copier();

function for_station
frame_1 = imread("0.png");
frame_2 = imread("1.png");
frame_3 = imread("2.png");
frame_4 = imread("3.png");

bg_frame = rgb2gray(frame_1);

imshow(bg_frame);

station_frame_2(bg_frame, rgb2gray(frame_2));
station_frame_3(bg_frame, rgb2gray(frame_3));
station_frame_4(bg_frame, rgb2gray(frame_4));
end

function station_frame_2(bg_frame, gray)
figure; imshow(gray);
temp1 = abs (bg_frame - gray) > 50;

img = remove_conn_comp_smaller_than(temp1, 20);
figure; imshow(img);

img = remove_conn_comp_smaller_than(img, 200);
show_colored_conn_comp(img);
end

function station_frame_3(bg_frame, gray)
figure; imshow(gray);
temp1 = abs (bg_frame - gray) > 50;
temp2 = abs (gray - bg_frame) > 5;

temp1 = remove_conn_comp_smaller_than(temp1, 10);
temp2 = remove_conn_comp_smaller_than(temp2, 10);
img = temp1 | temp2;
figure; imshow(img);

img = imclose(img, ones(5));
figure; imshow(img);

% k keeps hand n feet
img = remove_conn_comp_smaller_than(img, 1500);
show_colored_conn_comp(img);
end

function station_frame_4(bg_frame, gray)
figure; imshow(gray);
temp1 = abs (bg_frame - gray) > 20;
temp2 = abs (gray - bg_frame) > 20;

img = temp1 | temp2;
figure; imshow(img);

img = imclose(img, ones(3));
img = remove_conn_comp_smaller_than(img, 150);
img = imdilate(img, [1,1,1,1,1;
    0,0,0,0,0;
    0,0,0,0,0;
    0,0,0,0,0;
    1,1,1,1,1;]);
figure; imshow(img);

show_colored_conn_comp(img);
end

function show_colored_conn_comp(image)
[L,~] = bwlabel(image);
figure; imshow(label2rgb(L, 'jet', 'white', 'shuffle'));
end

function image = remove_conn_comp_smaller_than(image, limit)
CC = bwconncomp(image);
list = CC.PixelIdxList;

for i = 1 : size(list, 2)
    if (size (list{i}, 1) < limit)
        image(list{i}) = 0;
    end
end
end



function for_copier
frame_1 = imread("0.png");
frame_2 = imread("1.png");
frame_3 = imread("2.png");
frame_4 = imread("3.png");

bg_frame = rgb2gray(frame_1);

imshow(bg_frame);

copier_frame_2(bg_frame, rgb2gray(frame_2));
copier_frame_3(bg_frame, rgb2gray(frame_3));
copier_frame_4(bg_frame, rgb2gray(frame_4));
end

function copier_frame_2(bg_frame, gray)
figure; imshow(gray);
temp1 = abs (bg_frame - gray) > 50;
temp2 = abs (gray - bg_frame) > 10;

temp1 = remove_conn_comp_smaller_than(temp1, 20);
temp2 = remove_conn_comp_smaller_than(temp2, 200);
img = temp1 | temp2;
figure; imshow(img);

k = imerode(img, ones(2));

img = imdilate(img, [0,0,0;1,0,1;0,0,0]);
img = imerode(img, [1,1,1;1,0,1;0,0,0;1,0,1;1,1,1]);
% k keeps hand n feet
img = remove_conn_comp_smaller_than(img + k, 180);
show_colored_conn_comp(img);
end

function copier_frame_3(bg_frame, gray)
figure; imshow(gray);
temp1 = abs (bg_frame - gray) > 40;
temp2 = abs (gray - bg_frame) > 10;

temp1 = remove_conn_comp_smaller_than(temp1, 10);
temp2 = remove_conn_comp_smaller_than(temp2, 10);
img = temp1 | temp2;
figure; imshow(img);

img = imclose(img, [0,1,0; 1,0,1;0,1,0]);
figure; imshow(img);

% k keeps hand n feet
img = remove_conn_comp_smaller_than(img, 50);
show_colored_conn_comp(img);
end

function copier_frame_4(bg_frame, gray)
figure; imshow(gray);
temp1 = abs (bg_frame - gray) > 50;
temp2 = abs (gray - bg_frame) > 40;

temp1 = remove_conn_comp_smaller_than(temp1, 10);
temp2 = remove_conn_comp_smaller_than(temp2, 10);
img = temp1 | temp2;
figure; imshow(img);

img = imclose(img, [1,1,1,1; 1,1,1,1;1,0,0,1;1,1,1,1]);
figure; imshow(img);

img = remove_conn_comp_smaller_than(img, 500);
show_colored_conn_comp(img);
end