clc;
clear all;
close all;

image = imread('lena.bmp');

imshow(image,'Border','tight');
pause();
for i=1:1:4
    histogramequal = histogram(image);
    histequalized = histeq(image);
    image = histequalized;
    pause();
    imshow(image,'Border','tight');
    pause();
end