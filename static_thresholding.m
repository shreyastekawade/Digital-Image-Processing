clc;
clear all;
close all;

image = imread('snooker.png');

image = rgb2gray(image);

for i=1:1:8
    2^i-1
    img = imbinarize(image,(2^i-1)/255);
    imshow(imresize(img,1/2),'Border','tight');
    pause();
end

close all;