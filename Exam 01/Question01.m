clear;
clc;

syms x f(x);

f(x) = x*log10(x) - 1.2;
y(x) = diff(f, x);

tol = 0.0001;
max_it = 100;
root(1) = 20;

for n = 1:max_it
    if (y(root(n)) == 0)
        fprintf(['Local Minima Reached !']);
        break;
    end
    root(n+1) = root(n) - (f(root(n))/y(root(n)));

    if(abs( root(n+1) - root(n) ) < tol)
        fprintf('Final Result = %f , Itereation Required = %d\n', root(n), n);
        break;
    end
end

fplot(f, LineWidth=1)
grid on
hold on

for j = 1:n   
    L = y(root(j))*(x-root(j)) + f(root(j));
    fplot(L)
    plot(root)
end
