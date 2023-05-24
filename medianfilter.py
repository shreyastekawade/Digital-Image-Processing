#take required libraries
import numpy as np
import cv2
import math


image=cv2.imread("lena.bmp",0)
cv2.imshow("Original Image",image)
img = (image)

r = img.shape[0]
c = img.shape[1]

pad_rows = np.zeros((r,1))
pad_cols = np.zeros((c,1))

for x in range(1,r-1):
    for y in range(1,c-1):
        a1 = np.array([img(x-1,y-1), img(x-1,y), img(x-1,y+1), img(x,y-1), img(x,y), img(x,y+1), img(x+1,y-1), img(x+1,y), img(x+1,y+1)])
            
cv2.imshow("Padded Image",padded)
