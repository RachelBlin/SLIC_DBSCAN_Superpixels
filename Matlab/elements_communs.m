function nb = elements_communs(X,Y,niv_gris)

% nb = nombre d'éléments communs entre X et Y
% X et Y deux matrices

[m,n]=size(X);
[k,l]=size(Y);

if m>k
    m=k;
end
if n>l 
    n=l;
end

coeff = 256/niv_gris;
nb=0;
mat_X = zeros(niv_gris);
mat_Y = zeros(niv_gris);
for i=1:m
    for j=1:n
        for k=1:niv_gris
            if X(i,j) == (k-1)*coeff;
                mat_X(k) = mat_X(k)+1;
            end
            if Y(i,j) == (k-1)*coeff;
                mat_Y(k) = mat_Y(k)+1;
            end
        end
    end
end

for k =1:niv_gris
    nb = nb + max(mat_Y(k) + mat_X(k));
end
