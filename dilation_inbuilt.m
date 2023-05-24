clc;
clear all;
close all;

image = imread('synthetic2.tiff');

image = rgb2gray(image);
prompt = 'Input Size of Structuring Element: ';
x = input(prompt);
SE = strel('disk',x);

dilated = imdilate(image,SE);

outline = dilated - image;

figure('Name','Original Grayscale','NumberTitle','off');
imshow(image,'Border','tight');
pause();
figure('Name','Structuring Element','NumberTitle','off');
imshow(SE.Neighborhood,'Border','tight');
pause();
figure('Name','Eroded Image','NumberTitle','off');
imshow(dilated,'Border','tight');
pause();
figure('Name','Outline','NumberTitle','off');
imshow(outline,'Border','tight');
pause();

close all;