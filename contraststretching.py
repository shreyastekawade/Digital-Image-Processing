#take required libraries
import numpy as np
import cv2

image=cv2.imread("lena.bmp",0)
cv2.imshow("Original Image",image)
img=image

r = img.shape[0]
c = img.shape[1]

maximum = img[0][0]
for i in range(0,r):
    for j in range(0,c):
        if img[i][j] > maximum:
            maximum = img[i][j]

minimum = img[0][0]
for i in range(0,r):
    for j in range(0,c):
        if img[i][j] < minimum:
            minimum = img[i][j]

range_img = maximum - minimum

for i in range(0,r):
    for j in range(0,c):
        img[i][j] = (img[i][j] - minimum) * (255/(maximum-minimum))
            
cv2.imshow("Threshold Constant",img)
