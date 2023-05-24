clc;
clear all;
close all;

image = imread('synthetic.jpg');
image = rgb2gray(image);
img = image;

structel = zeros(5,5);

for i=3:1:size(image,1)-2
    for j=3:1:size(image,2)-2
        mat = uint8(image(i-2:1:i+2,j-2:1:j+2));
        if(uint8(mat) ~= uint8(structel))
            image(i,j) = 255;
        end
    end
end

figure('Name','Synthetic Original','NumberTitle','off');
imshow(img,'Border','tight');
pause();
figure('Name','Dilated','NumberTitle','off');
imshow(image,'Border','tight');
pause();

close all;