clc;
clear all;
close all;

img = imread('lena.bmp');
image = img;

[r,c] = size(image);

for i=1:1:r
    for j=1:1:c
        image(i,j) = 255 - image(i,j);
    end
end

figure('Name','Original Image','NumberTitle','off');
imshow(img,'Border','tight');
pause();
figure('Name','Negated Image','NumberTitle','off');
imshow(image,'Border','tight');