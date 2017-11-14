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

%identity = [0 0 0; 0 1 0; 0 0 0];
%result = spatial_filter(image, identity);

figure
edges = find_edges(image, 20.0);
imshow(edges);

figure
edges = find_edges(image, 40.);
imshow(edges);

figure
edges = find_edges(image, 60.);
imshow(edges);

figure
edges = find_edges(image, 80.);
imshow(edges);