clc;
clear all;
close all;

current_frame = imread('lena.bmp');
noisy_image = imnoise(current_frame,'salt & pepper',0.02);
filtered_image = medfilt2(noisy_image,[3 3]);

imshow(current_frame,'Border','tight');
pause();
imshow(noisy_image,'Border','tight');
pause();
imshow(filtered_image,'Border','tight');