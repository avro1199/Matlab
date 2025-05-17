clear all;
clc;

k = [1/4, 1/16, 1];
s = tf('s');
w = linspace(0.1, 10, 10000);

for K = k
    M = K / ((s)^2 + s + K);
    step(M);
    hold on;
end