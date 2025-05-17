clear all;
clc;

s = tf('s');

g1 = s;
g2 = s;
g3 = s;

g4 = 1/s;
g5 = 1/s;
g6 = 1;

sys = append(g1, g2, g3, g4, g5, g6);

rel = [1 6 -3 -2 -4
       2 1 0 0 0 
       3 5 0 0 0
       4 6 -3 -2 -4
       5 2 4 0 0];

out = 5;
in = 6;

stsp = connect(sys, rel, in, out);

tfnc = tf(stsp)