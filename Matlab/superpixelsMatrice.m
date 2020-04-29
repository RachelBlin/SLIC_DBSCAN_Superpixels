function Sp = superpixelsMatrice(l, k, X)

%transformer un superpixel en matrice afin de pouvoir calculer ses
%paramètres
% l : matrice contenant le numéro du superpixel auquel appartient un pixel de l'image en question
% k : numéro du superpixel 
% X : l'image originale

[lig,col]=find(l==k);
lig_max=max(lig);
col_max=max(col);
lig_min=min(lig);
col_min=min(col);

for i=lig_min:lig_max
    for j=col_min:col_max
        if(l(i,j)==k)
            mat(i-lig_min+1,j-col_min+1)=1;
        else
            mat(i-lig_min+1,j-col_min+1)=0;
        end
    end
end

for i=lig_min:lig_max
    for j=col_min:col_max
        Sp(i-lig_min+1,j-col_min+1,:)=X(i,j,:);
    end
end


