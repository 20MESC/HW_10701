function image = displayImage(I,gray)
% This function takes a vector from the handwriting dataset and displays it
% as an image.  You can change whether the image is grayscale or not using
% the second input paramter.  Default is gray.

if nargin < 2
    gray = true;
end

if numel(I) ~= 361
    error('Error: vector not from a 19x19 pixel image.  Wrong number of dimensions.')
end

image = reshape(I,19,19);
imagesc(image);
if gray
    colormap('gray')
else
    colormap('default')
end
