clear;
clc;

syms x;
g(x) = x^3 + x^2 + x + 7;
y(x) = diff(g,x);

root = -2;

for i = 1:5
    if(y(root) == 0)
        break;
    end
    root = root - g(root)/y(root);
    fprintf('Root_%.2d = %.12f\n', i, root);
end