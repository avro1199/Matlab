clear;
clc;

syms x;
f(x) = x^2;
g(x) = sin(x);

y = f * g;

fplot([f, -f, g, y], LineWidth=1)
grid on;
xlim([-5 5]);
ylim([-10 10])