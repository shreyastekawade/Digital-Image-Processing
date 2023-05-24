clc;
clear all;
close all;

image = imread('lena.bmp');

prompt = 'Enter the first threshold : ';
lower_threshold = input(prompt);
prompt = 'Enter the 2nd threshold : ';
higher_threshold = input(prompt);
prompt = 'Enter the constant for above thresholds : ';
constant = input(prompt);

[r,c] = size(image);
img = image;

for i=1:1:r
    for j=1:1:c
        if(img(i,j) > lower_threshold && img(i,j) < higher_threshold)
            img(i,j) = img(i,j) + constant;
        else
            img(i,j) = constant;
        end
    end
end

figure('Name','Original Image','NumberTitle','off');
imshow(image,'Border','tight');
pause();
h1 = histogram(image);
pause();
figure('Name','Constant Output Image','NumberTitle','off');
imshow(img,'Border','tight');
pause();
h2 = histogram(img);
pause();
close all;