close all;
syms t s;
   %%% g(t) = 1 + (e^(-4t))/3 - (4*e^(-t))/3
g_t = 1 + (exp(-4*t))/3 - (4*exp(-t))/3;
    %  Laplace transform of g(t) using laplace function
G_s = laplace(g_t, t, s);
disp('Laplace Transform of g(t):');
disp(G_s);
pretty(G_s)
