clear;
clc;

syms x f(x);

X = [50, 100, 300, 304, 305, 307, 315]; %additional value taken for 50, 100 & 315
Y = [1.698970004, 2, 2.477121255, 2.482873584, 2.484299839, 2.487138375, 2.498310554];

n = length(X);
f(x) = 0;    %initial sum zero

for i = 1:n
    term(i) = x/x;
    for j = 1:n
        if(j ~= i)
            term(i) = term(i) * ((x - X(j)) / (X(i) - X(j)));
        end
    end
    %f(x) = f(x) + term(i)*Y(i);  %done explicitly in a separate loop for better understanding
end

%this loop is not needed and we can get the thing done within the previous loop
for t = 1:n
    f(x) = f(x) + term(t)*Y(t);
end

while(1)
    value = input('Enter a Value : ');
    if (value == 0)
        break;
    else
        fprintf('Lagrange Result = %.9f\n', f(value));
        fprintf('Original Result = %.9f\n\n', log10(value));
    end
end
