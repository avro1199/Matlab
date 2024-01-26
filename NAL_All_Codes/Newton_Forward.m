clear;
clc;

syms x f(x);

X = [15,20,25,30,35,40];
Y = [0.2588190, 0.3420201, 0.4226183, 0.5, 0.5735764, 0.6427876];

n = length(X);

p = (x-X(1))/(X(n)-X(n-1));

del = zeros(n,n);

del(:,1) = Y';
for j = 2:n
    for i = 1:n-j+1
        del(i,j) = del(i+1,j-1) - del(i,j-1);
    end
end

term = p;
f(x) = Y(1);

for t=2:n
    f(x) = f(x) + term*del(1,t);
    term = term * (p-t+1)/t;
end

%f(x) = Y(1) + p*del(1,2) + p*(p-1)*del(1,3)/factorial(2) + p*(p-1)*(p-2)*del(1,4)/factorial(3) + p*(p-1)*(p-2)*(p-3)*del(1,5)/factorial(4) + p*(p-1)*(p-2)*(p-3)*(p-4)*del(1,6)/factorial(5);

while(1)
    value = input('Please Enter the value of X (Enter 0 to exit):');
    if(value == 0)
        break;
    else
        fprintf('Interpolation Result @(%.0f) => %.9f \n' , value, f(value));
        fprintf(' Original Result (Sin(%.0f)) => %.9f\n\n', value, sind(value));
    end
end