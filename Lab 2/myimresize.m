function resizedImage = myimresize(image, newWidth, newHeight, interpolationType)
% myimresize    Takes the matrix data of an uint8 grayscale image and
%               resizes it using either nearest neighbor or bilinear
%               interpolation
%
% Syntax:
%   resizedImage = myimresize(matrix(uint8), int, int, string)
% 
% Input:
% image =               A matrix of uint8 values representing the original
%                       image.
% newWidth =            The desired width of the resized image.
% newHeight =           The desired height of the resized image.
% interpolationType =   String represeting nearest neighbor or bilinear
%                       interpolation.
%
% Output:
% resizedImage =        A matrix representing the resized image with values
%                       of uint8.

% Calculate constants
imageWidth = size(image, 2);
imageHeight = size(image, 1);
widthRatio = imageWidth / newWidth;
heightRatio = imageHeight / newHeight;

% Initialize the resized image
resizedImage = zeros(newHeight, newWidth, 'uint8');
for w = 1:newWidth
    for h = 1:newHeight
        x = (h * heightRatio);
        y = (w * widthRatio);
        
        % Constrain bounds for height
        if x < 1
            x = 1;
        else
            if x > imageHeight
                x = imageHeight;
            end
        end
        
        % Constrain bounds for width
        if y < 1
            y = 1;
        else
            if y > imageWidth
                y = imageWidth;
            end
        end
        
        % Perform interpolation
        switch interpolationType
        case 'neighbor'
            nearestWidth = round(y);
            nearestHeight = round(x);
            resizedImage(h, w) = image(nearestHeight, nearestWidth);
        case 'bilinear'
            resizedImage(h, w) = mybilinear(image, x, y);
        otherwise
            disp('Invalid interpolation type')
        end
    end
end

