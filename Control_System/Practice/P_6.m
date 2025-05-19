clear;
clc;

syms s K;

G(s) = 2.5/(s*(s+5));
H(s) = 1/(0.1*s + 1);

M = K*G/(1+G*H);

% pretty(M);
pretty(simplify(M))