%Lab Assignment 1 : Subsampling an image
%Pradyumna Marathe, TY L - 01, 09/08/2018
tic
timerval = tic;
%intialise file
clc;
clear all;
close all;

%read image
frame = imread('test1.jpg');
use = rgb2gray(frame);
imshow(use,'Border','tight');
pause();
%downsample the image 6 times
for i=1:1:6
    y1 = downsample(use,2);
    trans_y1 = permute(y1,[2 1]);
    y1_op = downsample(trans_y1,2);
    imshow(y1_op','Border','tight');
    if i==1
        imwrite(y1_op','downsampled1.jpg','jpg');
    elseif i==2
        imwrite(y1_op','downsampled2.jpg','jpg');
    elseif i==3
        imwrite(y1_op','downsampled3.jpg','jpg');
    elseif i==4
        imwrite(y1_op','downsampled4.jpg','jpg');
    elseif i==5
        imwrite(y1_op','downsampled5.jpg','jpg');
    elseif i==6
        imwrite(y1_op','downsampled6.jpg','jpg');
    end
    pause();
    use = y1_op';
end

%Now, Upsample required images
for k=1:1:6
    if k==1
        read_image = imread('downsampled6.jpg');
    elseif k==2
        read_image = imread('downsampled5.jpg');
    elseif k==3
        read_image = imread('downsampled4.jpg');
    elseif k==4
        read_image = imread('downsampled3.jpg');
    elseif k==5
        read_image = imread('downsampled2.jpg');
    elseif k==6
        read_image = imread('downsampled1.jpg');
    end
    test = imsharpen(read_image);
    [r,c] = size(test);
    upsampled1 = zeros(r,(2*c));
    z=0;
    for i=1:1:c-1
        z = z + 1;
        upsampled1(:,z) = test(:,i);
        z = z + 1;
        col1 = test(:,i);
        col2 = test(:,i+1);
        col_avg = (col1+col2)/2;
        upsampled1(:,z) = col_avg;
    end
    [r1,c1] = size(upsampled1);
    upsampled2 = zeros((2*r),c1);
    z=0;
    for i=1:1:r1-1
        z = z + 1;
        upsampled2(z,:) = upsampled1(i,:);
        z = z + 1;
        row1 = upsampled1(i,:);
        row2 = upsampled1(i+1,:);
        row_avg = (row1+row2)/2;
        upsampled2(z,:) = row_avg;
    end
    [r2,c2] = size(upsampled2);
    imshow(test,'Border','tight');
    pause();
    imshow(upsampled1,'Border','tight');
    pause();
    imshow(upsampled2,'Border','tight');
    pause();
end
toc