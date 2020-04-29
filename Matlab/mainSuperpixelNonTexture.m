clear all;
close all;

%% Code pour superpixel

%% test nature

%chargement de l'image
X=imread('nature2.jpg');
figure()
imshow(X);
colormap('gray');
title('Image originale');

%utilisation des superpixels

%transformation en niveaux de gris
niv_gris=16;
im_gris=rgb2gray(X);
[X_gris,X_coo]=niveaux_gris2(X,niv_gris,im_gris);

N=300;
im_param = diviserParam(X, niv_gris, N);

figure()
imshow(im_gris);
colormap('gray');
title('Transformation de l image en niveaux de gris fonction matlab');

X_gris=uint8(X_gris);
figure()
imshow(X_gris);
title('Transformation manuelle niveaux de gris');

t=[0 10];
M=mat_coocurrence(X_coo,t,niv_gris);
[homogeneite,contraste,entropie,correlation,homogeneite_locale,directivite,uniformite] = param_texture(M, niv_gris);
param=[homogeneite contraste uniformite];
[l, Am, Sp] = slic2(X, N, 30, 1, 'median');
figure()
image(drawregionboundaries(l, X, [255 255 255]));
title('Division de l''image en superpixels');

lc = spdbscan(l, Sp, Am, 10);
figure()
image(drawregionboundaries(lc, X, [255 255 255]));
title('Division de l''image en superpixels fusionnés');

% vérifier si deux superpixels sont voisins
% s'ils sont voisins, calculer la différence entre l'homogénéité, le
% contraste et la corrélation de ces superpixels
% la différence : sqrt(a²-b²)

%Pour cela : cibler les zones correspondantes au superpixel en question

% niv_gris=16;
% Differences=[];
% for i=1:length(Sp)
%     for j=1:length(Sp)
%         if Am(i,j)==1
%             Sp1=superpixelsMatrice(l, i, X);
%             Sp2=superpixelsMatrice(l, j, X);
%             im_gris1=rgb2gray(Sp1);
%             [X_gris1,X_coo1]=niveaux_gris(Sp1,niv_gris,im_gris1);
%             M1=mat_coocurrence(X_coo1,t,niv_gris);
%             im_gris2=rgb2gray(Sp2);
%             [X_gris2,X_coo2]=niveaux_gris(Sp2,niv_gris,im_gris2);
%             M2=mat_coocurrence(X_coo2,t,niv_gris);
%             [homogeneite1,contraste1,entropie1,correlation1,homogeneite_locale1,directivite1,uniformite1] = param_texture(M1, niv_gris);
%             [homogeneite2,contraste2,entropie2,correlation2,homogeneite_locale2,directivite2,uniformite2] = param_texture(M2, niv_gris);
%             Diff = difference(homogeneite1, contraste1, correlation1, homogeneite2, contraste2, correlation2);
%             Differences=[Differences; Diff];
%         end
%     end
% end

% Indice de Sorensen-Dice
% nature, scène routières, océan, forêt, animaux, intérieur de maison

[k,s1] = dice(X, niv_gris, N);

%% test scène routière

%chargement de l'image
X=imread('route.jpg');
figure()
imshow(X);
colormap('gray');
title('Image originale');

%utilisation des superpixels

%transformation en niveaux de gris
niv_gris=16;
im_gris=rgb2gray(X);
[X_gris,X_coo]=niveaux_gris2(X,niv_gris,im_gris);

N=200;
im_param = diviserParam(X, niv_gris, N);

figure()
imshow(im_gris);
colormap('gray');
title('Transformation de l image en niveaux de gris fonction matlab');

X_gris=uint8(X_gris);
figure()
imshow(X_gris);
title('Transformation manuelle niveaux de gris');

t=[0 10];
M=mat_coocurrence(X_coo,t,niv_gris);
[homogeneite,contraste,entropie,correlation,homogeneite_locale,directivite,uniformite] = param_texture(M, niv_gris);
param=[homogeneite contraste uniformite];
[l, Am, Sp] = slic2(X, N, 30, 1, 'median');
figure()
image(drawregionboundaries(l, X, [255 255 255]));
title('Division de l''image en superpixels');

lc = spdbscan(l, Sp, Am, 10);
figure()
image(drawregionboundaries(lc, X, [255 255 255]));
title('Division de l''image en superpixels fusionnés');

% Indice de Sorensen-Dice

