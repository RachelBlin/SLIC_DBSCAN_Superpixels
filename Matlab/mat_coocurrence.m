function M =mat_coocurrence(X, t, niv_gris)

% X : matrice des pixels de l'image
% t : translation, exemple t = (0,1) = translation d'un pixel vers le bas
% niv_gris : nombre de niveaux de gris sur lesquels l'image est quantifiée

[lig,col]=size(X);
M=zeros(niv_gris+1);

for i=1:lig-t(1)
    for j=1:col-t(2)
       M(X(i,j)+1,X(i+t(1),j+t(2))+1)=M(X(i,j)+1,X(i+t(1),j+t(2))+1)+1;
    end
end