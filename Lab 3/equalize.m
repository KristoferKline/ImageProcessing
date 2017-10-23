function equalized = equalize(image, transformation)
% equalize          Takes a matrix of doubles representing the histogram 
%                   (PMF) of an image and calculates the transformation 
%                   function.
%
% Syntax:    
%   transformation = histogram_transformation(histogram);
%
% Input:
% image             A matrix of UINT8 representing the intensity levels of 
%                   an image.
%
% transformation    A matrix of UINT8 representing the transformation
%                   results for corresponding intensity levels (Hash
%                   Table).
width = size(image,2);
height = size(image,1);

% Print out image mean and standard deviation.
imageVector = double(image(:));
imageMean = mean(imageVector)
imageSTD = std(imageVector)

% Optimization: Initialize using known dimensions.
equalized = zeros(height, width, 'uint8');

% Iterate through image, storing the equalized value into the result.
for w = 1:width
    for h = 1:height
        intensity = image(h, w);
        transformed = transformation(intensity + 1);
        equalized(h, w) = transformed;
    end
end

% Print out equalized mean and standard deviation.
equalizedVector = double(equalized(:));
equalizedMean = mean(equalizedVector)
equalizedSTD = std(equalizedVector)

end