[k,s2] = dice(X, niv_gris, N);

%% test ocean

%chargement de l'image
X=imread('ocean.jpg');
figure()
imshow(X);
colormap('gray');
title('Image originale');

%utilisation des superpixels

%transformation en niveaux de gris
niv_gris=16;
im_gris=rgb2gray(X);
[X_gris,X_coo]=niveaux_gris2(X,niv_gris,im_gris);

N=400;
im_param = diviserParam(X, niv_gris, N);

figure()
imshow(im_gris);
colormap('gray');
title('Transformation de l image en niveaux de gris fonction matlab');

X_gris=uint8(X_gris);
figure()
imshow(X_gris);
title('Transformation manuelle niveaux de gris');

t=[0 10];
M=mat_coocurrence(X_coo,t,niv_gris);
[homogeneite,contraste,entropie,correlation,homogeneite_locale,directivite,uniformite] = param_texture(M, niv_gris);
param=[homogeneite contraste uniformite];
[l, Am, Sp] = slic2(X, N, 30, 1, 'median');
figure()
image(drawregionboundaries(l, X, [255 255 255]));
title('Division de l''image en superpixels');

lc = spdbscan(l, Sp, Am, 10);
figure()
image(drawregionboundaries(lc, X, [255 255 255]));
title('Division de l''image en superpixels fusionnés');

% Indice de Sorensen-Dice

[k,s3] = dice(X, niv_gris, N);

%% test foret

%chargement de l'image
X=imread('foret.jpg');
figure()
imshow(X);
colormap('gray');
title('Image originale');

%utilisation des superpixels

%transformation en niveaux de gris
niv_gris=16;
im_gris=rgb2gray(X);
[X_gris,X_coo]=niveaux_gris2(X,niv_gris,im_gris);

N=400;
im_param = diviserParam(X, niv_gris, N);

figure()
imshow(im_gris);
colormap('gray');
title('Transformation de l image en niveaux de gris fonction matlab');

X_gris=uint8(X_gris);
figure()
imshow(X_gris);
title('Transformation manuelle niveaux de gris');

t=[0 10];
M=mat_coocurrence(X_coo,t,niv_gris);
[homogeneite,contraste,entropie,correlation,homogeneite_locale,directivite,uniformite] = param_texture(M, niv_gris);
param=[homogeneite contraste uniformite];
[l, Am, Sp] = slic2(X, N, 30, 1, 'median');
figure()
image(drawregionboundaries(l, X, [255 255 255]));
title('Division de l''image en superpixels');

lc = spdbscan(l, Sp, Am, 10);
figure()
image(drawregionboundaries(lc, X, [255 255 255]));
title('Division de l''image en superpixels fusionnés');

% Indice de Sorensen-Dice

[k,s4] = dice(X, niv_gris, N);

%% test animaux

%chargement de l'image
X=imread('iguane.jpg');
figure()
imshow(X);
colormap('gray');
title('Image originale');

%utilisation des superpixels

%transformation en niveaux de gris
niv_gris=16;
im_gris=rgb2gray(X);
[X_gris,X_coo]=niveaux_gris2(X,niv_gris,im_gris);

N=400;
im_param = diviserParam(X, niv_gris, N);

figure()
imshow(im_gris);
colormap('gray');
title('Transformation de l image en niveaux de gris fonction matlab');

X_gris=uint8(X_gris);
figure()
imshow(X_gris);
title('Transformation manuelle niveaux de gris');

t=[0 10];
M=mat_coocurrence(X_coo,t,niv_gris);
[homogeneite,contraste,entropie,correlation,homogeneite_locale,directivite,uniformite] = param_texture(M, niv_gris);
param=[homogeneite contraste uniformite];
[l, Am, Sp] = slic2(X, N, 30, 1, 'median');
figure()
image(drawregionboundaries(l, X, [255 255 255]));
title('Division de l''image en superpixels');

lc = spdbscan(l, Sp, Am, 5);
figure()
image(drawregionboundaries(lc, X, [255 255 255]));
title('Division de l''image en superpixels fusionnés');

% Indice de Sorensen-Dice

[k,s5] = dice(X, niv_gris, N);

%% test maison

%chargement de l'image
X=imread('maison2.jpg');
figure()
imshow(X);
colormap('gray');
title('Image originale');

%utilisation des superpixels

%transformation en niveaux de gris
niv_gris=16;
im_gris=rgb2gray(X);
[X_gris,X_coo]=niveaux_gris2(X,niv_gris,im_gris);

