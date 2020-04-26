% Ali Altaf Salemwala
% 21500413
%
% source code for the answer of question 2

img = imread("Part_2/sonnet.png");

T = adaptthresh(img,'ForegroundPolarity', 'dark');
img = imbinarize(img, T);

show_n_save(img, "Part_2/Adaptive Threshold Result.png"); 

icomp = imcomplement(img);
s = [1;1];
icomp = dilation(icomp, s);
s = [1,1];
icomp = dilation(icomp, s);
show_n_save(icomp, "Part_2/Thickened Result.png");

img = imcomplement(icomp) | img;
show_n_save(img, "Part_2/Final Result.png");
