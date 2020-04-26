% Ali Altaf Salemwala
% 21500413
%
% Source code and script to the answer of question 3

img = imread ('Part_3/airplane_graveyard.jpg');

% isolate the blue band
b = img(:, :, 3);
show_n_save(b, "Part_3/1. Blue Band.png");

% set the threshold at high blue values to get the planes
img = (b > 200); 
img = open(img, ones(2));
show_n_save(img, "Part_3/2. Thresholded Blue Band.png");

% get connected components in image
CC = bwconncomp(img);
list= CC.PixelIdxList;

% dilate with a 5x1 1-vector to close holes and gaps within planes
img = dilation (img, ones(5, 1));
show_n_save(img, "Part_3/3. After Dilation_Gaps Closed.png");

% filter out very large or very small connected components
% do this without removing the large or small planes
for i = 1 : size(list, 2)
    if (size (list{i}, 1) < 25)
        img(list{i}) = 0;
    elseif (size (list{i}, 1) > 1500)
        img(list{i}) = 0;
    end
end
show_n_save(img, "Part_3/4. After Removing Large-Small Components.png");

% erode with the same 5x1 1-vector to separate attached planes
img = erosion (img, ones(5, 1));
show_n_save(img, "Part_3/5. After Erosion_Joined Componenets Separated.png");

% separate into connected components and assign random colors to each
[L,n] = bwlabel(img);
show_n_save(label2rgb(L, 'jet', 'white', 'shuffle'), "Part_3/6. Colored Connected Components.png");