function equalized = equalize(image, transformation)

width = size(image,2)
height = size(image,1)

equalized = zeros(height, width, 'uint8');
for w = 1:width
    for h = 1:height
        intensity = image(h, w);
        transformed = transformation(intensity + 1);
        equalized(h, w) = transformed;
    end
end

end