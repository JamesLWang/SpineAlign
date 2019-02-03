import cv2
import math

left  = cv2.imread("left.png")
right = cv2.imread("right.png")
left = cv2.cvtColor(left, cv2.COLOR_BGR2GRAY)
right = cv2.cvtColor(right, cv2.COLOR_BGR2GRAY)

l = 1
r = 1
sets = []

while l < (left[:].shape[0]-20):
    if(left[l][198] > 50):
        print (l)
        break
    l += 1

print("---")

while r < (right[:].shape[0]-20):
    if(right[r][20] > 50):
        print (r)
        break
    r += 1

pixelDiff = math.fabs(l-r)

sets.append(l)
sets.append(r)

traversal = min(sets)
complement = left.shape[0] - traversal
percent = 100 * pixelDiff/complement

print("Difference (piexels): " + str(pixelDiff))
print("Pecentage of difference: " + str(percent) + "%")


