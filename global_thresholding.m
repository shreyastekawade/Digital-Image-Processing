clc;
clear all;
close all;

image = imread('snooker.png');
image = rgb2gray(image);

level = graythresh(image)

binarized = imbinarize(image,level);

figure('Name','Original Image','NumberTitle','off');
imshow(imresize(image,0.5),'Border','tight');
pause();
figure('Name','Global Thresholded Image','NumberTitle','off');
imshow(imresize(binarized,0.5),'Border','tight');
pause();

close all;
