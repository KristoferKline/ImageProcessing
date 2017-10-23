function result = halftone(image)
% halftone      Produces a binary image using halftoning, an image
%               that is created using only black and white. For more
%               information imaging see:
%               https://en.wikipedia.org/wiki/Binary_image
%
% Syntax:
%   result = halftone(image)
%   halftone(image)
% 
% Input:
% image =       A matrix of uint8 values representing the original image.
%
% Output:
% result =      A matrix of uint8 values representing the binary image
%               rendering.
%
% Impementation: 
% This verson of halftoning iterates through the specified image in a grid
% of 3x3, calculates the average grayscale value, and aligns it to
% predefined halftoning sets.
%
% The predefined set is then used to fill in the corresponding 3x3 grid
% into a seperate matrix. Overall the program runs in O(n) where n is the
% number of pixels. (Nested for loops increment by 3 and are bound by a
% finite number)

rowCount = size(image,1);
columnCount = size(image,2);

% Matrix definition of halftoning pattern 0
halftoningMap(:,:,10) = uint8([ 
    255 255 255; 
    255 255 255; 
    255 255 255
    ]);

% Matrix definition of halftoning pattern 1
halftoningMap(:,:,9) =  uint8([ 
    255 0 255; 
    255 255 255; 
    255 255 255
    ]);

% Matrix definition of halftoning pattern 2
halftoningMap(:,:,8) =  uint8([ 
    255 0 255; 
    255 255 255; 
    255 255 0
    ]);

% Matrix definition of halftoning pattern 3
halftoningMap(:,:,7) =  uint8([ 
    0 0 255; 
    255 255 255; 
    255 255 0
    ]);

% Matrix definition of halftoning pattern 4
halftoningMap(:,:,6) =  uint8([ 
    0 0 255; 
    255 255 255; 
    0 255 0
    ]);

% Matrix definition of halftoning pattern 5
halftoningMap(:,:,5) =  uint8([ 
    0 0 0; 
    255 255 255; 
    0 255 0
    ]);

% Matrix definition of halftoning pattern 6
halftoningMap(:,:,4) =  uint8([ 
    0 0 0; 
    255 255 0; 
    0 255 0
    ]);

%Matrix definition of halftoning pattern 7
halftoningMap(:,:,3) =  uint8([ 
    0 0 0; 
    255 255 0; 
    0 0 0
    ]);

% Matrix definition of halftoning pattern 8
halftoningMap(:,:,2) =  uint8([ 
    0 0 0; 
    0 255 0; 
    0 0 0
    ]);

% Initialize the binary image render matrix
newImage = zeros(rowCount, columnCount);

% Iterate through image in sections of 3x3
for i=1:3:rowCount
    for j=1:3:columnCount
        
        % Iterate through grid and combine valid indices
        combined = uint16(0);
        elementCount = 0;
        for r=0:2
           if r+i <= rowCount
              for c=0:2
                  if c+j <= columnCount
                    combined = combined + uint16(image(r+i,c+j));
                    elementCount = elementCount + 1;
                 end
              end
           end
        end
        
        % Make sure selected grid is valid and find the corresponding set
        if elementCount > 0
            average = combined / elementCount;
            relativeSet = round(average * 10 / 255);
            
            % Optimization: The corresponding set would be a value of all
            % 0s, newImage is already initialized to all 0s.
            if relativeSet == 0
                continue
            end
            
            % Match the gray to the set and place pattern into newImage
            halftoneSet = halftoningMap(:,:,relativeSet);
            for r=0:2
               if r+i <= rowCount
                  for c=0:2
                      if c+j <= columnCount
                        newImage(r+i,c+j) = halftoneSet(r+1,c+1);
                     end
                  end
               end
            end
        end
        
    end
end

imshow(newImage);
result = newImage;
return
    