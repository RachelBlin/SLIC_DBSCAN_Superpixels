function [X_gris,X_coo] = niveaux_gris(X,niv_gris,im_gris)

% X : image que l'on souhaite transformer
% niv_gris : nombres de niveaux de gris que l'on souhaite
% X_gris : image en niveaux de gris
% X_coo : X utilisable pour la matrice de coocurences

[N,M,const]=size(X);
pas = round(256/niv_gris);
intervalle=[0:pas:256];

for i=1:N
    for j=1:M
        for k=2:niv_gris
            if (im_gris(i,j) > intervalle(k-1) &&  X(i,j) <= intervalle(k))
                if (im_gris(i,j) <= (intervalle(k-1)+intervalle(k))/2)
                    X_gris(i,j)=intervalle(k-1);
                    X_coo(i,j)=k-2;
                else
                    X_gris(i,j)=intervalle(k);
                    X_coo(i,j)=k-1;
                end
            end
        end
    end
end

% for i=1:N
%     for j=1:M
%         if (X_gris(i,j)==0 && im_gris(i,j)>(intervalle(1)+intervalle(2))/2)
%                 X_gris(i,j)=255;
%         end
%     end
% end

