function [homogeneite,contraste,entropie,correlation,homogeneite_locale,directivite,uniformite]=param_texture(M, niv_gris)

[N,N]=size(M);
Nc=niv_gris^2;
L=niv_gris;

homogeneite=0;
for i=1:N
    for j=1:N
        homogeneite=homogeneite+M(i,j)^2;
    end
end
homogeneite=homogeneite/(Nc^2);
%d'autant plus éléve qu'on trouve souvent le même couple

contraste=0;
for k=0:L-1
    for i=1:N
        for j=1:N
            if (abs(i-j)==k)
                contraste=contraste+M(i,j)*k^2;
            end
        end
    end
end
contraste=contraste/(Nc*(L-1)^2);
%d'autant plus élevé qu'on passe souvent d'un pixel clair à un pixel plus
%foncé

Mct=[];
for i=1:N
    for j=1:N
        if (M(i,j)==0)
            Mct(i,j)=0;
        else
            Mct(i,j)=1;
        end
    end
end

entropie=0;
for i=1:N
  for j=1:N
      entropie=entropie+M(i,j)*log(M(i,j))*Mct(i,j);
  end
end
entropie=1-entropie/(Nc*log(Nc));
%faible si souvent le même couple de pixels, indique le désordre d'une
%texture

correlation=0;
mx=0;
my=0;
vx=0;
vy=0;

for i=1:N
    for j=1:N
        mx=mx+i*M(i,j);
    end
end
mx=mx/Nc;

for i=1:N
    for j=1:N
        my=my+j*M(i,j);
    end
end
my=my/Nc;

for i=1:N
    for j=1:N
        vx=vx+(i-mx)^2*M(i,j);
    end
end
vx=vx/Nc;

for i=1:N
    for j=1:N
        vy=vy+(j-my)^2*M(i,j);
    end
end
vy=vy/Nc;

for i=1:N
    for j=1:N
        correlation=correlation+(i-mx)*(j-my)*M(i,j);
    end
end
correlation=abs(correlation)/(Nc*sqrt(vx*vy));
%proche de 1 si forte corrélation

homogeneite_locale=0;
for i=1:N
    for j=1:N
        homogeneite_locale=homogeneite_locale+M(i,j)/(1+(i-j)^2);
    end
end
homogeneite_locale=homogeneite_locale/Nc;

directivite=0;
for i=1:N
    directivite=directivite+M(i,i);
end
directivite=directivite/Nc;
%importante si pixels de même niveau de gris séparés par translation

uniformite=0;
for i=1:N
    uniformite=uniformite+M(i,i)^2;
end
uniformite=uniformite/Nc^2;
%importante si un seul niveau de gris apparait souvent dans la direction de
%la translation
        

