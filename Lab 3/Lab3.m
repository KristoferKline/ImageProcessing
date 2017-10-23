% Script for running the Lab 3 instructions
% 
% Instructions:
%   - Compute the histogram of an image
%   - Plot the histogram onto a bar graph
%   - Calculate the transform function
%
%   - Equalize image using transformation
%   - Compute the histogram of the equalized image
%   - Plot the histogram onto a bar graph
%
% Apply to:
%   - Lab_03_imag1_dark.tif
%   - Lab_03_image2_light.tif

% Read input into a matrix.
image = imread('Lab_03_image1_dark.tif');

% Compute histogram and plot it.
histogram = compute_histogram(image);
plot_histogram(histogram);

% Calculate the transformation.
transformation = histogram_transform(histogram);

% Equalize the image.
equalized = equalize(image,transformation);

% Compue the histogram of the equalized image and plot it.
equalizedHistogram = compute_histogram(equalized);
plot_histogram(equalizedHistogram);