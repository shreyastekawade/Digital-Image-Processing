clc;
clear all;
close all;

image = imread('lena.bmp');
img = image;
prompt = 'Enter Gray Level 1 : ';
gray1 = input(prompt);
prompt = 'Enter Gray Level 2 : ';
gray2 = input(prompt);
prompt = 'Enter Constant Gray level to convert all others : ';
constant = input(prompt);
[r,c] = size(image);
for i=1:1:r
    for j=1:1:c
        if(img(i,j) >= gray1 & img(i,j) <= gray2)
            img(i,j)= 100;
        else
            img(i,j) = constant;
        end
    end
end
original = zeros(1,256);
changed = original;
for i=1:1:size(original,2)
    original(1,i) = i-1;
end

for i=1:1:size(original,2)
    if(original(1,i) >= gray1 & original(1,i) <= gray2)
        changed(1,i) = 100;
    else
        changed(1,i) = constant;
    end
end

figure('Name','Original Image','NumberTitle','off');
imshow(image,'Border','tight');
pause();
figure('Name','Gray Level Sliced Image','NumberTitle','off');
imshow(img,'Border','tight');
pause();
plot(original,changed);
pause();
close all;