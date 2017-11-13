function gradient = gradient_magnitude(image)
%GRADIENT_MAGNITUDE Summary of this function goes here
%   Detailed explanation goes here

sobelRowFilter = [-1 -2 -1, 0 0 0, 1 2 1];
sobelColumnFilter = [-1 0 1, -2 0 2, -1 0 1];

rowFiltered = spatial_filter(image, sobelRowFilter);
columnFiltered = spatial_filter(image, sobelColumnFilter);
end

