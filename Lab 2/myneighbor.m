function resizedImage = myneighbor(image, newWidth, newHeight)
%MYIMNEIGHBOR Summary of this function goes here
%   Detailed explanation goes here

imageWidth = size(image, 2);
imageHeight = size(image, 1);
widthRatio = imageWidth / newWidth;
heightRatio = imageHeight / newHeight;

resizedImage = zeros(newHeight, newWidth, 'uint8')
for w = 1:newWidth
    for h = 1:newHeight
        nearestWidth = round(w * widthRatio, 0);
        nearestHeight = round(h * heightRatio, 0);
        resizedImage(h, w) = image(nearestHeight, nearestWidth);
    end
end


end

