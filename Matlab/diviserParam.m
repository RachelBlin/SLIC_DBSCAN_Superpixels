function im_param = diviserParam(im, niv_gris, N)

% FR
%
% im_param : l'image avec 3 canaux correspondant chacun à un paramètre de
% texture : canal 1 = homogénéité, canal 2 : contraste, canal 3 : uniformité
% im : l'image que l'on souhaite transformer 
% niv_gris : les nniveaux de gris de l'image souhaités
% N : le nombre de superpixels que l'on veut 

% -----------------------------------------------------------------------------

% EN 
%
% im_param: the image in which each channel corresponds to a texture parameter. 
% ch1 is the homogenity, ch2 is the contrast and ch3 is the uniformity
% im: original image
% niv_gris: the number of gray levels in the image
% N: the number of wanted superpixels

n1 = 0;
n2 = 0;
while (n1*n2 < N)
    n1 = n1 + 1;
    n2 = n2 + 1;
end

[long,larg,n]=size(im);
im_gris=rgb2gray(im);
[X_gris,X_coo]=niveaux_gris2(im,niv_gris,im_gris);
X_gris=uint8(X_gris);
t=[0 2];
im_param=ones(long,larg,3);
for i=1:n1:long
    if i+n1 > long
        deb1 =i;
        fin1 =long;
    else
        deb1 =i;
        fin1=i+n1-1;
    end
    for j=1:n2:larg
        if j+n2 >larg
            deb2=j;
            fin2=larg;
        else
            deb2=j;
            fin2=j+n2-1;
        end
        M=mat_coocurrence(X_coo(deb1:fin1,deb2:fin2),t,niv_gris);
        [homogeneite,contraste,entropie,correlation,homogeneite_locale,directivite,uniformite] = param_texture(M, niv_gris);
        param=[homogeneite_locale contraste directivite];
        im_param(deb1:fin1,deb2:fin2,1)=param(1);
        im_param(deb1:fin1,deb2:fin2,2)=param(2);
        im_param(deb1:fin1,deb2:fin2,3)=param(3);
    end
end
