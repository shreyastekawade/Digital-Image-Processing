%initialise file
clc;
clear all;
close all;

%read image
current_frame = imread('lena.bmp');

prompt = 'Enter constant value : ';
c = input(prompt);

double_frame = double(current_frame)/255;

log_frame = c * log(1 + (double_frame));

imshow(current_frame,'Border','tight');
pause();
imshow(log_frame,'Border','tight');