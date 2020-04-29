function [X_gris,X_coo] = niveaux_gris2(X,niv_gris,im_gris)

indice=256/niv_gris;
intervalle(1,:) = 0:indice:256;
intervalle(2,:) = 0:niv_gris;

X_gris=double(floor(im_gris/indice));
X_gris=X_gris*niv_gris;

[long, larg]=size(X_gris);

X_coo = zeros(long,larg);
for i=1:long
    for j=1:larg
        for k=1:(niv_gris+1)
            if (X_gris(i,j) == intervalle(1,k))
                X_coo(i,j) = intervalle(2,k);
            end
        end
    end
end
