%initialise the file
clc;
clear all;
close all;
%read the image
X = imread('cameraman.tif');
Y=X;
%find minimum in the entire image
a = double(min(X(:)));  %minimum pixel of image X
%find maximum in the entire image
b = double(max(X(:))); %maximum pixel of image X

hist = imhist(X);
[r,c] = size(hist);
cdf = zeros(r,c);
for i=1:1:r
    cdf(i,1) = ((i-1) * hist(i,1))/numel(X);
end
cdf = cumsum(cdf);
sigma = std(cdf(a:1:b,1));

a = a/sigma;
a = 2*a;
b = b/sigma;
b = 0.5*b;

CI = 1.5;

low = round(cdf(r,1) - (a * sigma))
if low < 0
    low = low * (-1);
end
high = round(cdf(r,1) + (b * sigma))

%contrast stretch using formula
[r,c] = size(X);
for i=1:1:r
    for j=1:1:c
        if(X(i,j)<low)
            X(i,j) = 0;
        elseif(X(i,j)>high)
            X(i,j) = 255;
        else
            X(i,j) = (255/(high-low)) * X(i,j);
        end
    end
end
%display the images
figure('Name','Original Image','NumberTitle','off');
imshow(Y,'Border','tight');
pause();
figure('Name','Original Image Histogram','NumberTitle','off');
Yhist = histogram(Y);
pause();
figure('Name','Contrast Stretched Image','NumberTitle','off');
imshow(X,'Border','tight');
pause();
figure('Name','Stretched Histogram','NumberTitle','off');
Xhist = histogram(X);
pause();
close all;