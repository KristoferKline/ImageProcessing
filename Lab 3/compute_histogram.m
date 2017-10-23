function histogram = compute_histogram(image)
% compute_histogram     Takes a grayscale image and returns an array of
%                       intensity frequency within the range of UINT8. Also
%                       known as the Probability Mass Function.
%
% Syntax:    
%   histogram = compute_histogram([UINT8]);
%
% Input:
% image                 An array of UINT8 representing intensity levels of
%                       a grayscale image.

width = size(image,2);
height = size(image,1);

histogram = zeros(256,1,'double');
for w = 1:width
    for h = 1:height
        intensity = image(w * h) + 1;
        histogram(intensity) = histogram(intensity) + 1;
    end
end

for i = 1:256
    histogram(i) = histogram(i) / (width * height);
end

end

