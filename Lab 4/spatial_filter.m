function result_image = spatial_filter(image, filter)
%SPATIAL_FILTER Summary of this function goes here
%   Detailed explanation goes here

filterWidth = size(filter,2);
filterRange = floor(size(filter,1)/2);

[imageHeight, imageWidth] = size(image);
%imageWidth = size(image,2);
%imageHeight = size(image,1);

padded = padarray(image,[filterRange filterRange], 'both');
result_image = zeros(imageHeight, imageWidth, 'uint8');
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

