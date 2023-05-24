clc;
clear all;
close all;

image = imread('snooker.png');
image = rgb2gray(image);

image_hist = imhist(image)

for i=2:1:(size(image_hist,1)-1)
    if(image_hist(i,1) > image_hist(i-1,1) && image_hist(i,1) > image_hist(i+1,1))
        i-1
        img = imbinarize(image,((i-1)/255));
        imshow(imresize(img,0.5),'Border','tight');
        pause();
    end
end

close all;