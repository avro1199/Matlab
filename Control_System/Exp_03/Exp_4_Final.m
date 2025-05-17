clear all;
clc;

s = tf('s');

g1 = 1/(s+7);
g2 = 1/(s^2 + 2*s + 3);
g3 = 1/(s + 4);
g4 = 1/s;
g5 = 5/(s + 7);
g6 = 1/(s^2 + 5*s + 10);
g7 = 3/(s + 2);
g8 = 1/(s + 6);
g9 = 1;

sys = append(g1, g2, g3, g4, g5, g6, g7, g8, g9);

rel = [1 9 -2 -5
       2 8 1 0
       3 1 8 0
       4 1 8 0
       5 3 4 -6
       6 7 0 0 
       7 3 4 -6
       8 7 0 0];
out = 7;
in = 9;

stsp = connect(sys, rel, in, out);

tfnc = tf(stsp)