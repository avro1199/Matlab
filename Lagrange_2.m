clear;
clc;

x=[300, 304, 305, 307];
y=[2.4771, 2.4829, 2.4843, 2.4871];


n = length(x);

X=input('Enter the value of x: ');

result = 0;

for i=1:n
    numerator = 1;
    denominator = 1;

    for j=1:n
        if i~=j
            numerator = numerator*(X-x(j));
        end
        if i~=j
        denominator = denominator*(x(i)-x(j));
        end
    end
    result = result + numerator/denominator*y(i);
end


fprintf('Lagrange Result = %.5f\n',log10(X))
fprintf('Original Result = %.5f\n',result)