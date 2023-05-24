clc;
clear all;
close all;

current_frame = imread('lena.bmp');

prompt = 'Enter Gamma (gamma>1 for darkening and gamma<1 for brightening): ';

g = input(prompt);

double_frame = double(current_frame)/255;

power_frame = double_frame.^g;

imshow(current_frame,'Border','tight');
pause();
imshow(power_frame,'Border','tight');