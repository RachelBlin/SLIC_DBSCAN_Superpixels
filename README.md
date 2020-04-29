# SLIC_DBSCAN_Superpixels
This script segment an image into superpixels using the sclic algorithm combined with DBSCAN in Matlab and Python.

## Matlab version

## Python version

This repository requires:
* matplotlib `pip install matplotlib`
* skimage `pip install skimage`
* numpy `pip install numpy`
* sklearn `pip install sklearn`

To divide an image into superpixels using the SLIC algorithm and fuse them using the DBSCAN algorithm, run the following command:

`python test.py --image=/path/to/image`

The obtained results are below:

![Original image](Original_image.png)

![Plotting the superpixels boundaries using the SLIC algorithm](SLIC_boundaries.png)

![Displaying the SLIC labels (mean of the values of the pixel composing the superpixel)](SLIC_labels.png)

![Plotting the superpixels boundaries using the SLIC and DBSCAN algorithms](SLIC_DBSCAN_boundaries.png)

![Displaying the SLIC and DBSCAN labels (mean of the values of the pixel composing the superpixel)](SLIC_DBSCAN_labels.png)
