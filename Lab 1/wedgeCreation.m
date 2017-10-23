%imageName = 'Lab_01_image2.tif'
%image = imread(imageName);
%halftone(image);

wedgeDimension = 256;
wedge = zeros(wedgeDimension, wedgeDimension, 'uint8');

for column = 1:wedgeDimension
    for row = 1:wedgeDimension
        wedge(row, column) = wedgeDimension - column;
    end
end

halftone(wedge);