N=400;
im_param = diviserParam(X, niv_gris, N);

figure()
imshow(im_gris);
colormap('gray');
title('Transformation de l image en niveaux de gris fonction matlab');

X_gris=uint8(X_gris);
figure()
imshow(X_gris);
title('Transformation manuelle niveaux de gris');

t=[0 10];
M=mat_coocurrence(X_coo,t,niv_gris);
[homogeneite,contraste,entropie,correlation,homogeneite_locale,directivite,uniformite] = param_texture(M, niv_gris);
param=[homogeneite contraste uniformite];
[l, Am, Sp] = slic2(X, N, 30, 1, 'median');
figure()
image(drawregionboundaries(l, X, [255 255 255]));
title('Division de l''image en superpixels');

lc = spdbscan(l, Sp, Am, 10);
figure()
image(drawregionboundaries(lc, X, [255 255 255]));
title('Division de l''image en superpixels fusionnés');

% Indice de Sorensen-Dice

[k,s6] = dice(X, niv_gris, N);

%% test imagerie médiacle

%chargement de l'image
X=imread('im5.jpg');
figure()
imshow(X);
colormap('gray');
title('Image originale');

%utilisation des superpixels

%transformation en niveaux de gris
niv_gris=8;
im_gris=rgb2gray(X);
[X_gris,X_coo]=niveaux_gris2(X,niv_gris,im_gris);

N=300;
im_param = diviserParam(X, niv_gris, N);

figure()
imshow(im_gris);
colormap('gray');
title('Transformation de l image en niveaux de gris fonction matlab');

X_gris=uint8(X_gris);
figure()
imshow(X_gris);
title('Transformation manuelle niveaux de gris');

t=[0 10];
M=mat_coocurrence(X_coo,t,niv_gris);
[homogeneite,contraste,entropie,correlation,homogeneite_locale,directivite,uniformite] = param_texture(M, niv_gris);
param=[homogeneite contraste uniformite];
[l, Am, Sp] = slic2(X, N, 30, 1, 'median');
figure()
image(drawregionboundaries(l, X, [255 255 255]));
title('Division de l''image en superpixels');

lc = spdbscan(l, Sp, Am, 7);
figure()
image(drawregionboundaries(lc, X, [255 255 255]));
title('Division de l''image en superpixels fusionnés');

% Indice de Sorensen-Dice

[k,s7] = dice(X, niv_gris, N);

%% test imagerie médiacle

%chargement de l'image
X=imread('im13.jpg');
figure()
imshow(X);
colormap('gray');
title('Image originale');

%utilisation des superpixels

%transformation en niveaux de gris
niv_gris=8;
im_gris=rgb2gray(X);
[X_gris,X_coo]=niveaux_gris2(X,niv_gris,im_gris);

N=300;
im_param = diviserParam(X, niv_gris, N);

figure()
imshow(im_gris);
colormap('gray');
title('Transformation de l image en niveaux de gris fonction matlab');

X_gris=uint8(X_gris);
figure()
imshow(X_gris);
title('Transformation manuelle niveaux de gris');

t=[0 10];
M=mat_coocurrence(X_coo,t,niv_gris);
[homogeneite,contraste,entropie,correlation,homogeneite_locale,directivite,uniformite] = param_texture(M, niv_gris);
param=[homogeneite contraste uniformite];
[l, Am, Sp] = slic2(X, N, 30, 1, 'median');
figure()
image(drawregionboundaries(l, X, [255 255 255]));
title('Division de l''image en superpixels');

lc = spdbscan(l, Sp, Am, 7);
figure()
image(drawregionboundaries(lc, X, [255 255 255]));
title('Division de l''image en superpixels fusionnés');

% Indice de Sorensen-Dice

[k,s8] = dice(X, niv_gris, N);

%% Tracé du dice

figure()
subplot(4,2,1)
plot(s1)
title('nature');
subplot(4,2,2)
plot(s2)
title('scène routière');
subplot(4,2,3)
plot(s3)
title('océan');
subplot(4,2,4)
plot(s4)
title('foret');
subplot(4,2,5)
plot(s5)
title('animaux');
subplot(4,2,6)
plot(s6)
title('maison');
subplot(4,2,7)
plot(s7)
title('imagerie médiacale');
subplot(4,2,8)
plot(s8)
title('imagerie médicale');