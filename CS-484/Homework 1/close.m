% Ali Altaf Salemwala
% 
% morphological closing

function binary_image = close(source_image, struct_el)
binary_image = dilation(source_image, struct_el);
binary_image = erosion(binary_image, struct_el);
end