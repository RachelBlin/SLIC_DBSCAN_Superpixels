# import the necessary packages
from skimage import color
from skimage.segmentation import slic, mark_boundaries
from skimage.util import img_as_float
from skimage import io
import matplotlib.pyplot as plt
import argparse
import numpy as np

from sklearn.cluster import DBSCAN

# construct the argument parser and parse the arguments
ap = argparse.ArgumentParser()
ap.add_argument("-i", "--image", required = True, help = "Path to the image")
args = vars(ap.parse_args())
# load the image and convert it to a floating point data type
image = img_as_float(io.imread(args["image"]))
plt.figure()
plt.imshow(image)
plt.title("Image before transformation")
# define the number of segments
numSegments=300
# apply SLIC and extract (approximately) the supplied number of segments
segments = slic(image, n_segments=numSegments, sigma=5, compactness=5, convert2lab=True) # a higher value of compactness leads to squared regions, a higher value of sigma leads to rounded delimitations
# show the output of SLIC
fig = plt.figure("Superpixels -- %d segments" % (numSegments))
ax = fig.add_subplot(1, 1, 1)
ax.imshow(mark_boundaries(image, segments))
plt.title("Original image with the sclic superpixels boundaries")
plt.axis("off")
# show the plots

# Transforming the labels into superpixels, we attribute to each one the average color of the pixels composing it
superpixels = color.label2rgb(segments, image, kind='avg')
plt.figure("Superpixel image after sclic algorithm")
plt.imshow(superpixels)
plt.title("Superpixel image after sclic algorithm")

# Combine DBSCAN to slic algorithm

# If process stop use a smaller value for eps
# If pixel don't fuse use a larger eps

if len(superpixels.shape)>2:
    rows, cols, chs = superpixels.shape
    feature_image = np.reshape(superpixels, [-1, chs])
    db = DBSCAN(eps=0.04, min_samples=5, metric='euclidean', algorithm='auto', n_jobs=1)
    db.fit(feature_image)
    labels = db.labels_

    final_labels = np.reshape(labels, [rows, cols])

    plt.figure("Labels after sclic + DBSCAN algorithm")
    plt.imshow(final_labels)
    plt.title("Labels after sclic + DBSCAN algorithm")

    # Transforming the labels into superpixels, we attribute to each one the average color of the pixels composing it

    fig = plt.figure("Original image with the sclic + DBSCAN superpixels boundaries")
    ax = fig.add_subplot(1, 1, 1)
    ax.imshow(mark_boundaries(image, final_labels))
    plt.axis("off")
    plt.title("Original image with the sclic + DBSCAN superpixels boundaries")

    slic_dbscan = color.label2rgb(final_labels, image, kind='avg')
    plt.figure("Superpixel image after sclic + DBSCAN algorithm")
    plt.imshow(slic_dbscan)
    plt.title("Superpixel image after sclic + DBSCAN algorithm")
    plt.show()
else:
    rows, cols = superpixels.shape
    feature_image = np.reshape(superpixels, [-1,1])
    db = DBSCAN(eps=0.00005, min_samples=5, metric='euclidean', algorithm='auto', n_jobs=1)
    db.fit(feature_image)
    labels = db.labels_

    final_labels = np.reshape(labels, [rows, cols])

    plt.figure("Labels after sclic + DBSCAN algorithm")
    plt.imshow(final_labels)
    plt.title("Labels after sclic + DBSCAN algorithm")

    # Transforming the labels into superpixels, we attribute to each one the average color of the pixels composing it

    fig = plt.figure("Original image with the sclic + DBSCAN superpixels boundaries")
    ax = fig.add_subplot(1, 1, 1)
    ax.imshow(mark_boundaries(image, final_labels))
    plt.axis("off")
    plt.title("Original image with the sclic + DBSCAN superpixels boundaries")

    slic_dbscan = color.label2rgb(final_labels, image, kind='avg')
    plt.figure("Superpixel image after sclic + DBSCAN algorithm")
    plt.imshow(slic_dbscan)
    plt.title("Superpixel image after sclic + DBSCAN algorithm")
    plt.show()



