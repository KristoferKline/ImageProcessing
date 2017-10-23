image = imread('Lab_03_image1_dark.tif');

histogram = compute_histogram(image);
plot_histogram(histogram);


%transformation = histogram_transform(histogram);
%bar(transformation);

%result = unique(transformation)
%bar(result)

%equalized = equalize(image,transformation);

%equalizedHistogram = compute_histogram(equalized);
%plot_histogram(equalizedHistogram)