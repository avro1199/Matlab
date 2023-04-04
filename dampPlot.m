clear;
clc;

syms x;

f(x) = 10^-(.2*x);
g(x) = 5*cos(15*x);
k(x) = f * g;

subplot(3,1,1);
fplot(f,Color='#dd0000', LineWidth=1);
legend 'e^-^a^t';
title ('dampPlot\_2020338004','Y₁ = e^-^a^t', Color='#bb0000');
subplot(3,1,2);
fplot(g, Color='#0055cc', LineWidth=1);
legend 'A cos(w_⁰t)';
title ('Y₂ = A cos(w_⁰t)', Color='#005588');
subplot(3,1,3);
fplot(k,Color='#880088', LineWidth=1);
legend 'e^-^a^t * Acos(w_⁰t)';
title ('Y = Y₁*Y₂', Color='#660066');