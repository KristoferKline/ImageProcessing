function plot_histogram(histogram)
% plot_histogram        Takes an array of UINT8 and displays it onto a bar
%                       graph with respect to intensity (x) and frequency
%                       (y).
%
% Syntax:    
%   plot_histogram(histogram);
%
% Input:
% histogram             A matrix of UINT8 representing intensity levels of
%                       grayscale image.
bar(histogram);
xlabel('Intensity');
xlim([0 255]);
ylabel('PMF');

end

