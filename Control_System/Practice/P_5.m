clear;
clc;

% syms T s;
% 
% g(s) = 10/(T*s+1);
% 
% il = ilaplace(g);
% 
% il

syms t;

g(t) = 1 + exp(-4*t)/3 - 4*exp(-t)/3;

% pretty(g)
lp = laplace(g);

pretty(lp)