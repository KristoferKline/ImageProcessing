function transformation = histogram_transform(histogram)
% histogram_transformation      Takes a matrix of doubles representing the
%                               histogram (PMF) of an image and calculates
%                               the transformation function.
%
% Syntax:    
%   transformation = histogram_transformation(histogram);
%
% Input:
% histogram                     A matrix of UINT8 representing the
%                               histogram of an image.

% Range of the histogram, l representing the number of levels.
l = size(histogram,1);

% Optimization: Initialize cumulative distribution and set the first value.
cmf = zeros(l,1,'double');
cmf(1) = histogram(1);

% Iterate through the PMF, adding the previously stored result.
for i = 2:l
    cmf(i) = cmf(i-1) + (l - 1) * histogram(i);
end

% Optimization: Initialize result transformation with range of levels.
transformation = zeros(l,1,'uint8');

% Iterate through the CMF, rounding the values to create the
% transformation.
for i = 1:l
    transformation(i) = round(cmf(i));
end

end