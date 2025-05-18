clear;
clc;

s = tf('s');

g = (s+1)/(s^2 + 3*s + 1);

[s, t] = gensig('square', 4);

lsim(g, s, t)