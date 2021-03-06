function intensity = mybilinear(image, x, y)
% mybilinear    Takes the matrix data of an uint8 grayscale image and the
%               desired indices represting width and height location.
%
% Syntax:
%   intensity = mybilinear(matrix(uint8), int, int)
% 
% Input:
% image =   A matrix of uint8 values representing the original image.
% x =       The index of the approximate height location.
% y =       The index of the approximate width location.
%
% Output:
% intensity =   The calcualted intensity from the 

% Initialize Pixel 1: Top Left
p1 = pixel;
p1.x = floor(x);
p1.y = floor(y);
p1.intensity = image(p1.x, p1.y);

% Initialize Pixel 2: Top Right
p2 = pixel;
p2.x = floor(x);
p2.y = ceil(y);
p2.intensity = image(p2.x, p2.y);

% Initialize Pixel 3: Bottom Left
p3 = pixel;
p3.x = ceil(x);
p3.y = floor(y);
p3.intensity = image(p3.x, p2.y);

% Initialize Pixel 4: Bottom Right
p4 = pixel;
p4.x = ceil(x);
p4.y = ceil(y);
p4.intensity = image(p4.x, p4.y);

% Linear Interpolation
left = ((p3.intensity-p1.intensity) * (x-p1.x) / (p3.x-p1.x)) + p1.intensity;
right = ((p4.intensity-p2.intensity) * (x-p2.x) / (p4.x-p2.x)) + p2.intensity;
intensity = ((right-left) * (y-p1.y) / (p2.y-p1.y)) + left;

end

