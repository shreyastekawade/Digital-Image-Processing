clc;
clear all;
close all;

current_frame = imread('cameraman.tif');
img = current_frame;
[row, col] = size(img);
for i = 2:1:row-1
    for j = 2:1:col-1
        img(i,j) = 4*(img(i,j)) - img(i,j-1) - img(i,j+1) - img(i-1,j) - img(i+1,j);
    end
end
img_dash = img + current_frame;

figure('Name','Original Image','NumberTitle','off');
imshow(current_frame,'Border','tight');
pause();
figure('Name','First Order Derivative','NumberTitle','off');
imshow(img,'Border','tight');
pause();
figure('Name','Derivative + Original','NumberTitle','off');
imshow(img_dash,'Border','tight');
pause();
close all;