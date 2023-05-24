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
        img[i][j] = 255 - img[i][j]
cv2.imshow("Negated Image",img)
