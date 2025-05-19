clear;
clc;

s = tf('s');
z = [.1 .2 .4 .7 1 2];

for n = [1:6]
    g(n) = 1/(s^2 + 2*z(n)*s + 1);
    % step(g, linspace(0, 10, 100));
end

step(g(1), g(2), g(3), g(4), g(5), g(6), linspace(0, 12, 1000));
% impulse(g(1), g(2), g(3), g(4), g(5), g(6), linspace(0, 12, 1000));
