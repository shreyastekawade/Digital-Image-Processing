clc;
clear all;
close all;

current_frame = imread('cameraman.tif');
noisy = imnoise(current_frame,'salt & pepper',0.02);
img = current_frame;%noisy;
[row, col] = size(img);
for x=1:1:50
    for i = 2:1:row-1
        for j = 2:1:col-1
            %rearrange 3*3 mask as 1*9 mask
            img(i,j) = round(img(i-1,j-1)/9 + img(i-1,j)/9 + img(i-1,j+1)/9 + img(i,j-1)/9 + img(i,j)/9 + img(i,j+1)/9 + img(i+1,j-1)/9 + img(i+1,j)/9 + img(i+1,j+1)/9);
        end
    end
end
img = round(img);
figure('Name','Original Image','NumberTitle','off');
imshow(current_frame,'Border','tight');
pause();
figure('Name','Noisy Image','NumberTitle','off');
imshow(noisy,'Border','tight');
pause();
figure('Name','Averaged Image','NumberTitle','off');
imshow(img,'Border','tight');
pause();
close all;