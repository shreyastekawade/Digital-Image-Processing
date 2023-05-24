clc;
clear all;
close all;

image = imread('synthetic.jpg');
image = rgb2gray(image);
img = image;

structel = [255 255 255;255 255 255;255 255 255];
for i=2:1:size(image,1)-1
    for j=2:1:size(image,2)-1
        mat = uint8(image(i-1:1:i+1,j-1:1:j+1));
        if(uint8(mat) ~= uint8(structel))
            image(i,j) = 0;
        end
    end
end
eroded = image;
structel = structel .*0;
outline = img - eroded;
for i=2:1:size(image,1)-1
    for j=2:1:size(image,2)-1
        mat = uint8(image(i-1:1:i+1,j-1:1:j+1));
        if(uint8(mat) ~= uint8(structel))
            image(i,j) = 255;
        end
    end
end

opened = img - image;

figure('Name','Synthetic Original','NumberTitle','off');
imshow(img,'Border','tight');
pause();
figure('Name','Eroded','NumberTitle','off');
imshow(eroded,'Border','tight');
pause();
figure('Name','Outline after Erosion','NumberTitle','off');
imshow(outline,'Border','tight');
pause();
figure('Name','Opened','NumberTitle','off');
imshow(image,'Border','tight');
pause();
figure('Name','Comparison after Opening','NumberTitle','off');
imshow(opened,'Border','tight');
pause();

close all;