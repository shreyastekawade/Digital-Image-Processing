%initialise the file
clc;
clear all;
close all;

%read the image
current_frame = imread('snooker.png');%already in grayscale format

gray_frame = rgb2gray(current_frame);

%display image
figure('Name','Original Image','NumberTitle','off');
imshow(gray_frame,'Border','tight');
pause();

%calculate thresholds for required number of bits and apply on the image
%map
for i=7:-1:1
    %calculate thresholds for all required bits
    thresh = multithresh(gray_frame,i);
    %store maximum values of grayscale intervals created during multithresh
    %based on existing levels of grayscale values in the image
    valuesMax = [thresh max(gray_frame(:))];
    %store minimum values of grayscale intervals created by mutithresh
    valuesMin = [min(gray_frame(:)) thresh];
    %quantize the image based on first, the max threshold values
    [max_quantized, index] = imquantize(gray_frame,thresh,valuesMax);
    %second, on the minimum threshold values
    min_quantized = valuesMin(index);
    %print the image on screen
    figure('Name','Requantized Image Max Value');
    imshow(max_quantized);
    pause();
    figure('Name','Requantized Image Min Value');
    imshow(min_quantized);
    pause();
end
close all;