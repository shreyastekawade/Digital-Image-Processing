#take required libraries
import numpy as np
import cv2
import math


image=cv2.imread("lena.bmp",0)
cv2.imshow("Original Image",image)
img = (image)

r = img.shape[0]
c = img.shape[1]

constant = 1.03

for i in range(0,r):
    for j in range(0,c):
        img[i][j] = pow(img[i][j],constant)
            
cv2.imshow("Threshold Constant",img)
