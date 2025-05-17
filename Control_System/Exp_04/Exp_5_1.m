clear;
clc;

s = tf('s');

ka = 1000;
g1 = 100/(s+100);
g2 = 0.2083/(s*(s+1.71));
h = 1/pi;

g = series(ka*g1, g2);
m = series(feedback(g, h), h);

g11 = 1;
g0 = series(ka*g11, g2);
m1 = series(feedback(g0, h), h);

ltiview(m, m1);