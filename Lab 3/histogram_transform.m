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

l = size(histogram,1);

cmf = zeros(l,1,'double');
cmf(1) = histogram(1);
for i = 2:l
    cmf(i) = cmf(i-1) + (l - 1) * histogram(i);
end

transformation = zeros(l,1,'uint8');
for i = 1:l
    transformation(i) = round(cmf(i));
end