% Ali Altaf Salemwala
%
% morphological erosion

function binary_image = erosion(source_image, struct_el)
[rows, cols, i_numrows, i_numcols, se_numrows, se_numcols, binary_image] = setup(source_image, struct_el);
% for each 1-pixel in the source image
for i = 1:size(rows)
    % position of the 1-pixel
    r = rows(i);
    c = cols(i);
    
    % reset structuring element in case it was cropped
    se = struct_el;
    
    % if original structuring element not completely contained in image
    % crop it to fit
    if (~se_in_img(i_numrows, i_numcols, r, c, se_numrows, se_numcols))
        [r, c, se] = adjust_se_to_img(i_numrows, i_numcols, r, c, se);
    end
    
    [se_r, se_c] = size(se);
    % check only binary 1- and 0-pixels overlap between the structuring
    % element and the source image
    if all(~xor(source_image(r : r + se_r - 1, c: c + se_c - 1), se), 'all')
        % set the value at the current position of the origin to 1
        binary_image(rows(i) + floor(se_numrows/2), cols(i) + floor(se_numcols/2)) = 1;
    end
end
end

% crop sides of structuring element outside of image
function [r, c, se] = adjust_se_to_img(i_numrows, i_numcols, r, c, se)
% adjust left side of structuring element
while r < 1
    r = r + 1;
    se = se(2 : end, :);
end

% adjust right side of structuring element
while r + size(se, 1) - 1 > i_numrows
    se = se(1 : end - 1, :);
end

% adjust top of structuring element
while c < 1
    c = c + 1;
    se = se(:, 2 : end);
end

% adjust bottom of structuring element
while c + size(se, 2) - 1 > i_numcols
    se = se(:, 1 : end - 1);
end
end

% check if the original structuring element is contained within the image
% 1-pixel positions are adjusted to match top-left of structuring element
function result = se_in_img(i_numrows, i_numccols, r, c, se_numrows, se_numcols)
% check 1-pixel position within top and left sides
result = (r >= 1 && c >= 1);

% check 1-pixel position within bottom and right sides
result = result && (r + se_numrows - 1 <= i_numrows) && (c + se_numcols - 1 <= i_numccols);
end

% preliminary setup to get size details and 1-pixel positions
function [rows, cols, bi_numrows, bi_numcols, se_numrows, se_numcols, binary_image] = setup(source_image, struct_el)
% stores the position of every 1-pixel in the source image
[rows, cols] = find(source_image == 1);

% get size of source image and make destination image
[bi_numrows, bi_numcols] = size(source_image);
binary_image = zeros(bi_numrows, bi_numcols);

% get size of structuring element
[se_numrows, se_numcols] = size(struct_el);

% adjust stored positions of binary-1s to the origin of structuring element
% assuming the origin of structuring element is the center
rows = rows - floor(se_numrows / 2);
cols = cols - floor(se_numcols / 2);
end