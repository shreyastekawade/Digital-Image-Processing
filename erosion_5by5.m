clc;
clear all;
close all;

image = imread('synthetic.jpg');
image = rgb2gray(image);
img = image;

structel = [255 255 255 255 255;255 255 255 255 255;255 255 255 255 255;255 255 255 255 255;255 255 255 255 255];

for i=3:1:size(image,1)-2
    for j=3:1:size(image,2)-2
        mat = uint8(image(i-2:1:i+2,j-2:1:j+2));
        if(uint8(mat) ~= uint8(structel))
            image(i,j) = 0;
        end
    end
end

outline = img - image;

figure('Name','Synthetic Original','NumberTitle','off');
imshow(img,'Border','tight');
pause();
figure('Name','Eroded','NumberTitle','off');
imshow(image,'Border','tight');
pause();
figure('Name','Outline','NumberTitle','off');
imshow(outline,'Border','tight');
pause();

close all;