close all;
syms s t K T A;
G_s = K / (T*s + 1);
step_input = A / s;
% Multiply G(s) by the step input (A / s) to get the system's response in Laplace domain
Y_s = step_input * G_s;
% inverse Laplace transform
y_t = ilaplace(Y_s, s, t);
disp('Time-domain response y(t):');
disp(y_t);
pretty(y_t)
