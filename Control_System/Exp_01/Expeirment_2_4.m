%% Partial Fraction
syms s K; %%%     symbolic variables
denominator = s * (s + 1) * (s^2 + 2 * s + 5);
numerator = K;
G = numerator / denominator;
%   partial fraction decomposition
G_partial = partfrac(G)
%%% Display the partial fraction form
disp('Partial Fraction Form in terms of K:');
pretty(G_partial);
%%% Substitute K = 5 and simplify
K_value = 5;
G_partial_K5 = subs(G_partial, K, K_value);
G_partial_K5 = simplify(G_partial_K5);
disp('Partial Fraction Form for K = 5:');
pretty(G_partial_K5);
%%% Counter check using numerical tf and residue function
num = [5]; % K = 5
den = [1, 3, 7, 5, 0]; % Expand (s * (s + 1) * (s^2 + 2s + 5))
[residues, poles, direct_term] = residue(num, den)
