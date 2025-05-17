clear all;
clc;

K = 0.25;
w = linspace(0.1, 10, 1000);


M = abs(K ./ ((j*w).^2 + j*w + K));
SMK = abs((j*w.*(j*w + 1)) ./ ((j*w).^2 + j*w + K));

plot(w, M, 'r', w, SMK, 'b', LineWidth=1);