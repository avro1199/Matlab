clear;
clc;

s = tf('s');

g = 59.292/(s^2 + 6.9779*s + 15.1239);

d1 = 3;
d2 = 3+15/s;
d3 = 3+15/s+0.3*s;

m1 = feedback(d1*g, 1);
m2 = feedback(d2*g, 1);
m3 = feedback(d3*g, 1);

ltiview(m1, m2, m3);