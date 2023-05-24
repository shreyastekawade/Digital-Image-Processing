%Lab Assignment 1 : Subsampling an image
%Pradyumna Marathe, TY L - 01, 09/08/2018

%intialise file
clc;
clear all;
close all;

%read image
use = imread('test1.jpg');
imshow(use,'Border','tight');
pause();
%subsample the image n times
for i=1:1:7
    use = use(:,1:2:end);
    use = use(1:2:end,:);
    imshow(use,'Border','tight');
    pause();
end