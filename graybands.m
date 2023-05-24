clc;
clear all;
close all;

img = imread('lena.bmp');

image = img;

[r,c] = size(image);
for i=1:1:r
    for j=1:1:c
        if(img(i,j)>128)
            img(i,j) = 255 - img(i,j);
        end
    end
end


figure('Name','Original Image','NumberTitle','off');
imshow(image,'Border','tight');
pause();
h1 = histogram(image);
pause();
figure('Name','Constant Output Image','NumberTitle','off');
imshow(img,'Border','tight');
pause();
h2 = histogram(img);
pause();
close all;