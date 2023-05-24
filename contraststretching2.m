%initialise the file
clc;
clear all;
close all;
%read the image
X = imread('lena.bmp');
%find minimum in the entire image
a = min(X(:));  %minimum pixel of image X
%find maximum in the entire image
b = max(X(:)); %maximum pixel of image X
%contrast stretch using formula
Y = (X-a).*(255/(b-a));
%display the images
imshow(X,'Border','tight');
pause();
imshow(Y,'Border','tight');