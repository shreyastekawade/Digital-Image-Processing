clc;
clear all;
close all;

image = imread('synthetic2.tiff');

image = rgb2gray(image);
prompt = 'Input Size of Structuring Element: ';
x = input(prompt);
SE = strel('disk',x);

opened = imopen(image,SE);

figure('Name','Original Grayscale','NumberTitle','off');
imshow(image,'Border','tight');
pause();
figure('Name','Structuring Element','NumberTitle','off');
imshow(SE.Neighborhood,'Border','tight');
pause();
figure('Name','Eroded Image','NumberTitle','off');
imshow(opened,'Border','tight');
pause();

close all;