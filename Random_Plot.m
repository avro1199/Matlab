clear;
clc;

syms x;

f(x) = 3*x^2 - 9*x;
g(x) = (x^2)/3;

fplot(f,LineWidth=1)
grid on
hold on
axis auto

ylim([-3, 7])

fplot(x, LineWidth=1)
fplot(g, LineWidth=1)