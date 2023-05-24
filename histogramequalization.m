clc;
clear all;
close all;

image = imread('honeycomb.png');
img = image;
npx = zeros(1,256);

npxbytotal = npx;

[r,c] = size(image);
for i=1:1:r
    for j=1:1:c
        npx(1,image(i,j)+1) = npx(1,image(r,c)+1) + 1;
    end
end
total = sum(npx);
npxbytotal = npx./total;

cdf = zeros(1,256);
for z=2:1:size(npx,2)
    cdf(1,z) = cdf(1,z-1) + npxbytotal(1,z);
end
reassign = round(cdf.*(254));

for i=1:1:r
    for j=1:1:c
        img(i,j) = reassign(1,img(i,j)+1);
    end
end
figure('Name','Original Image','NumberTitle','off');
imshow(image,'Border','tight');
pause();
originalhist = histogram(image);
pause();
figure('Name','Histogram Equalized Image','NumberTitle','off');
imshow(img,'Border','tight');
pause();
equalizedhist = histogram(img);
pause();
close all;