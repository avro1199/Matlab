clear;
clc;

s = tf('s');

g = 1/(s+ 1);
g2 = 10/(s^2 + 20*.2*s + 100);
g3 = (s+3)/((s+2)*(s+7));
ltiview(g2)