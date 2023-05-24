#take required libraries
import numpy as np
import cv2
import math


image=cv2.imread("lena.bmp",0)
cv2.imshow("Original Image",image)
img = (image)

r = img.shape[0]
c = img.shape[1]

constant = 10
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

for i in range(0,r):
    for j in range(0,c):
        img[i][j] = (2*(maximum-minimum)/constant) * math.log(1+(img[i][j]/255),(maximum-minimum)/255)
            
cv2.imshow("Threshold Constant",img)
