image_rgb = imread('fruits.png');
image = im2double (rgb2gray (image_rgb));

figure; imshow (image, []);
title ("Original Image");

FT_image = FourierTransform (image);

Pre_HW (FT_image);
Part_1 (FT_image);
Part_2 (FT_image);
Part_3 (FT_image);


function Pre_HW (FT_image)
FT_image_mag = log (abs (FT_image) + 1);
figure; imshow (mat2gray (FT_image_mag), []);
title ("Magnitude of FT_image");

FT_image_phase = angle (FT_image);
figure; imshow (mat2gray (FT_image_phase), []);
title ("Phase of FT_image");
end

function Part_1 (FT_image)
total_freq_diff = pi - (2 * pi) / size (image, 1) + pi; % pi * 1022 / 512
freq_diff_per_pixel = total_freq_diff / size (image, 1); % pi * 1022 / (512 * 512)
lower_end = 193; % (pi - pi / 4) / freq_diff_per_pixel;
upper_end = 320;

% make low-pass filter
LP = zeros (size (FT_image));
LP (lower_end : upper_end, lower_end : upper_end) = 1;
Filtered_Image = InverseFourierTransform (LP .* FT_image);
figure; imshow (real (Filtered_Image), []);
title ("Low-pass result");

% make high-pass filter from low-pass
HP = ~LP;
Filtered_Image = InverseFourierTransform (HP .* FT_image);
figure; imshow (real (Filtered_Image), []);
title ("High-pass result");
end

function Part_2 (FT_image)
%   for hx:  n = -1  0  1
%        m = -1 [ 0  0  0 ]
%             0 [ 1  0 -1 ]
%             1 [ 0  0  0 ]
hx = [0 0 0; 1 0 -1; 0 0 0];

%   for hy:  n = -1  0  1
%        m = -1 [ 0  1  0 ]
%             0 [ 0  0  0 ]
%             1 [ 0 -1  0 ]

hy = [0 1 0; 0 0 0; 0 -1 0];

Filtered_Image = InverseFourierTransform (convolve (FT_image, hx));
figure; imshow (real (Filtered_Image), []);
title ("A convolved with hx");

Filtered_Image = InverseFourierTransform (convolve (FT_image, hy));
figure; imshow (real (Filtered_Image), []);
title ("A convolved with hy");

hxy = convolve (hx, hy); % just to verify

%  for hxy:  n = -1  0  1
%        m = -1 [-1  0  1 ]
%             0 [ 0  0  0 ]
%             1 [ 1  0 -1 ]
hxy = [-1 0 1; 0 0 0; 1 0 -1];

Filtered_Image = InverseFourierTransform (convolve (FT_image, hxy));
figure; imshow (real (Filtered_Image), []);
title ("A convolved with hxy");

Filtered_Image = InverseFourierTransform (convolve (convolve (FT_image, hx), hy));
figure; imshow (real (Filtered_Image), []);
title ("A convolved with hx then hy");
end

function Part_3 (FT_image)
%   for hx:  n = -1  0  1
%        m = -1 [-1  0  1 ]
%             0 [-2  0  2 ]
%             1 [-1  0  1 ]
hx = [-1 0 1; -2 0 2; -1 0 1];

%   for hy:  n = -1  0  1
%        m = -1 [-1 -2 -1 ]
%             0 [ 0  0  0 ]
%             1 [ 1  2  1 ]

hy = [-1 -2 -1; 0 0 0; 1 2 1];

% since convolution is ocmmutative
Gx = convolve (FT_image, hx);
figure; imshow (real (InverseFourierTransform (Gx)), []);
title ("A convolved with hx (Sobel)");

Gy = convolve (FT_image, hy);
figure; imshow (real (InverseFourierTransform (Gy)), []);
title ("A convolved with hy (Sobel)");

G = sqrt ((Gx .^ 2) + (Gy .^ 2));
figure; imshow (real (InverseFourierTransform (G)), []);
title ("G (Sobel)");
end

function convolution = convolve (A, B)
convolution = zeros (size (A));
A = padarray (A, [1 1], 0);

for i = 1 : size (convolution, 2)
    for j = 1 : size (convolution, 1)        
        convolution (i, j) = sum (sum (B .* (A (i: i + size (B, 2) - 1, j: j + size (B, 1) - 1))));
    end
end
end