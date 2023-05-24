clc;
clear all;
close all;

%FIRST, CREATE A HIGH CONTRAST IMAGE
X = imread('lena.bmp');
a = min(X(:));
b = max(X(:));
Y = (X-a).*(255/(b-a));
%CREATED HIGH CONTRAST IMAGE WHOSE HISTOGRAM WILL BE ATTEMPTED TO MATCH

im1 = imread('honeycomb.png');%image Whose histogram must change
im2 = Y;%image whose histogram will be used for matching

%HISTOGRAM MATCHING SEQUENCE
M = zeros(256,1,'uint8'); %// Store mapping - Cast to uint8 to respect data type
hist1 = imhist(im1); %// Compute histograms
hist2 = imhist(im2);
cdf1 = cumsum(hist1) / numel(im1); %// Compute CDFs
cdf2 = cumsum(hist2) / numel(im2);

%// Compute the mapping
for idx = 1 : 256
    [~,ind] = min(abs(cdf1(idx) - cdf2));
    M(idx) = ind-1;
end

%MATCH THE LOW CONTRAST IMAGE HISTOGRAM TO THE HIGH CONTRAST IMAGE
%HISTOGRAM
out = M(double(im1)+1);
%DISPLAY THE IMAGES
nbins = 255;
figure('Name','Low Contrast Image','NumberTitle','off');
imshow(im1,'Border','tight');
pause();
lowcontrast = histogram(im1,nbins);
pause();
figure('Name','High Contrast Image','NumberTitle','off');
imshow(im2,'Border','tight');
pause();
highcontrast = histogram(im2,nbins);
pause();
figure('Name','Histogram Matched First Image','NumberTitle','off');
imshow(out,'Border','tight');
pause();
histmatchoutput = histogram(out,nbins);
pause();
close all;