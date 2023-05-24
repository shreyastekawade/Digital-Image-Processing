#take required libraries
import numpy as np
import cv2

image=cv2.imread("lena.bmp",0)
cv2.imshow("Original Image",image)
img=image

r = img.shape[0]
c = img.shape[1]

for i in range(0,r):
    for j in range(0,c):
        if img[i][j] > 50 & img[i][j]<150:
            img[i][j] = img[i][j] + 90
cv2.imshow("Threshold Constant",img)
