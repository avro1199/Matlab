clear;
clc;

A = (38+26)/2;

syms x f(x);

f(x) = cos(A*x);
x1 = pi/3;
x0 = pi/4;
h = (x1 - x0);
result(1) = f(x0);
fprintf('Zero order approximation: %f', result(1));
fprintf('\nZero order Error: %.6f', result(1) - f(x1));

for n = 1:5
    deri = diff(f, n);
    derAt = deri(x0);
    fact = factorial(n);
    result(n+1) = result(n) + derAt*(h^n) / fact;
    error = abs((f(x1) - result(n+1)) / f(x1)) * 100;

    fprintf('\n\n%d Order Approximation: %0.9f', n, result(n+1));
    fprintf('\n Error : %0.9f', error);
end
for i = 1:6
    subplot(2,3,i);
    fplot([result(i) f(x)]);
end