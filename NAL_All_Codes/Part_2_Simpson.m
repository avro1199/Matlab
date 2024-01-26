fnc = @(x) x.^2.*exp(-x);

a = 0;
b = 4;

n = 12;

h = (b-a)/n;

x = [a:h:b];
y = fnc(x);
