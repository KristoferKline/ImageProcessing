function RMSE = myRMSE(image, image2)
% mybilinear    Takes two images and calculates the root mean squared.
%
% Syntax:
%   RMSE = myRMSE(matrix(uint8), matrix(uint8))
% 
% Input:
% image =   A matrix of uint8 values representing the first image.
% image2 =  A matrix of uint8 values representing the second image.
%
% Output:
% RMSE =   The root mean squared

imageWidth = size(image, 2);
imageHeight = size(image, 1);

summation = double(0);
for w = 1:imageWidth
    for h = 1:imageHeight
        intensity = image(h, w);
        intensity2 = image2(h, w);
        difference = intensity - intensity2;
        
        summation = summation + power(difference,2);
    end
end

squared = double(summation / (imageWidth * imageHeight))
RMSE = sqrt(squared);

end

