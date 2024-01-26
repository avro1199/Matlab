clear;
clc;

syms x f(x);

X = [0, 1, 2, 5];
Y = [2, 3, 12, 147];

n = length(X);

f(x) = 0;

for i = 1:n
    term(i) = x/x;
    for j = 1:n
        if(j ~= i)
            term(i) = term(i) * ((x - X(j)) / (X(i) - X(j)));
        end
    end
    f(x) = f(x) + term(i)*Y(i);
end

fprintf('Interpolated Result f(3) = %f', f(3));
