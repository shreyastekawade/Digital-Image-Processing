%initialise file
clc;
clear all;
close all;

%read the image
current_frame = imread('cameraman.tif');
bit8 = double(bitget(current_frame,8));
bit7 = double(bitget(current_frame,7));
bit6 = double(bitget(current_frame,6));
bit5 = double(bitget(current_frame,5));
bit4 = double(bitget(current_frame,4));
bit3 = double(bitget(current_frame,3));
bit2 = double(bitget(current_frame,2));
bit1 = double(bitget(current_frame,1));

figure('Name','Original Image','NumberTitle','off');
imshow(current_frame,'Border','tight');
pause();

figure,
subplot(2,2,1)
imshow(bit8,'Border','tight'), title('Bit Plane 8');
subplot(2,2,2)
imshow(bit7,'Border','tight'), title('Bit Plane 7');
subplot(2,2,3)
imshow(bit6,'Border','tight'), title('Bit Plane 6');
subplot(2,2,4)
imshow(bit5,'Border','tight'), title('Bit Plane 5');

pause();

figure,
subplot(2,2,1)
imshow(bit4,'Border','tight'), title('Bit Plane 4');
subplot(2,2,2)
imshow(bit3,'Border','tight'), title('Bit Plane 3');
subplot(2,2,3)
imshow(bit2,'Border','tight'), title('Bit Plane 2');
subplot(2,2,4)
imshow(bit1,'Border','tight'), title('Bit Plane 1');

pause();
close all;
