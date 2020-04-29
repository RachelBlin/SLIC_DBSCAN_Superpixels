function Diff = difference(homogeneite1, contraste1, uniformite1, homogeneite2, contraste2, uniformite2)

% vecteur de différence entre l'homogénéité, le contraste et la corrélation
% des superpixels Sp1 et Sp2, dans cet ordre.

% Diff(1)=sqrt(homogeneite1^2-homogeneite2^2);
% Diff(2)=sqrt(contraste1^2-contraste2^2);
% Diff(3)=sqrt(correlation1^2-correlation2^2);

Diff(1)=sqrt(abs(homogeneite1^2-homogeneite2^2));
Diff(2)=sqrt(abs(contraste1^2-contraste2^2));
Diff(3)=sqrt(abs(uniformite1^2-uniformite2^2));