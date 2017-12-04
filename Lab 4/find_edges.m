function result_image = find_edges(image, threshold)
% FIND_EDGES            Detects image edges using the gradient magnitude to
%                       select edges based on the threshold.
%             
% Syntax:
% result_image = find_edges(image,threshold)
%
% Input:
% image                 A matrix representing the grayscale values of an 
%                       image.
%
% threshold             A scalar value that represents a percentage of the
%                       image.

% Calculate the gradient magnitude of the image.
gradient = gradient_magnitude(image);

% Initialize local variables.
[height,width] = size(gradient);
result_image = zeros(height,width,'uint8');
bounds = max(max(gradient));

% Iterate through the image, setting pixels to white if >= to threshold.
for w = 1:width
    for h = 1:height
        if image(h,w) >= threshold * 0.01 * bounds
            result_image(h,w) = 255;
        end
    end
end

end

