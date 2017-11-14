function gradient = gradient_magnitude(image)
% GRADIENT_MAGNITUDE            Calculates the magnitude of an image by
%                               applying sobel masks and combining them.
%             
% Syntax:
% gradient = gradient_magnitude(image)
%
% Input:
% image                         A matrix representing the grayscale values
%                               of an image.

% Calculate the partial derivative with respect to x
sobelRowFilter = [-1 -2 -1; 0 0 0; 1 2 1];
gx = spatial_filter(image, sobelRowFilter);

% Calculate the partial derivative with respect to y
sobelColumnFilter = [-1 0 1; -2 0 2; -1 0 1];
gy = spatial_filter(image, sobelColumnFilter);

gradient = sqrt(gx.^2 + gy.^2);

end