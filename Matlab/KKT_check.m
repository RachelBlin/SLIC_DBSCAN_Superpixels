function bol = KKT_check(Q,f,A,b,x)

% retourne 0 si la solution est optimale et 1 sino
bol=1;
x_opti=[Q A'; A 0]\[-f;b];
 if x_opti==x
     bol=0;
 end


