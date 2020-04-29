clear all;
close all;

pkg load image

%% Code pour superpixel

%% test landscape

% loading image
X=imread('/home/rblin/Documents/Rachel_BLIN_PAO_TIM/Code/Superpixel/nature2.jpg');
figure()
imshow(X);
colormap('gray');
title('Original image');

% Superpixel division

% Transforming the image into the number of desired grayscale levels
niv_gris=16;
im_gris=rgb2gray(X);
[X_gris,X_coo]=niveaux_gris2(X,niv_gris,im_gris);

% Transforming the image into its texture features
N=300;
im_param = diviserParam(X, niv_gris, N);

% Dividing the image into superpixels using the SLIC algorithm
t=[0 10];
M=mat_coocurrence(X_coo,t,niv_gris);
[l, Am, Sp] = slic(X, im_param, N, 30, 1, 'median');
figure()
image(drawregionboundaries(l, X, [255 255 255]));
title('Superpixel division using the SLIC algorithm');

% Fusing the superpixels using DBSCAN algorithm

lc = spdbscan(l, Sp, Am, 0.055);
figure()
image(drawregionboundaries(lc, X, [255 255 255]));
title('Superpixel division using the DBSCAN algorithm');

