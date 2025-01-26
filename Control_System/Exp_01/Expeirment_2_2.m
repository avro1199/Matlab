%%%  Finding of M(s)

%%%% Define G(s) = 1 / (500s^2)
numerator_G = [1];
denominator_G = [500, 0, 0];
G = tf(numerator_G, denominator_G);

%% Define H(s) = (s + 1) / (s + 2)
numerator_H = [1, 1];
denominator_H = [1, 2];
H = tf(numerator_H, denominator_H);

% Calculate M(s) = G(s) / (1 - G(s) * H(s))
M = G / (1 - G * H)