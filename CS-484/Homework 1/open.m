% Ali Altaf Salemwala
% 
% morphological opening

function binary_image = open(source_image, struct_el)
binary_image = erosion(source_image, struct_el);
binary_image = dilation(binary_image, struct_el);
end