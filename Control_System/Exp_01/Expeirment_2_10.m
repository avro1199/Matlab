close all;
syms t s a b;
g_t = 1 + (b/(a - b)) * exp(-a * t) - (a/(a - b)) * exp(-b * t);
G_s = laplace(g_t, t, s);
G_s_simplified = simplify(G_s);
disp('Laplace Transform of g(t) (Simplified):');
disp(G_s_simplified);
pretty(G_s)
