% Script for running the Lab 4 instructions
% 
% Instructions:
%   - Implement Spatial Filtering
%   - Find the magnitude of the gradient using Sobels masks
%   - Detect edges using the magnitude to apply a threshold
%   - Compare to MatLab's edge detection.
%
% Apply to:
%   - watertower.tif

image = imread('watertower.tif');

identity = [0 0 0; 0 1 0; 0 0 0];
result = spatial_filter(image, identity);

imshow(result);