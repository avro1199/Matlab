clear;
clc;

s = tf('s');

g = (20*s^2 + 120*s + 160)/(s^3 + 24*s^2 + 191*s + 504);

% [n, d] = tfdata(g, 'v')

[z p k] = zpkdata(g)