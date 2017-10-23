image = imread('Lab_02_image1.tif')

% Part C: Downsample & Upsample
neighborDownsample = myimresize(image, 40, 75, 'neighbor');
bilinearDownsample = myimresize(image, 40, 75, 'bilinear');
neighborUpsample = myimresize(image, 900, 600, 'neighbor');
bilinearUpsample = myimresize(image, 900, 600, 'bilinear');

imwrite(neighborDownsample, 'neighborDownsample.tif');
imwrite(bilinearDownsample, 'bilinearDownsample.tif');
imwrite(neighborUpsample, 'neighborUpsample.tif');
imwrite(bilinearUpsample, 'bilinearUpsample.tif');


% Part D: Resize
resizeSmallNeighbor = myimresize(neighborDownsample, 300, 300, 'neighbor');
resizeSmallBilinear = myimresize(bilinearDownsample, 300, 300, 'bilinear');
resizeBigNeighbor = myimresize(neighborUpsample, 300, 300, 'neighbor');
resizeBigBilinear = myimresize(bilinearUpsample, 300, 300, 'bilinear');


% Part E: Calculate RMSE
rmseSmallNeighbor = myRMSE(resizeSmallNeighbor,image);
rmseSmallBilinear = myRMSE(resizeSmallBilinear,image);
rmseBigNeighbor = myRMSE(resizeBigNeighbor,image);
rmseBigBilinear = myRMSE(resizeBigBilinear,image);

disp(rmseSmallNeighbor);
disp(rmseSmallBilinear);
disp(rmseBigNeighbor);
disp(rmseBigBilinear);