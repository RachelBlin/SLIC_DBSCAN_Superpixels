function [k, s] = dice(im, niv_gris, N);
% FR
%
% s= 2|X inter Y|/(|X| + |Y|) avec |X| le nombre d'éléments de X
% X et Y deux super-pixels, dans notre cas, on compare la proximité des
% super pixels deux à deux.
% niv_gris, le nombre de niveaux de gris de l'image
% N le nombre de super-pixels que l'on veut

% ----------------------------------------------------------------------------

% EN
% 
% s = 2|X inter Y|/(|X| + |Y|) with |X| the number of elements in X and X and Y 
% two superpixels, in our case, we compare the proximity of two superpixels
% niv_gris: the number of gray levels in the image
% N: the number of desired super-pixels

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

s = [];
k=1;
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
        if ((fin2 + n2) < larg)
            nb = elements_communs(X_gris(deb1:fin1,deb2:fin2),X_gris(deb1:fin1,deb2+n2:fin2+n2), niv_gris);
            s(k) = nb/(long*larg);
            k=k+1;
        end
    end
end


            



