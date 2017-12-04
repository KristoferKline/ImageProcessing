function result_image = spatial_filter(image, filter)
% SPATIAL_FILTER        Applies a filter onto an image and returns the
%                       result.
%                       
% Syntax:
% result_image = spatial_filter(image, filter)
%
% Input:
% image                 A matrix representing the grayscale values of an 
%                       image.
%
% filter                A matrix representing the desired filter.


% Initialize local variables
filterWidth = size(filter,2);
filterRange = floor(size(filter,1)/2);
[imageHeight, imageWidth] = size(image);

% Add padding around the image equivalent to the filter range.
padded = padarray(image,[filterRange filterRange], 'both');

% Initialize the result_image to zeros
result_image = zeros(imageHeight, imageWidth, 'double');

% Iterate through the padded image, placing the result into result_image
for w = 1:imageWidth
    for h = 1:imageHeight
        
        filterValue = 0;
        for fw = 1:filterWidth
            for fh = 1:filterWidth 
                width = w + fw - filterRange;
                height = h + fh - filterRange;
                
                value = padded(height,width) * filter(fh, fw);
                filterValue = filterValue + value;
            end
        end
        
        result_image(h, w) = double(filterValue);
    end
end

end

