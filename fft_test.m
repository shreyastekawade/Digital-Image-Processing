clc;
clear all;
close all;

image = imread('licenseplate.jpg');
gray = rgb2gray(image);

gray_fft = fft2(gray);
phase = angle(gray_fft);
gray_fft = fftshift(gray_fft);

img = ifft2(phase);

figure('Name','Original Image','NumberTitle','off');
imshow(gray,'Border','tight');
pause();
figure('Name','FFT Magnitude','NumberTitle','off');
imagesc(abs(gray_fft));
pause();
figure('Name','FFT Phase','NumberTitle','off');
imshow(phase,'Border','tight');
pause();
figure('Name','FFT Phase Reconstructed','NumberTitle','off');
imshow(img,'Border','tight');
pause();

close all;